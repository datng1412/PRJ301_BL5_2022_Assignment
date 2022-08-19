/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import Helper.DateTimeHelper;
import java.util.ArrayList;
import java.util.Date;
/**
 *
 * @author Ngo Tung Son
 */
public class Employee {

    private int id;
    private String name;
    private Date startDate;
    private String sex;
    private String contractType;
    private String phone;
    private float salary;
    
    public float getCurrentYear() {
        return DateTimeHelper.getTodayYear();
    }

    public Date getStartDate() {
        return DateTimeHelper.removeTime(startDate);
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getContractType() {
        return contractType;
    }

    public void setContractType(String contractType) {
        this.contractType = contractType;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public float getSalary() {
        return salary;
    }

    public void setSalary(float salary) {
        this.salary = salary;
    }

    public ArrayList<AnnualLeave> getAnnualLeaves() {
        return annualLeaves;
    }

    public void setAnnualLeaves(ArrayList<AnnualLeave> annualLeaves) {
        this.annualLeaves = annualLeaves;
    }

    public ArrayList<RequestToLeave> getReqToLeaves() {
        return reqToLeaves;
    }

    public void setReqToLeaves(ArrayList<RequestToLeave> reqToLeaves) {
        this.reqToLeaves = reqToLeaves;
    }

    public Team getTeam() {
        return team;
    }

    public void setTeam(Team team) {
        this.team = team;
    }

    public String getDeptName() {
        return getDepartment().getDpname();
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }
    private ArrayList<TimeSheet> timesheets = new ArrayList<>();
    private ArrayList<AnnualLeave> annualLeaves = new ArrayList<>();
    private ArrayList<RequestToLeave> reqToLeaves = new ArrayList<>();
    private Team team;
    private Department department;

    public float getWorkingHours() {
        float sum = 0;
        for (TimeSheet timesheet : timesheets) {
            sum += timesheet.getWorkingHours();
        }
        return sum;
    }

    public int getWorkingDays() {
        return timesheets.size();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public ArrayList<TimeSheet> getTimesheets() {
        return timesheets;
    }

    public void setTimesheets(ArrayList<TimeSheet> timesheets) {
        this.timesheets = timesheets;
    }

}
