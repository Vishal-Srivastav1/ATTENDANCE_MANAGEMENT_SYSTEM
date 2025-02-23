package com.servlet;
/**
 * Servlet implementation class AddPostServlet
 */

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.FacultyDao;
import com.dao.UserDao;
import com.db.DBConnect;
import com.entity.Faculty;
import com.entity.User;


@WebServlet("/profileReqStudent")
public class ProfileReqStudentServlet extends HttpServlet {
      @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	
    	
    	 int attendID = Integer.parseInt(req.getParameter("id"));	
        String name=req.getParameter("name");
  		String Location=req.getParameter("Location");
  		String Qualification=req.getParameter("Qualification");
  		String Branch=req.getParameter("Branch");
  		String course=req.getParameter("course");
  		String email=req.getParameter("email");		
  		String description=req.getParameter("description");
  		
  		
  		
  		
  		 HttpSession session= req.getSession();
			if (name!= null && !name.equals("") && Location != null && !Location.equals("")
					&& Qualification != null && !Qualification.equals("") && Branch!= null && !Branch.equals("") && course!= null && !course.equals("")
					&& email != null && !email.equals("") && description != null && !description.equals("")) {
		  try {
		
			  UserDao dao=new UserDao(DBConnect.getConn());
	        	
	        	 User u=new User();
	        	   
	        	
        	    u.setId(attendID);
	       		u.setName(name);
	       		u.setLocation(Location);
	       		u.setQualification(Qualification);
	       		u.setBranch(Branch);
	       		u.setCourse(course);
	       		u.setEmail(email);
	       		u.setDescription(description);
	        	  
	        	 
	        	 
	        	 boolean f=dao.profilleReqUser(u);
	        	
	        	 if (f) {
	    				session.setAttribute("succMsg", " Request Send Successfully..");
	    				resp.sendRedirect("Semester.jsp");
	    			}else {
	    				session.setAttribute("succMsg", "Error: Problem in Server Side..");
	    				resp.sendRedirect("StudentProf.jsp");
	    			}
	        	 
		} catch (Exception e) {
			e.printStackTrace();
		}
			}else {
				session.setAttribute("succMsg", " All Fields required..");
				resp.sendRedirect("StudentProf.jsp");
			}
    	
    }
}
