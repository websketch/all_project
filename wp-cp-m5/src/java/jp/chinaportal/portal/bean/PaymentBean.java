/**
 * 
 */
package jp.chinaportal.portal.bean;

import java.io.Serializable;
import java.util.Date;

/**
 * @author Samuel
 *
 */
public class PaymentBean implements Serializable {
    private String userid;
    private String password;
    private Date processTime;
    private String packages;
    private String remark;
    private double payment;
    private String email;
    private String accountID;
    private String itemID;
    private String channelID;
    private Date beginDate;
    private Date endDate;
    private int numOfDays;
    
    private String fileName;
    /**
     * @return Returns the fileName.
     */
    public String getFileName() {
        return fileName;
    }
    /**
     * @param fileName The fileName to set.
     */
    public void setFileName(String fileName) {
        this.fileName = fileName;
    }
    /**
     * @return Returns the packages.
     */
    public String getPackages() {
        return packages;
    }
    /**
     * @param packages The packages to set.
     */
    public void setPackages(String packages) {
        this.packages = packages;
    }
    /**
     * @return Returns the password.
     */
    public String getPassword() {
        return password;
    }
    /**
     * @param password The password to set.
     */
    public void setPassword(String password) {
        this.password = password;
    }
    /**
     * @return Returns the payment.
     */
    public double getPayment() {
        return payment;
    }
    /**
     * @param payment The payment to set.
     */
    public void setPayment(double payment) {
        this.payment = payment;
    }
    /**
     * @return Returns the processTime.
     */
    public Date getProcessTime() {
        return processTime;
    }
    /**
     * @param processTime The processTime to set.
     */
    public void setProcessTime(Date processTime) {
        this.processTime = processTime;
    }
    /**
     * @return Returns the remark.
     */
    public String getRemark() {
        return remark;
    }
    /**
     * @param remark The remark to set.
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }
    /**
     * @return Returns the userid.
     */
    public String getUserid() {
        return userid;
    }
    /**
     * @param userid The userid to set.
     */
    public void setUserid(String userid) {
        this.userid = userid;
    }
    /**
     * @return Returns the accountID.
     */
    public String getAccountID() {
        return accountID;
    }
    /**
     * @param accountID The accountID to set.
     */
    public void setAccountID(String accountID) {
        this.accountID = accountID;
    }
    /**
   
    
    /**
     * @return Returns the channelID.
     */
    public String getChannelID() {
        return channelID;
    }
    /**
     * @param channelID The channelID to set.
     */
    public void setChannelID(String channelID) {
        this.channelID = channelID;
    }
    /**
     * @return Returns the email.
     */
    public String getEmail() {
        return email;
    }
    /**
     * @param email The email to set.
     */
    public void setEmail(String email) {
        this.email = email;
    }
    /**
     * @return Returns the endDate.
     */
    public Date getEndDate() {
        return endDate;
    }
    /**
     * @param endDate The endDate to set.
     */
    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }
    /**
     * @return Returns the itemID.
     */
    public String getItemID() {
        return itemID;
    }
    /**
     * @param itemID The itemID to set.
     */
    public void setItemID(String itemID) {
        this.itemID = itemID;
    }
    /**
     * @return Returns the numOfDays.
     */
    public int getNumOfDays() {
        return numOfDays;
    }
    /**
     * @param numOfDays The numOfDays to set.
     */
    public void setNumOfDays(int numOfDays) {
        this.numOfDays = numOfDays;
    }
    /**
     * @return Returns the beginDate.
     */
    public Date getBeginDate() {
        return beginDate;
    }
    /**
     * @param beginDate The beginDate to set.
     */
    public void setBeginDate(Date beginDate) {
        this.beginDate = beginDate;
    }
    
    

}
