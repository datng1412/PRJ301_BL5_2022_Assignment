/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import Helper.DateTimeHelper;
import java.util.Date;

/**
 *
 * @author Tom
 */
public class RequestToLeave {

    private int reqid;
    private Employee employee;
    private int receiver;
    private Date from;
    private Date to;
    private int type;
    private String reason;
    private Boolean accept;
    private Symbol symbol;

    public float getDays() {
        if (accept = true) {
            if (DateTimeHelper.getDayOfWeek(from) == 7) {
                if (type == 2 || type == 3 || type == 4 || type == 5) {
                    return DateTimeHelper.diffHours(to, from) / 48;
                }
            }else
                if (type == 2 || type == 3 || type == 4 || type == 5) {
                    return DateTimeHelper.diffHours(to, from) / 24;
                }
        }
        return 0;
    }

    @Override
    public String toString() {
        return "RequestToLeave{" + "reqid=" + reqid + ", receiver=" + receiver + ", from=" + from + ", to=" + to + ", type=" + type + ", reason=" + reason + ", accept=" + accept + '}';
    }

    public Symbol getSymbol() {
        return symbol;
    }

    public String getSymbolAll() {
        return symbol.getAllday();
    }

    public String getSymbolHalf() {
        return symbol.getHalfday();
    }

    public String getSymbolSat() {
        return symbol.getSaturday();
    }

    public void setSymbol(Symbol symbol) {
        this.symbol = symbol;
    }
    private Date fromRemove;
    private Date toRemove;

    public Date getFromRemove() {
        return DateTimeHelper.removeTime(from);
    }

    public Date getToRemove() {
        return DateTimeHelper.removeTime(DateTimeHelper.addTicks(to, -1000));
    }

    public int getReqid() {
        return reqid;
    }

    public void setReqid(int reqid) {
        this.reqid = reqid;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public int getReceiver() {
        return receiver;
    }

    public void setReceiver(int receiver) {
        this.receiver = receiver;
    }

    public Date getFrom() {
        return from;
    }

    public void setFrom(Date from) {
        this.from = from;
    }

    public Date getTo() {
        return to;
    }

    public void setTo(Date to) {
        this.to = to;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public Boolean getAccept() {
        return accept;
    }

    public void setAccept(Boolean accept) {
        this.accept = accept;
    }

}
