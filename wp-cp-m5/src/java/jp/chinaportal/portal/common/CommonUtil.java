package jp.chinaportal.portal.common;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.security.SecureRandom;
import java.util.Random;

public class CommonUtil {

    /**
     * Parse a String object to double.
     * Return 0 when string is not a numberic.
     * 
     * @return      String double
     */
    public static double parseDouble(String s) {

        try {
            return Double.parseDouble(s);
        }
        catch (Exception e) {
            return 0;
        }
    }

    /**
     * Change null String to ""
     * 
     * @return      String
     */
    public static String convertNullToEmpty(String s) {

        if (s == null || s.length() == 0)
            return "";
        else
            return s;
    }

    /**
     * Generate a random pasword in 10 numbers & letters.
     * 
     * @return      String password
     */
    public static String generatePassword() {
         Random randNum = new Random();
        String password = "";
        int number = 7;
        number = randNum.nextInt(9);
        SecureRandom rand;
        try {
            rand = SecureRandom.getInstance("SHA1PRNG");
            String base = "qwertyuiopasdfghjklzxcvbnm1234567890AQWERTYUIOPSDFGHJKLMNBVCXZ";

            for (int w = 0; w < 9; w++) {
                int i = rand.nextInt(60);
                password = password + base.substring(i, i + 1);
            }
            password = password + String.valueOf(number);
        }
        catch (Exception e) {
        }
        return password;
    }

    /**
     * Returns boolean that check the String object null or empty. 
     * If the string is empty or null, the return will be true.
     *
     * @param  String  string object
     * @return  <code>true</code> if the String is empty;
     * <code>false</code> otherwise.

     */

    public static boolean checkEmptyString(String s) {
        if (s == null || s.length() == 0) {
            return true;
        }
        else
            return false;
    }

    /**
     * Copy one file to another directory.
     *
     * @param  String  file path
     * @param  String  Folder path
     * @param  String  File file
     * @return      boolean
     */
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
            System.out.println(e.toString());
            // log the file

            return false;
        }
    }
}
