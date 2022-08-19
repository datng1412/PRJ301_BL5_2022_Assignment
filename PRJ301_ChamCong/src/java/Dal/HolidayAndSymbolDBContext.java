/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import Model.Holiday;
import Model.Symbol;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author Tom
 */
public class HolidayAndSymbolDBContext extends DBContext{
    public Holiday getHoliday() {
        try {
            String sql = "SELECT HolidayID,HolidayName,Ratio,[From],[To] FROM Holiday";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Holiday h = new Holiday();
                h.setHid(rs.getInt("HolidayID"));
                h.setHname(rs.getString("HolidayName"));
                h.setRatio(rs.getFloat("Ratio"));
                h.setFrom(rs.getTimestamp("From"));
                h.setTo(rs.getTimestamp("To"));               
                return h;
            }
        } catch (SQLException ex) {
            Logger.getLogger(HolidayAndSymbolDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public Symbol getSymbol() {
        try {
            String sql = "SELECT ID,Type,[Symbol] FROM Symbol";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Symbol s = new Symbol();
                s.setSid(rs.getInt("ID"));
                s.setType(rs.getString("Type"));
                s.setSymbol(rs.getString("Symbol"));
                return s;
            }
        } catch (SQLException ex) {
            Logger.getLogger(HolidayAndSymbolDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
