/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dal.EmployeeDBContext;
import Dal.HolidayAndSymbolDBContext;
import Helper.DateTimeHelper;
import Model.Employee;
import Model.Symbol;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.Writer;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author Tom
 */
public class TimesheetReportController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Date today = new Date();
        today = DateTimeHelper.removeTime(today);
        int dayOfMonth = DateTimeHelper.getDayOfMonth(today);
        Date begin = DateTimeHelper.addDays(today, (dayOfMonth - 1) * -1);
        Date end = DateTimeHelper.addDays(DateTimeHelper.addMonths(begin, 1), -1);
        EmployeeDBContext db = new EmployeeDBContext();
        HolidayAndSymbolDBContext db2 = new HolidayAndSymbolDBContext();
        ArrayList<Employee> emps = db.getEmps(begin, end);
        ArrayList<Symbol> symbols = db2.getSymbols();
//        db.getTimesheet(emps,begin, end);
        db.getRequest(emps);
        db.getAnnual(emps);
        ArrayList<Date> dates = DateTimeHelper.getDates(begin, end);
        request.setAttribute("emps", emps);
        request.setAttribute("dates", dates);
        request.setAttribute("symbols", symbols);
        request.getRequestDispatcher("View/report.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
