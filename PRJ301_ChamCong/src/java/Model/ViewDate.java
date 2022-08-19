/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import Helper.DateTimeHelper;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author Tom
 */
public class ViewDate {
    private Date value;
    private int dow;
    //RemoveTime already
    public Date getValue() {
        return value;
    }
    //Without remove time

    public void setValue(Date value) {
        this.value = value;
    }

    public int getDow() {
        return DateTimeHelper.getDayOfWeek(value);
    }
    
    
    
}
