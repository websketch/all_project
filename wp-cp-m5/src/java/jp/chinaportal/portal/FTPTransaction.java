/**
 * 
 */
package jp.chinaportal.portal;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

import jp.chinaportal.portal.common.CommonUtil;
import jp.chinaportal.portal.constant.JpConstant;

import org.jibble.simpleftp.SimpleFTP;

import com.mediazone.util.Common;

/**
 * @author Samuel Chan
 * 
 */
public class FTPTransaction {
    
    private static final Logger logs = LogsFile.getLogs(FTPTransaction.class.getName());
    
    private static String server = Common.mySQLResourcesBundle
            .getString(JpConstant.FTP_SERVER);
    private static int port = 21;
    private static String username = Common.mySQLResourcesBundle
            .getString(JpConstant.FTP_USERNAME);
    private static String password = Common.mySQLResourcesBundle
            .getString(JpConstant.FTP_PASSWORD);
    private static String processFolderPath = Common.mySQLResourcesBundle
            .getString(JpConstant.PROCESS_FOLDER);
    private static String outgoingFolderPath = Common.mySQLResourcesBundle
            .getString(JpConstant.OUTPUT_FOLDER);
    private static String completeFolderPath = Common.mySQLResourcesBundle
            .getString(JpConstant.COMPLETE_FOLDER);

    static SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddHHmmss");

    public static void sendFile() {
        try {
            SimpleFTP ftp = new SimpleFTP();
            // Connect to an FTP server on port 21.
            ftp.connect(server, port, username, password);
            // Set binary mode.
            ftp.bin();

            // Change to a new working directory on the FTP server.
            ftp.cwd("japantest");

            // Upload some files.
            File file = new File("D:\\TEST\\CSV\\outgoing");
            File[] files = file.listFiles();
            for (int i = 0; i < files.length; i++) {
                File tempFile = files[i];
                // String fileName = tempFile.getName();
                ftp.stor(tempFile);
            }

            // You can also upload from an InputStream, e.g.
            // ftp.stor(new FileInputStream(new File("test.png")), "test.png");
            // ftp.stor(someSocket.getInputStream(), "blah.dat");
            // Quit from the FTP server.
            ftp.disconnect();
        }
        catch (IOException e) {
            // Jibble.
            e.printStackTrace();
        }
    }

    public static void copyToOutgoing() {
        // move files to outgoing folder
        File inputFile = new File(processFolderPath);
        File[] files = null;
        files = inputFile.listFiles();
        for (int i = 0; i < files.length; i++) {
            File f = files[i];
            String fileName = f.getName();
            if (CommonUtil.moveFile(fileName, outgoingFolderPath, f)) {

                f.delete();
            }
        }
    }

    public static void copyToComplete() {
        // move files to outgoing folder
        File inputFile = new File(outgoingFolderPath);
        File[] files = null;
        files = inputFile.listFiles();
        for (int i = 0; i < files.length; i++) {
            File f = files[i];
            String fileName = f.getName();
            if (CommonUtil.moveFile(fileName, completeFolderPath, f)) {

                f.delete();
            }
        }
    }
    
    public static void testLog() {
       //logs.info("info");
       //logs.fine("fine");
       logs.log(Level.WARNING, "log warning message");
       logs.log(Level.INFO, "info message");

    }
       

    /**
     * @param args
     */
    public static void main(String[] args) {
        // TODO Auto-generated method stub
        System.out.println("Start loading FTPTransaction: "
                + sf.format(new Date()));
        testLog();
        //sendFile();
        //copyToComplete();
        System.out.println("Complete fTP: " + sf.format(new Date()));

    }

}
