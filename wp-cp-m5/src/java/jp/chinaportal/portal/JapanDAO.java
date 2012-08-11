/**
 * @author Samuel
 * provide DAO to connect database in  
 * Japan Transction (Both MAN and MySQL)
 */
package jp.chinaportal.portal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;

import jp.chinaportal.portal.bean.PaymentBean;
import jp.chinaportal.portal.common.CommonUtil;
import jp.chinaportal.portal.constant.JpConstant;
import net.sf.hibernate.Session;

import com.mediazone.dao.DAOException;
import com.mediazone.handler.UserEntitlementUpdateHandler;
import com.mediazone.util.Common;

public class JapanDAO {

    private static final Logger logs = LogsFile.getLogs(JapanDAO.class
            .getName());
    protected static javax.sql.DataSource ds = null;
    protected static Connection con = null;
    protected PreparedStatement ps;
    protected ResultSet rs;
    protected Session session;
    SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddHHmmss");

    static {
        try {
            /*
             * InitialContext initCtx = new InitialContext(); ds =
             * (javax.sql.DataSource) initCtx
             * .lookup("java:comp/env/jdbc/portal");
             */
            // Add property file
            String driverName = Common.mySQLResourcesBundle
                    .getString(JpConstant.DRIVER_NAME);
            // String driverName = "com.mysql.jdbc.Driver";

            // change to url + base+ .......
            String url = Common.mySQLResourcesBundle
                    .getString(JpConstant.MYSQL_URL);
            //String url = "jdbc:mysql://localhost:3306/cp_japan?" +
            //"user=japan&amp;password=crakfahr&amp;useUnicode=true&amp;characterEncoding=utf8";
            //String username = "japan";
            //String password = "crakfahr";

            Class.forName(driverName);
            // Driver driver = DriverManager.getDriver(url);
            con = DriverManager.getConnection(url);

        }
        catch (Exception ex) {
            logs.log(Level.SEVERE, "ERROR: " + "checkFiles()" + " "
                    + ex.toString());
            ex.printStackTrace();
        }
    }

    public boolean checkUser(String userid) throws DAOException, SQLException {

        String sql = "SELECT DISTINCT COUNT(*) FROM user "
                + " WHERE UPPER(user_id) = '" + userid.toUpperCase() + "'";

        rs = executeQuery(sql);

        int userAccount = 0;
        rs.next();
        userAccount = rs.getInt(1);
        rs.close();

        if (userAccount > 0)
            return true;
        else
            return false;
    }

    public boolean retrievePackageItems(String pack, PaymentBean bean)
            throws DAOException, SQLException {

        String sql = "SELECT account_id, item_id, channel_id, duration_time FROM package_code_exchange "
                + " WHERE UPPER(japan_code) = '" + pack.toUpperCase() + "'";

        rs = executeQuery(sql);
        int mark = 0;
        while (rs.next()) {
            bean.setAccountID(rs.getString("account_id"));
            bean.setItemID(rs.getString("item_id"));
            bean.setChannelID(rs.getString("channel_id"));
            bean.setNumOfDays(rs.getInt("duration_time"));
            mark++;
            //                  
        }
        rs.close();
        if (mark > 0)
            return true;
        else
            return false;
    }

    private void checkTime(String pack, PaymentBean bean) {
        try {
            Date beginDate = bean.getProcessTime();
            bean.setBeginDate(bean.getProcessTime());

            String sql = "SELECT MAX(a.purchase_time) t , b.duration_time FROM payments a , package_code_exchange b "
                    + " WHERE a.package_item = b.japan_code AND UPPER(a.user_id) = '"
                    + bean.getUserid().toUpperCase()
                    + "' AND UPPER(a.package_item) = '"
                    + pack.toUpperCase()
                    + "' " + " GROUP BY a.user_id";
            rs = executeQuery(sql);

            while (rs.next()) {
                Date tempDate = rs.getDate("t");
                int days = rs.getInt("b.duration_time");
                Date expiredDate = setEndDate(tempDate, days);

                if (expiredDate.compareTo(beginDate) > 0) {
                    bean.setBeginDate(expiredDate);
                }

            }
            rs.close();
        }
        catch (Exception e) {
            e.printStackTrace();
            logs.log(Level.WARNING, "ERROR: " + "checkTime()" + " "
                    + e.toString());
        }

    }

    private void checkDup(String pack, PaymentBean bean) {
        int mark = 0;
        try {
            String sql = "SELECT user_id, purchase_time, package_item from payments WHERE "
                    + "UPPER(user_id) = '"
                    + bean.getUserid().toUpperCase()
                    + "' AND purchase_time = '"
                    + bean.getProcessTime()
                    + "' AND UPPER(package_item) = '"
                    + pack.toUpperCase()
                    + "'";
            rs = executeQuery(sql);

            while (rs.next()) {
                mark++;
            }
            rs.close();
        }
        catch (Exception e) {
            e.printStackTrace();
            logs.log(Level.WARNING, "ERROR: " + "checkTime()" + " "
                    + e.toString());
        }
        if (mark > 0)
            logs.log(Level.WARNING, "ERROR: " + "Duplicated" + " " + " "
                    + bean.getUserid() + ", " + bean.getPackages());

    }

    private ResultSet executeQuery(String sql) throws DAOException,
            SQLException {
        try {
            // if (con == null || con.isClosed())
            // con = ds.getConnection();
            ps = con.prepareStatement(sql);
            Statement statement = con.createStatement();
            // rs = ps.executeQuery();
            rs = statement.executeQuery(sql);

        }
        catch (Exception ex) {
            logs.log(Level.WARNING, "ERROR: " + "executeQuery()" + " "
                    + ex.toString());
            throw new DAOException(ex);

        }
        return rs;
    }

    /*
     * private int insert(String sql) throws DAOException, SQLException { int
     * rows; try { if (con == null || con.isClosed()) con = ds.getConnection();
     * ps = con.prepareStatement(sql); rows = ps.executeUpdate(sql); } catch
     * (Exception ex) { throw new DAOException(ex); } return rows; }
     */

    public boolean updateMySQL(PaymentBean bean) throws DAOException {
        try {
            // update payment TABLE
            String sql = "INSERT INTO payments ( user_id,"
                    + " purchase_time, package_item, payment, remarks )VALUE "
                    + "(?,?,?,?,?) ";
            int row = 0;

            if (!CommonUtil.checkEmptyString(bean.getPackages())
                    && bean.getPackages().indexOf("_") > -1) {
                List packs = new ArrayList();

                /*
                 * If more than one package at same time, the cost will be
                 * divided ( bean.payment )
                 */
                double totalCost = bean.getPayment();
                packs = getPackages(bean.getPackages());
                for (int i = 0; i < packs.size(); i++) {
                    boolean mark = true;
                    checkDup((String) packs.get(i), bean);

                    //                  get the pakcage name
                    if (!retrievePackageItems((String) packs.get(i), bean)) {
                        bean.setRemark("Package name is not correct: "
                                + (String) packs.get(i));
                        mark = false;
                    }

                    checkTime((String) packs.get(i), bean);
                    double storeCost = 0;
                    double divCost = checkPrice((String) packs.get(i));
                    if ((totalCost - divCost) < 0 || i == packs.size() - 1) {
                        storeCost = totalCost;
                    }
                    else {
                        storeCost = divCost;
                    }
                    totalCost = totalCost - divCost;

                    ps = con.prepareStatement(sql);
                    ps.setString(1, bean.getUserid());
                    ps.setTimestamp(2, new Timestamp(bean.getBeginDate()
                            .getTime()));
                    ps.setString(3, ((String) packs.get(i)).toUpperCase());
                    ps.setDouble(4, storeCost);

                    ps.setString(5, bean.getRemark());
                    ps.executeUpdate();

                    if (mark)
                        updateMAN(bean);
                }

            }

            else {
                boolean mark = true;
                checkDup(bean.getPackages(), bean);
                if (!retrievePackageItems(bean.getPackages(), bean)) {
                    bean.setRemark("Package name is not correct: "
                            + bean.getPackages());
                    mark = false;
                }

                checkTime(bean.getPackages(), bean);
                ps = con.prepareStatement(sql);
                ps.setString(1, bean.getUserid());
                ps
                        .setTimestamp(2, new Timestamp(bean.getBeginDate()
                                .getTime()));
                ps.setString(3, bean.getPackages().toUpperCase());
                ps.setDouble(4, bean.getPayment());

                ps.setString(5, bean.getRemark());
                ps.executeUpdate();

                if (mark)
                    updateMAN(bean);

                double price = checkPrice(bean.getPackages());
                if (price != bean.getPayment()) {
                    updatePrice(bean.getPackages(), bean.getPayment());
                }

                //              
            }

            if (row == 1)
                return true;
            else {
                // log the file
                return false;
            }

        }
        catch (Exception e) {
            logs.log(Level.WARNING, "ERROR: " + "updateMySQL()" + " "
                    + bean.getUserid() + " " + bean.getPackages()
                    + e.toString());
            throw new DAOException(e);
        }
    }

    public boolean insertMySQL(PaymentBean bean) throws DAOException {

        try {
            // insert into user TABLE
            String sql = "INSERT INTO user ( user_id,"
                    + "password )VALUE (?,?) ";
            ps = con.prepareStatement(sql);
            ps.setString(1, bean.getUserid());
            ps.setString(2, bean.getPassword());

            int row = ps.executeUpdate();

            if (row == 1)
                return true;
            else {
                // log file
                return false;
            }

        }

        catch (Exception ex) {
            logs.log(Level.WARNING, "ERROR: " + bean.getUserid()
                    + " insertMySQL()" + " " + ex.toString());
        }

        return true;
    }

    private void updateMAN(PaymentBean bean) {
        //update to MAN
        //email and last name and first name is same

        bean.setEmail(bean.getUserid());

       
        

        bean.setEndDate(setEndDate(bean.getBeginDate(), bean.getNumOfDays()));

        UserEntitlementUpdateHandler ent = new UserEntitlementUpdateHandler();

        try {
            
            ent.updateAddUserEntitlement(bean.getEmail(), bean.getAccountID(),
                    bean.getItemID(), bean.getChannelID(), setStartDate(bean.getProcessTime(), -1), bean.getEndDate());
        }
        catch (Exception e) {
            e.printStackTrace();
            logs.log(Level.WARNING, "ERROR: " + "updateMAN() "
                    + bean.getUserid() + " " + bean.getPackages() + " "
                    + e.toString());
        }
    }

    private List getPackages(String pack) {
        List res = new ArrayList();
        if (!CommonUtil.checkEmptyString(pack) && pack.indexOf("_") > -1) {
            while (!CommonUtil.checkEmptyString(pack)) {
                int index = pack.indexOf("_");
                if (pack.indexOf("_") > -1)
                    res.add(pack.substring(0, index));
                else
                    res.add(pack);

                if (pack.indexOf("_") == -1)
                    break;

                pack = pack.substring(index + 1, pack.length());
            }
        }
        return res;
    }

    public static Date setEndDate(Date d, int numDays) {
        // Get a Calendar for current locale and time zone
        Date temp = new Date(d.getTime());
        Calendar cal = Calendar.getInstance();
        cal.setTimeInMillis(temp.getTime()); // Set it in the Calendar object
        cal.add(Calendar.DATE, numDays); // Add 30 days
        Date endDay = new Date(cal.getTimeInMillis());

        return endDay;
    }
    
    private static Date setStartDate(Date d, int numDays) {
        // Get a Calendar for current locale and time zone
        Date temp = new Date(d.getTime());
        Calendar cal = Calendar.getInstance();
        cal.setTimeInMillis(temp.getTime()); // Set it in the Calendar object
        cal.roll(Calendar.DAY_OF_MONTH, numDays);
        Date endDay = new Date(cal.getTimeInMillis());

        return endDay;
    }

    private double checkPrice(String pack) throws DAOException {
        // check the price in package_price table
        double price = 0;

        String checkSql = "SELECT price FROM package_price"
                + " WHERE UPPER(japan_code) = '" + pack.toUpperCase() + "'";
        try {
            rs = executeQuery(checkSql);
            while (rs.next()) {
                price = rs.getDouble("price");

            }
        }
        catch (Exception e) {
            logs.log(Level.WARNING, "ERROR: " + "checkPrice()" + " "
                    + e.toString());
        }
        return price;

    }

    private double updatePrice(String pack, double price) throws DAOException {
        // update package_price table

        String updateSql = "UPDATE package_price "
                + "SET price = ? WHERE japan_code = ?";

        try {
            ps = con.prepareStatement(updateSql);

            ps.setDouble(1, price);
            ps.setString(2, pack);
            ps.executeUpdate();
        }
        catch (Exception e) {
            logs.log(Level.WARNING, "ERROR: " + "updatePrice()" + " "
                    + e.toString());
        }
        return price;

    }
}
