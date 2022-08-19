/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import Helper.DateTimeHelper;
import java.math.BigInteger;
import java.util.Date;

/**
 *
 * @author Ngo Tung Son
 */
public class TimeSheet {
    private int tid;
    private Employee employee;
    private Date checkin;
    private Date checkout;
    private Date cidate;
    private int late;
    private Period period;

    public Period getPeriod() {
        return period;
    }

    public void setPeriod(Period period) {
        this.period = period;
    }
    
    public int getLate() {
        return late;
    }

    public void setLate(int late) {
        this.late = late;
    }

    public Date getCidate() {
        return DateTimeHelper.removeTime(checkin);
    }
    
    public float getWorkingHours()
    {
        return DateTimeHelper.diffHours(checkout, checkin);
    }

    public int getTid() {
        return tid;
    }

    public void setTid(int tid) {
        this.tid = tid;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public Date getCheckin() {
        return checkin;
    }

    public void setCheckin(Date checkin) {
        this.checkin = checkin;
    }

    public Date getCheckout() {
        return checkout;
    }

    public void setCheckout(Date checkout) {
        this.checkout = checkout;
    }

    
}
