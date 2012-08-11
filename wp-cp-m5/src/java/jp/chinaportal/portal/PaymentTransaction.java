/*
 * Created on 2005-12-06
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package jp.chinaportal.portal;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.RandomAccessFile;
import java.nio.channels.FileChannel;
import java.nio.channels.FileLock;
import java.nio.channels.OverlappingFileLockException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

import jp.chinaportal.portal.bean.PaymentBean;
import jp.chinaportal.portal.common.CommonUtil;
import jp.chinaportal.portal.constant.JpConstant;

import com.mediazone.util.Common;

/**
 * @author Samuel
 * 
 * TODO To change the template for this generated type comment go to Window -
 * Preferences - Java - Code Style - Code Templates
 */
public class PaymentTransaction {

    private static final Logger logs = LogsFile
            .getLogs(PaymentTransaction.class.getName());
    static final String INCOMEFOLDERPATH = Common.mySQLResourcesBundle
            .getString(JpConstant.IMCOME_FOLDER);
    static final String PROCESSFOLDERPATH = Common.mySQLResourcesBundle
            .getString(JpConstant.PROCESS_FOLDER);
    static final String OUTGOINGFOLDERPATH = Common.mySQLResourcesBundle
            .getString(JpConstant.OUTPUT_FOLDER);
    static final String SAVEFOLDERPATH = Common.mySQLResourcesBundle
            .getString(JpConstant.SAVE_FOLDER);
    static final String COMPLETEFOLDERPATH = Common.mySQLResourcesBundle
            .getString(JpConstant.COMPLETE_FOLDER);
    static SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddHHmmss");

    public static boolean checkFiles() {
        File[] files;
        FileLock lock;
        FileChannel channel;
        try {

            // Move all of the files to process folder
            File inputFile = new File(INCOMEFOLDERPATH);
            
            
            files = inputFile.listFiles();
           
            for (int i = 0; i < files.length; i++) {

                File tempFile = files[i];
                // Check the file locked or not
                channel = new RandomAccessFile(tempFile, "rw").getChannel();
                try {
                    lock = channel.tryLock();
                }
                catch (OverlappingFileLockException oe) {
                    // break the loop
                    continue;
                }
                // Release the lock
                lock.release();
                // Close the file
                channel.close();

                String fileName = tempFile.getName();
                //copy to save folder
                moveFile(fileName, SAVEFOLDERPATH, tempFile);
                // Move all of the files to process folder
                if (moveFile(fileName, PROCESSFOLDERPATH, tempFile)) {
                    tempFile.delete();
                }

                // read in process folder
                tempFile = new File(PROCESSFOLDERPATH + File.separator + fileName);
                FileReader in = new FileReader(tempFile);
                BufferedReader readin = new BufferedReader(in);
                ArrayList beans = new ArrayList();
                String str;
                while ((str = readin.readLine()) != null) {

                    int index = str.indexOf(",");
                    if (index > -1) {
                        PaymentBean bean = new PaymentBean();
                        bean.setUserid(str.substring(0, index));
                        str = str.substring(index + 1, str.length());
                        index = str.indexOf(",");

                        bean.setProcessTime(sf.parse(str.substring(0, index)));
                        str = str.substring(index + 1, str.length());
                        index = str.indexOf(",");

                        bean.setPackages(str.substring(0, index));
                        str = str.substring(index + 1, str.indexOf(";"));

                        bean.setPayment(CommonUtil.parseDouble(str));
                        // index = str.indexOf(",");
                        beans.add(bean);
                    }

                }
                readin.close();
                in.close();
                // Save to database for one file
                DatabaseProcess.updateUser(beans);
                generateFile(beans, tempFile);

            }

        }
        catch (Exception e) {
            logs.log(Level.SEVERE, "ERROR: " + "checkFiles()" + " "
                    + e.toString());
            e.printStackTrace();
        }

        return true;
    }

    public static boolean moveFile(String inFile, String dirs, File src) {
        File file = new File(inFile);

        // Destination directory
        File dir = new File(dirs);

        // Move file to new directory

        try {
            File b = new File(dir, file.getName());
            b.createNewFile();
            InputStream in = new FileInputStream(src);
            OutputStream out = new FileOutputStream(b);

            // Transfer bytes from in to out
            byte[] buf = new byte[1024];
            int len;
            while ((len = in.read(buf)) > 0) {
                out.write(buf, 0, len);
            }
            in.close();
            out.close();
            return true;

        }

        catch (Exception e) {
            logs.log(Level.SEVERE, "ERROR: " + "moveFile()" + " "
                    + e.toString());

            return false;
        }
    }

    public static void generateFile(ArrayList beans, File file) {
        // CommonUtil.moveFile(file.getAbsolutePath(), OUTGOINGFOLDERPATH,
        // file);
        String newName = "Result"
                + file.getName().substring(4, file.getName().length());
        File f = new File(OUTGOINGFOLDERPATH + File.separator + newName);

        try {
            f.createNewFile();
        }
        catch (IOException ie) {
            logs.log(Level.WARNING, "ERROR: " + "generateFile()"
                    + file.getName() + " " + ie.toString());
        }

        try {
            BufferedWriter out = new BufferedWriter(new FileWriter(f));
            for (int i = 0; i < beans.size(); i++) {
                PaymentBean bean = new PaymentBean();
                bean = (PaymentBean) beans.get(i);
                out.write(1 + ",");
                out.write(bean.getUserid() + ",");
                out.write(CommonUtil.convertNullToEmpty(bean.getPassword())
                        + ",");
                out.write(sf.format(bean.getProcessTime()) + ",");
                out.write(bean.getPackages() + ",");
                out.write(bean.getPayment() + ";");
                out.write("\n");
            }
            out.close();
        }
        catch (IOException e) {
            logs.log(Level.WARNING, "ERROR: " + "generateFile()" + " "
                    + e.toString());
        }

    }

    public static void deleteFileInProcess() {
        // move files to outgoing folder
        File inputFile = new File(PROCESSFOLDERPATH);
        File[] files = null;
        files = inputFile.listFiles();
        for (int i = 0; i < files.length; i++) {
            File f = files[i];
            f.delete();
        }
    }

    public static void copyToComplete() {
        // move files to outgoing folder
        File inputFile = new File(OUTGOINGFOLDERPATH);
        File[] files = null;
        files = inputFile.listFiles();
        for (int i = 0; i < files.length; i++) {
            File f = files[i];
            String fileName = f.getName();
            if (CommonUtil.moveFile(fileName, COMPLETEFOLDERPATH, f)) {
                // don't need to delete file in output folder
            }
        }
    }

    /**
     * @param args
     */
    public static void main(String[] args) {
        System.out.println("Start loading PaymentTransaction: "
                + sf.format(new Date()));
        checkFiles();
        deleteFileInProcess();
        copyToComplete();

        System.out.println("Complete PaymentTransaction: "
                + sf.format(new Date()));
    }
}
