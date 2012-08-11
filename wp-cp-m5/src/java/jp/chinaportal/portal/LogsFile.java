/**
 * 
 */
package jp.chinaportal.portal;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.FileHandler;
import java.util.logging.Logger;

/**
 * @author Samuel Chan
 * 
 */
public class LogsFile {
    public static Logger getLogs(String fileName) {
        Logger logger = Logger.getLogger(LogsFile.class.getName());
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
        try {
            // Create a file handler that write log record to a file called
            // my.log
            Date dateTime = new Date();
            FileHandler handler = new FileHandler("log/japan_portal-"
                    + sf.format(dateTime) + ".log", true);

            // Add to the desired logger
            logger = Logger.getLogger(fileName);
            logger.addHandler(handler);

        }
        catch (IOException e) {
            e.printStackTrace();
        }
        return logger;
    }

}
