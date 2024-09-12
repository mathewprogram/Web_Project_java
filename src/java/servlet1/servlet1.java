package servlet1;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class servlet1 extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String name = request.getParameter("txtName");
            String option = "";
            double result = 0.0;
            
            if((option = request.getParameter("operation")) != null){
                double number = Double.parseDouble(request.getParameter("txtNumber"));    
                switch(option){
                    case "Square root":
                        result = Math.sqrt(number);
                        break;
                    case "Cube root":
                        result = Math.cbrt(number);
                        break;
                    case "Square":
                        result = Math.pow(number,2);
                        break;
                }
            }
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Servlet2</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>" + "Welcome " + name + "</h1>");
            out.println("<h1>" + "Result of " + option + " " + result + " " + "</h1>");
            out.println("<footer style='position: fixed; bottom: 10px; width: 100%; text-align: center;'>");
            out.println("<a href='http://localhost:8080/Web_Project_Java/ejemplo5/index.jsp'>Go to the index</a>");
            out.println("</footer>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Method Post es mas seguro ya que no tienes acceso a la informacion.
        processRequest(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Method Post es menos seguro ya que tienes acceso a la informacion. La informacion enviada se refleja en la ruta.
        processRequest(request,response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
