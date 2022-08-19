/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import Model.Department;
import Model.Employee;
import Model.TimeSheet;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Tom
 */
public class DepartmentDBContext extends DBContext {

    public Department getDept(int EmployeeID) {
        try {
            String sql = "SELECT e.EmployeeID,e.Name,d.DepartmentID,d.DepartmentName,d.HolidayRewardRate\n" +
"                    FROM Department d INNER JOIN Employee e\n" +
"                    on d.DepartmentID = e.DepartmentID\n" +
"                    Where e.EmployeeID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, EmployeeID);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Department dept = new Department();
                dept.setDid(rs.getInt("DepartmentID"));
                dept.setDpname(rs.getString("DepartmentName"));
                dept.setReward(rs.getFloat("HolidayRewardRate"));             
                return dept;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DepartmentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
