package in.ineuron.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;

import in.ineuron.model.Books;
import in.ineuron.model.IssuedBooks;
import in.ineuron.model.Student;
import in.ineuron.service.BooksServiceImpl;
import in.ineuron.service.IBooksService;
import in.ineuron.service.IStudentService;
import in.ineuron.servicefactory.StudentServiceFactory;
import in.ineuron.util.GenrateUniqueAlphaNumericId;


/*import in.ineuron.model.Issued_books;
import in.ineuron.model.Student;
import in.ineuron.service.IStudentService;
import in.ineuron.servicefactory.StudentServiceFactory;*/
import java.util.*;

@WebServlet("/studentController/*")

public class StudentController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	private void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		IStudentService studentService = StudentServiceFactory.getStudentService();
		System.out.println("Request URI :: " + request.getRequestURI());
		System.out.println("path info :: " + request.getPathInfo());
		response.setContentType("text/html");

		if (request.getRequestURI().endsWith("registerStudent")) {

			GenrateUniqueAlphaNumericId obj = new GenrateUniqueAlphaNumericId();
			String studentId = obj.genrateUniqueId(2);

			String student_id = request.getParameter("studentId");
			//System.out.println(student_id);
			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
			//System.out.println(firstName);
			//String name = request.getParameter(firstName+" "+lastName);
			String email = request.getParameter("email");
			String department = request.getParameter("department");
			String password = request.getParameter("password");
			String mobile = request.getParameter("mobile");
		
			String address = request.getParameter("address");
			
			String dob = request.getParameter("date");
			System.out.println(dob);
			String gender = request.getParameter("radio");
			System.out.println(gender);
			Student student = new Student();

			student.setStudentId(studentId);
			String name = firstName+" "+lastName;
			student.setName(name);
			student.setAddress(address);
			student.setDepartment(department);
			student.setEmail(email);
			
			Date date = null;
			try {
				date = new SimpleDateFormat("yyyy-MM-dd").parse(dob);
				System.out.println("date==="+date);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
			
			student.setDob(date);
			student.setPassword(password);
			student.setMobile(mobile);
			student.setGender(gender);

			String status = studentService.addStudent(student);
			RequestDispatcher rd = null;
			if (status.equals("success")) {
				request.setAttribute("status", "success");
				
				Gson gson = new Gson();
				
				String jsonData = gson.toJson(student,Student.class);
				JsonElement jsonElement = gson.toJsonTree(student);
				
				jsonElement.getAsJsonObject().addProperty("status", "success");
				jsonData = gson.toJson(jsonElement);
				
				//SendEmail.sendMail(student.getEmail());
				//SentEmail2.sentMail();
				rd = request.getRequestDispatcher("../studentjsppages/statusResult.jsp");
				response.getWriter().print(jsonData);
				//rd.forward(request, response);
			} else if (status.equals("failure")) {
				request.setAttribute("status", "failure");
				rd = request.getRequestDispatcher("../studentjsppages/statusResult.jsp");
				response.getWriter().print("failure");
				//rd.forward(request, response);
			} else {
				PrintWriter out = response.getWriter();

				out.println("<h2 style='color:green; text-align:center'>Already student_Id is registered</h2>");
				rd = request.getRequestDispatcher("../Signup.html");
				response.getWriter().print("failure");
				//rd.include(request, response);
			}
		}

		if (request.getRequestURI().endsWith("searchstudent")) {
			String student_id = request.getParameter("student_id");

			Student student = studentService.searchStudent(student_id);
			RequestDispatcher rd = null;
			rd = request.getRequestDispatcher("../display.jsp");
			rd.forward(request, response);
		}

	
		if (request.getRequestURI().endsWith("studentLogin")) {
			System.out.println("path into--------------");
			String studentId = request.getParameter("studentId");
			String password = request.getParameter("password");

			// String status=studentService.studentLogin(studentId, password);

			Object status = studentService.studentLogin(studentId, password);
			HttpSession session = request.getSession();

			RequestDispatcher rd = null;

			if (status instanceof String) {

				if (status.equals("not matches")) {
					System.out.println("not matches--------------");
					// PrintWriter out = response.getWriter();

					// out.println("<h2 style='color:green; text-align:center'>password not matches.
					// Please type correct passowrd</h2>");
					rd = request.getRequestDispatcher("/failure.jsp");
					rd.include(request, response);

				} else if (status.equals("not exists")) {
					System.out.println("not exists--------------");
					request.setAttribute("status", "not exists");
					rd = request.getRequestDispatcher("/failure.jsp");
					rd.forward(request, response);
				}

			} else if (status instanceof Student) {

				IBooksService bookService = new BooksServiceImpl();
				List<Books> getAllBooks = bookService.searchBook();

				if (getAllBooks != null) {
					session.setAttribute("getAllBooks", getAllBooks);
					System.out.println("geting for studnet all the books");
				}

				session.setAttribute("studentObj", status);
				rd = request.getRequestDispatcher("/studentWelcome.jsp");
				rd.forward(request, response);
			}

		}
		if (request.getRequestURI().endsWith("booksTakeByStudent")) {
			HttpSession session = request.getSession();
			String studentId = request.getParameter("studentId");
			System.out.println("the value in controller is :" + studentId);
			ArrayList<IssuedBooks> issuedBooks = studentService.BooksTakenByStudent(studentId);
			//System.out.println(IssuedBooks);
			RequestDispatcher rd = null;
			if (issuedBooks != null) {
				session.setAttribute("issuedBooks", issuedBooks);
				System.out.println(issuedBooks);
				//response.getWriter().print(issuedBooks);
				rd = request.getRequestDispatcher("../BooksInYourAccount.jsp");
				//rd.forward(request, response);

			} else {
				//PrintWriter out = response.getWriter();
				
				//out.println("<h2 style='color:green; text-align:center'>No issued books with your id! </h2>");
			}

		}

	}
}
