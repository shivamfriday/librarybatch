package in.ineuron.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
import in.ineuron.model.Librarian;
import in.ineuron.model.Student;
import in.ineuron.service.BooksServiceImpl;
import in.ineuron.service.IBooksService;
import in.ineuron.service.ILibrarianService;
import in.ineuron.service.IStudentService;
import in.ineuron.service.StudentServiceImpl;
import in.ineuron.servicefactory.LibrarianServiceFactory;
import in.ineuron.servicefactory.StudentServiceFactory;
import in.ineuron.util.GenrateUniqueAlphaNumericId;
import in.ineuron.util.UUIDGenrator;

@WebServlet("/librarianController/*")
public class LibraryController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doLogout(request, response);
	}

	private void doLogout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub

		if (request.getRequestURI().endsWith("logout")) {
			HttpSession session = request.getSession();
			session.invalidate();
			System.out.println("loged out");
			response.sendRedirect("../index.jsp");
		}

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doRegisterLibrarian(request, response);
		doLoginLibrarian(request, response);

		if (request.getRequestURI().endsWith("logout")) {

			System.out.println("loged out");

		}

		if (request.getRequestURI().endsWith("assignBookToStudent")) {
			try {
				doAssignBookToStudent(request, response);
			} catch (ParseException | ServletException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		if (request.getRequestURI().endsWith("getIssuedBooks")) {
			System.out.println("getIssuedBooks");
			IStudentService studentService = new StudentServiceImpl();

			HttpSession session = request.getSession();
			String studentId = request.getParameter("studentId");

			Student stud = studentService.searchStudent(studentId);

			if (stud != null) {
				System.out.println("the value in controller is :" + studentId);
				ArrayList<IssuedBooks> issuedBooks = studentService.booksTakenByStudentForReturn(studentId);
				// System.out.println(IssuedBooks);
				RequestDispatcher rd = null;
				if (issuedBooks != null) {
					session.setAttribute("issuedBooks", issuedBooks);
					System.out.println(issuedBooks);
					response.getWriter().print("success");

					// rd.forward(request, response);

				} else {
					// PrintWriter out = response.getWriter();
					session.setAttribute("issuedBooks", null);
					response.getWriter().print("failure");
					// out.println("<h2 style='color:green; text-align:center'>No issued books with
					// your id! </h2>");
				}

			} else {
				response.getWriter().print("Student id is wrong");

			}

		}
		if (request.getRequestURI().endsWith("removeIssuedBooks")) {
			System.out.println("removeIssuedBooks");
			ILibrarianService libraryService = LibrarianServiceFactory.getLibrarianService();

			HttpSession session = request.getSession();
			String studentId = request.getParameter("studentId");
			String bookId = request.getParameter("bookId");

			
			String  status = libraryService.removeIssuedBooks(studentId,bookId);
			// System.out.println(IssuedBooks);
			RequestDispatcher rd = null;
			if (status != null) {
				session.setAttribute("status", status);
				System.out.println(status);
				response.getWriter().print("success");
				
				
				IStudentService studentService = new StudentServiceImpl();
				System.out.println("the value in controller is :" + studentId);
				ArrayList<IssuedBooks> issuedBooks = studentService.booksTakenByStudentForReturn(studentId);
				// System.out.println(IssuedBooks);
				//RequestDispatcher rd1 = null;
				if (issuedBooks != null) {
					session.setAttribute("issuedBooks", issuedBooks);
					System.out.println(issuedBooks);
					//response.getWriter().print("success");

					// rd.forward(request, response);

				} else {
					// PrintWriter out = response.getWriter();
					session.setAttribute("issuedBooks", null);
					
					
				}
				
				
				
				
				
				

				// rd.forward(request, response);

			} else {
				// PrintWriter out = response.getWriter();
				session.setAttribute("issuedBooks", null);
				response.getWriter().print("failure");
				// out.println("<h2 style='color:green; text-align:center'>No issued books with
				// your id! </h2>");
			}

		}
		
		if (request.getRequestURI().endsWith("getStudent")) {
			IStudentService studentService = new StudentServiceImpl();
			
			String studentId = request.getParameter("studentId");
			
			Student student = studentService.searchStudent(studentId);
			
			//Gson gson = new Gson();
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			String jsonData = gson.toJson(student,Student.class);
			JsonElement jsonElement = gson.toJsonTree(student);
			
			
			
			if(student!=null) {
				
				
				
				jsonElement.getAsJsonObject().addProperty("status", "success");
				jsonData = gson.toJson(jsonElement);
				
				response.getWriter().print(jsonData);
			}else {
				
				/*
				 * String jsonData = gson.toJson(student,Student.class); JsonElement jsonElement
				 * = gson.toJsonTree(student);
				 */
				
				response.getWriter().print("failure");
			}
			
		}
		
		if (request.getRequestURI().endsWith("updateStudent")) {
			
			IStudentService studentService = StudentServiceFactory.getStudentService();
			
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

			student.setStudentId(student_id);
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

			String status = studentService.updateStudent(student);
			RequestDispatcher rd = null;
			if (status.equals("success")) {
				//request.setAttribute("status", "success");
				response.getWriter().print("success");
				
				//rd = request.getRequestDispatcher("../updatesuccess.jsp");
				//rd.forward(request, response);
			} else {
				//request.setAttribute("status", "failure");
				//rd = request.getRequestDispatcher("../updatesuccess.jsp");
				//.forward(request, response);
				response.getWriter().print("failure");
			}
		}

		if (request.getRequestURI().endsWith("deleteStudent")) {
			
			IStudentService studentService = StudentServiceFactory.getStudentService();
			
			String studentId = request.getParameter("studentId");

			String status = studentService.deleteStudent(studentId);
			RequestDispatcher rd = null;
			if (status.equals("success")) {
				
				response.getWriter().print("success");
			} else {
				
				
				response.getWriter().print("failure");
			}
		}


	}

	private void doAssignBookToStudent(HttpServletRequest request, HttpServletResponse response)
			throws ParseException, ServletException, IOException {
		// TODO Auto-generated method stub
		// Integer book_id = Integer.parseInt(request.getParameter("modalBookId"));

		IBooksService bookService = new BooksServiceImpl();

		ILibrarianService libService = LibrarianServiceFactory.getLibrarianService();

		Books books = new Books();

		String studentId = request.getParameter("studentId");
		System.out.println(studentId);
		// String studentId = "stu12";

		String bookId = request.getParameter("modalBookId");
		// String bookId = "2";
		// System.out.println(bookId);

		System.out.println("modal book Id = " + bookId);

		// String librarianId = request.getParameter("librarianId");
		String librarianId = request.getParameter("librarianId");
		String status = request.getParameter("issued");

		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");

		LocalDateTime issueDate = LocalDateTime.now();

		LocalDateTime issuedEndDate = issueDate.plusDays(15);
		LocalDateTime returnDate = issueDate.plusDays(15);

		// Date issueDate = new
		// SimpleDateFormat("dd/MM/yyyy").parse(request.getParameter("issued_date"));
		// Date issuedEndDate = new
		// SimpleDateFormat("dd/MM/yyyy").parse(request.getParameter("issued_end_date"));
		// Date returnDate = null;

		GenrateUniqueAlphaNumericId obj = new GenrateUniqueAlphaNumericId();

		String issueId = obj.genrateUniqueId(4);

		IssuedBooks issuedBooks = new IssuedBooks();
		issuedBooks.setIssuedId(issueId);
		issuedBooks.setBookId(bookId);
		//issuedBooks.setIssuedId("issued001");
		issuedBooks.setStudentId(studentId);
		issuedBooks.setLibrarianId(librarianId);
		issuedBooks.setIssueDate(issueDate);
		issuedBooks.setIssueEndDate(issuedEndDate);
		issuedBooks.setReturnDate(returnDate);

		String result = libService.AssignBookToStudent(issuedBooks);
		RequestDispatcher rd = null;
		request.setAttribute("result", result);
		response.getWriter().print(result);
		rd = request.getRequestDispatcher("/librarianWelcome.jsp");
		// rd.forward(request, response);
		// response.sendRedirect("./librarianWelcome.jsp");

	}

	private void doLoginLibrarian(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		ILibrarianService libService = LibrarianServiceFactory.getLibrarianService();

		HttpSession session = request.getSession();
		RequestDispatcher rd = null;

		if (request.getRequestURI().endsWith("loginLibrarian")) {
			String value = request.getParameter("selection");

			String email = request.getParameter("email");
			String password = request.getParameter("password");

			System.out.println(email + "=email");
			System.out.println(password + "=password");

			Librarian lib = libService.getLibrarian(email, password);
			System.out.println(lib);
			if (lib != null) {

				IBooksService bookService = new BooksServiceImpl();
				List<Books> getAllBooks = bookService.searchBook();

				if (getAllBooks != null) {
					session.setAttribute("getAllBooks", getAllBooks);
				}

				session.setAttribute("libObj", lib);
				System.out.println("context path==" + request.getContextPath());
				// rd =
				// request.getRequestDispatcher("../"+request.getContextPath()+"/librarianWelcome.jsp");
				rd = request.getRequestDispatcher("../librarianWelcome.jsp");
				// System.out.println("success login&&&&&&&&&&&&&&&&&&&&&&&&" + lib.getName());
			} else {
				request.setAttribute("status", "failure");
				rd = request.getRequestDispatcher("../login.jsp");
				// System.out.println("failed login&&&&&&&&&&&&&&&&&&&&&&&&");
			}

			rd.forward(request, response);

		}

	}

	private void doRegisterLibrarian(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		ILibrarianService libService = LibrarianServiceFactory.getLibrarianService();

		if (request.getRequestURI().endsWith("addLibrarian")) {

			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String mobile = request.getParameter("mobile");

			Librarian librarian = new Librarian();
			GenrateUniqueAlphaNumericId obj = new GenrateUniqueAlphaNumericId();

			String libId = obj.genrateUniqueId(3);

			librarian.setId(libId);
			librarian.setName(name);
			librarian.setEmail(email);
			librarian.setMobile(mobile);
			librarian.setPassword(password);

			String status = libService.addLibrarian(librarian);

			RequestDispatcher rd = null;

			if (status.equals("success")) {

				System.out.println("sucess-------------");
				request.setAttribute("status", "success");
				request.setAttribute("bookService", "success");
				rd = request.getRequestDispatcher("../registration.jsp");
				rd.forward(request, response);
				// response.sendRedirect("../registration.jsp");
			} else {
				System.out.println("failure-------------");
				request.setAttribute("status", "failure");
				rd = request.getRequestDispatcher("../registration.jsp");
				rd.forward(request, response);

				// response.sendRedirect("../registration.jsp");
			}

		}

	}

}
