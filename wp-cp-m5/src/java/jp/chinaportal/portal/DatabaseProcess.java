package jp.chinaportal.portal;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

import jp.chinaportal.portal.bean.PaymentBean;
import jp.chinaportal.portal.common.CommonUtil;

import com.mediazone.bean.User;
import com.mediazone.dao.DAOException;
import com.mediazone.handler.UserEntitlementUpdateHandler;
import com.mediazone.man.form.UserRegisterForm;

public class DatabaseProcess {
    public static JapanDAO dao;
    private static final Logger logs = LogsFile.getLogs(DatabaseProcess.class
            .getName());

    public static void updateUser(ArrayList beans) throws DAOException,
            SQLException {
        dao = new JapanDAO();

        for (int i = 0; i < beans.size(); i++) {
            PaymentBean bean = (PaymentBean) beans.get(i);
            JapanManDAO jd = new JapanManDAO();
            try {
                UserRegisterForm formBean = new UserRegisterForm();
                if (!dao.checkUser(bean.getUserid())) {

                    bean.setPassword(CommonUtil.generatePassword());

                    // insert into MySQL
                    dao.insertMySQL(bean);
                    beans.set(i, bean);

                    // insert into MAN
                    User user = jd.getMANUserInfo(bean.getUserid());
                    if (CommonUtil.checkEmptyString(user.getManUserId())) {

                        formBean.setLastName(bean.getUserid());
                        formBean.setFirstName(bean.getUserid());
                        formBean.setEmail(bean.getUserid());
                        formBean.setSecurePassword(bean.getPassword());

                        jd.registerUser(formBean);
                    }

                }
                dao.updateMySQL(bean);
                
                
            }
            catch (Exception e) {
                logs.log(Level.SEVERE, "ERROR: " + "updateUser()" + " "
                        + e.toString());
                throw new DAOException(e);
            }

        }
    }

    

}
