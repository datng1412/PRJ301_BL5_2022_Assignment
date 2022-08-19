/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import Helper.DateTimeHelper;
import Model.AnnualLeave;
import Model.Employee;
import Model.TimeSheet;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Tom
 */
public class EmployeeDBContext extends DBContext {

    public ArrayList<Employee> getEmps(Date from, Date to, int year) {
        ArrayList<Employee> emps = new ArrayList<>();
        DepartmentDBContext db = new DepartmentDBContext();
        try {
//            String sql = "SELECT e.eid,e.ename,ISNULL(t.tid,-1) tid,\n"
//                    + "t.checkin,t.checkout\n"
//                    + "FROM Employee e LEFT JOIN \n"
//                    + "(SELECT * FROM TimeSheet WHERE checkin >= ?\n"
//                    + "AND checkin <= ?) t\n"
//                    + "ON e.eid = t.eid";

//            String sql = "SELECT e.EmployeeID,e.Name,ISNULL(t.tid,-1) tid,\n"
//                    + "t.checkin,t.checkout,e.startdate,e.contracttype,e.salary,t.pid,t.late\n"
//                    + "FROM Employee e LEFT JOIN \n"
//                    + "(SELECT * FROM TimeSheet WHERE checkin >= ?\n"
//                    + "AND checkin <= ?) t\n"
//                    + "ON e.EmployeeID = t.eid";
            String sql = "SELECT e.EmployeeID,e.Name,ISNULL(t.tid,-1) tid,\n"
                    + "t.checkin,t.checkout,e.startdate,e.contracttype,e.salary,t.late,a.aid,a.AnnualLeave,a.Year\n"
                    + "FROM Employee e LEFT JOIN \n"
                    + "(SELECT * FROM TimeSheet WHERE checkin >= ?\n"
                    + "AND checkin <= ?) t\n"
                    + "ON e.EmployeeID = t.eid\n"
                    + "RIGHT JOIN AnnualLeave a\n"
                    + "ON e.EmployeeID = a.EmployeeID WHERE YEAR = ?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setTimestamp(1, DateTimeHelper.getTimeStamp(from));
            stm.setTimestamp(2, DateTimeHelper.getTimeStamp(to));
            stm.setInt(3, year);
            ResultSet rs = stm.executeQuery();
            Employee currentEmp = new Employee();
            currentEmp.setId(-1);
            while (rs.next()) {
                int eid = rs.getInt("EmployeeID");
                if (eid != currentEmp.getId()) {
                    currentEmp = new Employee();
                    currentEmp.setId(eid);
                    currentEmp.setName(rs.getString("Name"));
                    currentEmp.setContractType(rs.getString("ContractType"));
                    currentEmp.setSalary(rs.getFloat("salary"));
                    currentEmp.setStartDate(rs.getTimestamp("StartDate"));
                    currentEmp.setDepartment(db.getDept(eid));
                    emps.add(currentEmp);
                }
                int tid = rs.getInt("tid");
                if (tid != -1) {
                    TimeSheet t = new TimeSheet();
                    t.setTid(tid);
                    t.setCheckin(rs.getTimestamp("checkin"));
                    t.setCheckout(rs.getTimestamp("checkout"));
                    t.setLate(rs.getInt("late"));
                    t.setEmployee(currentEmp);
                    currentEmp.getTimesheets().add(t);
                }
                int aid = rs.getInt("aid");
                if (aid != -1) {
                    AnnualLeave anual = new AnnualLeave();
                    anual.setAid(aid);
                    anual.setYear(rs.getInt("year"));
                    anual.setAnnualLeave(rs.getFloat("AnnualLeave"));
                    anual.setEid(currentEmp);
                    currentEmp.getAnnualLeaves().add(anual);
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return emps;
    }

    public ArrayList<Employee> getEmpsAnnual(int year) {
        ArrayList<Employee> emps = new ArrayList<>();
        try {
            String sql = "SELECT a.aid, e.EmployeeID,e.Name, a.AnnualLeave, a.[Year]\n"
                    + "                                        FROM Employee e INNER JOIN AnnualLeave a\n"
                    + "                                        on e.EmployeeID = a.EmployeeID WHERE YEAR = ?\n"
                    + "                   ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, year);
            ResultSet rs = stm.executeQuery();
            Employee currentEmp = new Employee();
            currentEmp.setId(-1);
            while (rs.next()) {
                int eid = rs.getInt("EmployeeID");
                if (eid != currentEmp.getId()) {
                    currentEmp = new Employee();
                    currentEmp.setId(eid);
                    currentEmp.setName(rs.getString("Name"));
                    emps.add(currentEmp);
                }
                int aid = rs.getInt("aid");
                if (aid != -1) {
                    AnnualLeave anual = new AnnualLeave();
                    anual.setAid(aid);
                    anual.setYear(rs.getInt("year"));
                    anual.setAnnualLeave(rs.getFloat("AnnualLeave"));
                    anual.setEid(currentEmp);
                    currentEmp.getAnnualLeaves().add(anual);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return emps;
    }
}
