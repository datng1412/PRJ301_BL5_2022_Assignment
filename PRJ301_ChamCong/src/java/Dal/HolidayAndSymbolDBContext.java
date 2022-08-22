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
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Tom
 */
public class HolidayAndSymbolDBContext extends DBContext {

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

    public ArrayList<Symbol> getSymbols() {
        ArrayList<Symbol> symbols = new ArrayList<>();
        try {
            String sql = "SELECT ID,SymbolName,AllDay,HalfDay,Saturday,Description FROM Symbol";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Symbol s = new Symbol();
                s.setSid(rs.getInt("ID"));
                s.setSname(rs.getString("SymbolName"));
                s.setAllday(rs.getString("AllDay"));
                s.setHalfday(rs.getString("HalfDay"));
                s.setSaturday(rs.getString("Saturday"));
                s.setDescription(rs.getString("Description"));

                symbols.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(HolidayAndSymbolDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return symbols;
    }

    public Symbol getSymbolsFromRequest(int id) {
        Symbol s = new Symbol();
        try {
            String sql = "SELECT s.ID,s.SymbolName,s.AllDay,s.HalfDay,s.Saturday FROM Symbol s INNER JOIN RequestToLeave r on r.Type = s.ID WHERE RequestID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                s.setSid(rs.getInt("ID"));
                s.setAllday(rs.getString("AllDay"));
                s.setHalfday(rs.getString("HalfDay"));
                s.setSaturday(rs.getString("Saturday"));
                return s;
            }
        } catch (SQLException ex) {
            Logger.getLogger(HolidayAndSymbolDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
