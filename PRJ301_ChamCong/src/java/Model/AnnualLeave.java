/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Tom
 */
public class AnnualLeave {

    private int year;
    private Employee eid;
    private int aid;
    private float annualLeave;
    
    public int getAid() {
        return aid;
    }

    public void setAid(int aid) {
        this.aid = aid;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public Employee getEid() {
        return eid;
    }

    public void setEid(Employee eid) {
        this.eid = eid;
    }

    public float getAnnualLeave() {
        return annualLeave;
    }

    public void setAnnualLeave(float annualLeave) {
        this.annualLeave = annualLeave;
    }
    
}
