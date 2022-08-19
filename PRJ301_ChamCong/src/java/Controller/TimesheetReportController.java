/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import Dal.EmployeeDBContext;
import Helper.DateTimeHelper;
import Model.AnnualLeave;
import Model.Employee;
import Model.ViewDate;
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
 * @author Hello Ngo Tung Son handsome
 */
public class TimesheetReportController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
        Date begin = DateTimeHelper.addDays(today, (dayOfMonth-1)*-1);
        Date end = DateTimeHelper.addDays(DateTimeHelper.addMonths(begin, 1),-1);
        Date end2 = DateTimeHelper.addMonths(begin, 1);
        EmployeeDBContext db = new EmployeeDBContext();
        ArrayList<Employee> emps = db.getEmps(begin, end2,DateTimeHelper.getTodayYear());
        ArrayList<ViewDate> dates = DateTimeHelper.getDates(begin, end);
        ArrayList<Employee> emps2 = db.getEmpsAnnual(DateTimeHelper.getYear(end2));
        request.setAttribute("emps", emps);
        request.setAttribute("emps2", emps2);
        request.setAttribute("dates", dates);
        request.getRequestDispatcher("View/report.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
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
