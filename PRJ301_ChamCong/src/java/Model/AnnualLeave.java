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
    private float annualLeave1;
        private float annualLeave2;

    
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

    public float getAnnualLeave1() {
        return annualLeave1;
    }

    public void setAnnualLeave1(float annualLeave1) {
        this.annualLeave1 = annualLeave1;
    }

    public float getAnnualLeave2() {
        return annualLeave2;
    }

    public void setAnnualLeave2(float annualLeave2) {
        this.annualLeave2 = annualLeave2;
    }
    
}
