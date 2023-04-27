package in.ineuron.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import in.ineuron.model.Librarian;
import in.ineuron.service.ILibrarianService;
import in.ineuron.servicefactory.LibrarianServiceFactory;
import in.ineuron.util.UUIDGenrator;

@WebServlet("/librarianController/*")
public class LibraryController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doRegisterLibrarian(request, response);
	}

	private void doRegisterLibrarian(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		ILibrarianService libService = LibrarianServiceFactory.getLibrarianService();
		
		if(request.getRequestURI().endsWith("addLibrarian")){
			
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String mobile = request.getParameter("mobile");

			Librarian librarian = new Librarian();
			String id = UUIDGenrator.getUniqueId();
			
			librarian.setId(id);
			librarian.setName(name);
			librarian.setEmail(email);
			librarian.setMobile(mobile);
			librarian.setPassword(password);
			
			String status = libService.addLibrarian(librarian);
			
			RequestDispatcher rd = null;
			
			if(status.equals("success")) {
				System.out.println("sucess-------------");
				request.setAttribute("status", "success");
				rd = request.getRequestDispatcher("../registration.jsp");
				rd.forward(request, response);
				//response.sendRedirect("../registration.jsp");
			}else {
				System.out.println("failure-------------");
				request.setAttribute("status", "failure");
				rd = request.getRequestDispatcher("../registration.jsp");
				rd.forward(request, response);
				
				//response.sendRedirect("../registration.jsp");
			}
			
		}
			
	}
	
	
}
