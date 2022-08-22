/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import Helper.DateTimeHelper;
import Model.AnnualLeave;
import Model.Employee;
import Model.RequestToLeave;
import Model.Symbol;
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

    public ArrayList<Employee> getEmps(Date from, Date to) {
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
//            String sql = "SELECT e.EmployeeID,e.[Name],ISNULL(t.tid,-1) tid,\n"
//                    + "t.checkin,t.checkout,e.startdate,e.contracttype,e.salary,\n"
//                    + "ISNULL(rq.RequestID,-1) RequestID,rq.Receiver,rq.[From],rq.[To],rq.type,rq.Reason,\n"
//                    + "rq.Accept,a.aid,a.AnnualLeave1,a.AnnualLeave2,a.Year\n"
//                    + "                    FROM Employee e LEFT JOIN \n"
//                    + "                    (SELECT * FROM TimeSheet WHERE checkin >= ?\n"
//                    + "                    AND checkin <= ?) t\n"
//                    + "                    ON e.EmployeeID = t.eid\n"
//                    + "                    INNER JOIN AnnualLeave a\n"
//                    + "                    ON e.EmployeeID = a.EmployeeID \n"
//                    + "                    LEFT JOIN RequestToLeave rq \n"
//                    + "              ON rq.EmployeeID = e.EmployeeID \n"
//                    + "                    WHERE YEAR = ?";
            String sql = "  SELECT e.EmployeeID,e.[Name],ISNULL(t.tid,-1) tid,t.checkin,t.checkout,e.startdate,e.contracttype,e.salary \n"
                    + "                    FROM Employee e LEFT JOIN \n"
                    + "                    (SELECT * FROM TimeSheet WHERE checkin >= ?\n"
                    + "                    AND checkin <= ?) t\n"
                    + "                    ON e.EmployeeID = t.eid";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setTimestamp(1, DateTimeHelper.getTimeStamp(from));
            stm.setTimestamp(2, DateTimeHelper.getTimeStamp(DateTimeHelper.addDays(to, 1)));
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
                    t.setEmployee(currentEmp);
                    currentEmp.getTimesheets().add(t);
                }
//                int rid = rs.getInt("RequestID");
//                if (rid != -1) {
//                    RequestToLeave r = new RequestToLeave();
//                    r.setReqid(rid);
//                    r.setReceiver(rs.getInt("receiver"));
//                    r.setFrom(rs.getTimestamp("From"));
//                    r.setTo(rs.getTimestamp("To"));
//                    r.setType(rs.getInt("type"));
//                    r.setReason(rs.getString("Reason"));
//                    r.setAccept(rs.getBoolean("Accept"));
//                    HolidayAndSymbolDBContext dh = new HolidayAndSymbolDBContext();
//                    r.setSymbol(dh.getSymbolsFromRequest(rid));
//                    r.setEmployee(currentEmp);
//                    currentEmp.getReqToLeaves().add(r);
//                }
//                int aid = rs.getInt("aid");
//                if (aid != -1) {
//                    AnnualLeave anual = new AnnualLeave();
//                    anual.setAid(aid);
//                    anual.setYear(rs.getInt("year"));
//                    anual.setAnnualLeave1(rs.getFloat("AnnualLeave1"));
//                    anual.setAnnualLeave2(rs.getFloat("AnnualLeave2"));
//                    anual.setEid(currentEmp);
//                    currentEmp.getAnnualLeaves().add(anual);
//                }
            }
//            
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return emps;
    }

//    public ArrayList<Employee> getTimesheet(ArrayList<Employee> emps, Date from, Date to) {
//        try {
//            String sql = "SELECT e.EmployeeID,e.Name,ISNULL(t.tid,-1) tid,\n"
//                    + "                    t.checkin,t.checkout\n"
//                    + "                    FROM Employee e LEFT JOIN \n"
//                    + "                    (SELECT * FROM TimeSheet WHERE checkin >= ?\n"
//                    + "                    AND checkin <= ?) t\n"
//                    + "                    ON e.EmployeeID = t.eid";
//            PreparedStatement stm = connection.prepareStatement(sql);
//            stm.setTimestamp(1, DateTimeHelper.getTimeStamp(from));
//            stm.setTimestamp(2, DateTimeHelper.getTimeStamp(DateTimeHelper.addDays(to, 1)));
//            ResultSet rs = stm.executeQuery();
//            while (rs.next()) {
//                int tid = rs.getInt("tid");
//                if (tid != -1) {
//                    TimeSheet t = new TimeSheet();
//                    t.setTid(tid);
//                    t.setCheckin(rs.getTimestamp("checkin"));
//                    t.setCheckout(rs.getTimestamp("checkout"));
//                    Employee e = new Employee();
//                    t.setEmployee(e);
//                    e.getTimesheets().add(t);
//                }
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(EmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return emps;
//    }

    public ArrayList<Employee> getRequest(ArrayList<Employee> emps) {
        try {
            ArrayList<RequestToLeave> requests = new ArrayList<>();
//            sql = "SELECT RequestID,EmployeeID,Receiver,[From],[To],Type,Reason,Accept FROM RequestToLeave";
            String sql = "SELECT r.RequestID,r.EmployeeID,s.id,s.AllDay,s.HalfDay,s.Saturday,r.[From],r.[To],r.Type,r.Accept \n"
                    + "FROM RequestToLeave r INNER JOIN Symbol s on s.ID = r.Type";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {

                RequestToLeave r = new RequestToLeave();
                r.setReqid(rs.getInt("RequestID"));
                r.setFrom(rs.getTimestamp("From"));
                r.setTo(rs.getTimestamp("To"));
                r.setType(rs.getInt("type"));
                r.setAccept(rs.getBoolean("Accept"));
                Symbol s = new Symbol();
                s.setSid(rs.getInt("id"));
                s.setAllday(rs.getString("allday"));
                s.setHalfday(rs.getString("halfday"));
                s.setSaturday(rs.getString("saturday"));
                r.setSymbol(s);
                Employee e = new Employee();
                e.setId(rs.getInt("EmployeeID"));
                r.setEmployee(e);
                requests.add(r);

            }

            for (Employee e : emps) {
                for (RequestToLeave r : requests) {
                    if (e.getId() == r.getEmployee().getId()) {
                        e.getReqToLeaves().add(r);
                    }
                }
            }
            //System.out.println(emps.get(1).getReqToLeaves().toString());
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return emps;
    }

    public ArrayList<Employee> getAnnual(ArrayList<Employee> emps) {
        try {
            ArrayList<AnnualLeave> annuals = new ArrayList<>();
            String sql = "SELECT  [aid]\n"
                    + "      ,[Year]\n"
                    + "      ,[EmployeeID]\n"
                    + "      ,[AnnualLeave1]\n"
                    + "      ,[AnnualLeave2]\n"
                    + "  FROM [AnnualLeave]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {

                AnnualLeave a = new AnnualLeave();
                a.setAid(rs.getInt("aid"));
                a.setAnnualLeave1(rs.getFloat("annualleave1"));
                a.setAnnualLeave2(rs.getFloat("annualleave2"));
                a.setYear(rs.getInt("year"));
                Employee e = new Employee();
                e.setId(rs.getInt("EmployeeID"));
                a.setEid(e);
                annuals.add(a);
            }

            for (Employee e : emps) {
                for (AnnualLeave a : annuals) {
                    if (e.getId() == a.getEid().getId() && a.getYear() == DateTimeHelper.getTodayYear()) {
                        e.getAnnualLeaves().add(a);
                    }
                }
            }
            //System.out.println(emps.get(1).getReqToLeaves().toString());
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return emps;
    }
}
