package in.ineuron.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import java.nio.charset.StandardCharsets;
//import org.apache.commons.io.IOUtils;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.json.JSONObject;

import in.ineuron.model.Books;
import in.ineuron.model.Student;
import in.ineuron.service.BooksServiceImpl;
import in.ineuron.service.IBooksService;
import in.ineuron.service.IIssuedBookService;
import in.ineuron.service.IssuedBookServiceImpl;
import in.ineuron.servicefactory.BooksServiceFactory;
import in.ineuron.util.GenrateUniqueAlphaNumericId;
import in.ineuron.util.UUIDGenrator;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;

/**
 * Servlet implementation class BooksController
 */
@WebServlet("/booksController/*")
@MultipartConfig(maxFileSize = 1024 * 1024 * 1024)
public class BooksController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	//
	// JSONObject jsonObject = new JSONObject(IOUtils.toString(encodeImg,
	// StandardCharsets.UTF_8));
	public BooksController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doSearch(request, response);

	}

	private void doSearch(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("gettin into the serach do");
		IBooksService bookService = null;
		RequestDispatcher requestDispatcher = null;

		if (request.getRequestURI().endsWith("searchBookById") || request.getRequestURI().endsWith("searchBookByCat")
				|| request.getRequestURI().endsWith("searchBookByTitle")
				|| request.getRequestURI().endsWith("searchBookByAuthor")) {
			// bookservice = BooksServiceFactory.getBookService();

			bookService = new BooksServiceImpl();

			String valueForSearch = request.getParameter("valueForSearch");
			String valueForType = request.getParameter("valueForType");
			System.out.println("valueForSearch=" + valueForSearch);
			System.out.println("valueForType=" + valueForType);
			// String authorName=request.getParameter("authorName");

			List<Books> searchBook = bookService.searchBookByValue(valueForSearch, valueForType);

			if (searchBook != null) {
				System.out.println("succes in controller servlet");
				request.setAttribute("getAllBooks", searchBook);
				Object obj = request.getSession(false).getAttribute("studentObj");

				if (obj instanceof Student) {
					requestDispatcher = request.getRequestDispatcher("/studentWelcome.jsp");
					System.out.println("calling in studnet welcome page");
				} else {
					requestDispatcher = request.getRequestDispatcher("/librarianWelcome.jsp");
					System.out.println("calling in libararian welcome page");
				}

				// System.out.println("printing obj value in servlet="+);

				requestDispatcher.forward(request, response);

				// response.sendRedirect(request.getContextPath() + "/showBooks.jsp");

			} else {

				// response.set;
				request.setAttribute("searchBook", searchBook);
				requestDispatcher = request.getRequestDispatcher("/librarianWelcome.jsp");
				requestDispatcher.forward(request, response);

				System.out.println("failure");

			}

		}
		if (request.getRequestURI().endsWith("getAllBooks")) {

			bookService = new BooksServiceImpl();

			List<Books> getAllBooks = bookService.searchBook();

			if (getAllBooks != null) {
				System.out.println("succes in controller servlet");
				request.setAttribute("getAllBooks", getAllBooks);

				Object obj = request.getSession(false).getAttribute("studentObj");

				if (obj instanceof Student) {
					requestDispatcher = request.getRequestDispatcher("/studentWelcome.jsp");
					System.out.println("calling in studnet welcome page for all books");
				} else {
					requestDispatcher = request.getRequestDispatcher("/librarianWelcome.jsp");
					System.out.println("calling in libararian welcome page for all books");
				}
				requestDispatcher.forward(request, response);

				// response.sendRedirect(request.getContextPath() + "/showBooks.jsp");

			} else {

				request.setAttribute("getAllBooks", getAllBooks);
				requestDispatcher = request.getRequestDispatcher("/librarianWelcome.jsp");
				requestDispatcher.forward(request, response);

				System.out.println("failure");

			}

		}

		/*
		 * if (request.getRequestURI().endsWith("searchByCat")) {
		 * 
		 * String category = request.getParameter("category");
		 * 
		 * bookService = new BooksServiceImpl();
		 * 
		 * List<Books> getAllBooks = bookService.searchBookByCat(category);
		 * 
		 * if (getAllBooks != null) {
		 * System.out.println("succes in controller servlet");
		 * request.setAttribute("getAllBooks", getAllBooks);
		 * 
		 * requestDispatcher = request.getRequestDispatcher("/librarianWelcome.jsp");
		 * requestDispatcher.forward(request, response);
		 * 
		 * // response.sendRedirect(request.getContextPath() + "/showBooks.jsp");
		 * 
		 * } else {
		 * 
		 * request.setAttribute("getAllBooks", getAllBooks); requestDispatcher =
		 * request.getRequestDispatcher("/librarianWelcome.jsp");
		 * requestDispatcher.forward(request, response);
		 * 
		 * System.out.println("failure");
		 * 
		 * }
		 * 
		 * }
		 */
		/*
		 * if (request.getRequestURI().endsWith("searchByTitle")) {
		 * 
		 * String title = request.getParameter("title");
		 * 
		 * bookService = new BooksServiceImpl();
		 * 
		 * List<Books> getAllBooks = bookService.searchBookByTitle(title);
		 * 
		 * if (getAllBooks != null) {
		 * System.out.println("succes in controller servlet");
		 * request.setAttribute("getAllBooks", getAllBooks);
		 * 
		 * requestDispatcher = request.getRequestDispatcher("/librarianWelcome.jsp");
		 * requestDispatcher.forward(request, response);
		 * 
		 * // response.sendRedirect(request.getContextPath() + "/showBooks.jsp");
		 * 
		 * } else {
		 * 
		 * request.setAttribute("getAllBooks", getAllBooks); requestDispatcher =
		 * request.getRequestDispatcher("/librarianWelcome.jsp");
		 * requestDispatcher.forward(request, response);
		 * 
		 * System.out.println("failure");
		 * 
		 * }
		 * 
		 * }
		 */

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doRegisterBooks(request, response);
	}

	/*
	 * private void showAllBooks(IBooksService bookservice) { bookservice =
	 * BooksServiceFactory.getBookService(); RequestDispatcher rd3 = null;
	 * List<Books> allBooks = bookservice.getAllBooks();
	 * request.setAttribute("allBooks", allBooks); rd3 =
	 * request.getRequestDispatcher("../showallbooks.jsp"); rd3.forward(request,
	 * response); }
	 */

	private void doRegisterBooks(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		IBooksService bookservice = new BooksServiceImpl();

		if (request.getRequestURI().endsWith("addBooks")) {

			GenrateUniqueAlphaNumericId obj = new GenrateUniqueAlphaNumericId();

			String bookId = obj.genrateUniqueId(2);

			// String bookId = request.getParameter("bookId");
			String authorName = request.getParameter("authorName");
			System.out.println(authorName);
			String bookTitle = request.getParameter("bookTitle");
			String catName = request.getParameter("category");
			String edition = request.getParameter("edition");
			int bookPrice = Integer.parseInt(request.getParameter("bookPrice"));
			int qty = Integer.parseInt(request.getParameter("qty"));
			String description = request.getParameter("description");
			Part frontImage = request.getPart("frontImage");

			/*
			 * if (frontImage == null) System.out.println("iam not coming");
			 */

			// do genrate unique id ----------------

			GenrateUniqueAlphaNumericId objId = new GenrateUniqueAlphaNumericId();

			String id = objId.genrateUniqueId(1);
			System.out.println("id for books ==" + id);

			Part backImage = request.getPart("backImage");

			byte[] frontByte = frontImage.getInputStream().readAllBytes();
			byte[] backByte = backImage.getInputStream().readAllBytes();

			Books books = new Books();
			// String id = UUIDGenrator.getUniqueId();

			books.setBookId(id);
			books.setAuthorName(authorName);
			books.setTitle(bookTitle);
			books.setCatName(catName);
			books.setEdition(edition);
			books.setBookPrice(bookPrice);
			books.setDescription(description);
			books.setQty(qty);
			books.setFrontImage(frontByte);
			books.setBackImage(backByte);

			String status = bookservice.addBook(books);

			RequestDispatcher rd = null;

			if (status.equals("success")) {
				System.out.println("sucess-------------");
				request.setAttribute("status", "success");
				rd = request.getRequestDispatcher("/addBooks2.jsp");
				rd.forward(request, response);
				// response.sendRedirect("../registration.jsp");
			} else {
				System.out.println("failure-------------");
				request.setAttribute("status", "failure");
				rd = request.getRequestDispatcher("/addBooks2.jsp");
				rd.forward(request, response);

				// response.sendRedirect("../addBooks.jsp");
			}

		}

		if (request.getRequestURI().endsWith("deletebook")) {
			IBooksService deleteBookService = new BooksServiceImpl();
			
			IIssuedBookService bs = new IssuedBookServiceImpl();
			
			String bookId = request.getParameter("bookId");
			
			int count =  bs.assignedBookCount(bookId);
			
			System.out.println("bookId=" +bookId);
			
			
			if(count==0) {
				String deleteBook = deleteBookService.deleteBook(bookId);
				request.setAttribute("deleteBook", deleteBook);
				response.getWriter().print(deleteBook);
				System.out.println(deleteBook);
				//Refresgin the databas again
				HttpSession session = request.getSession(true);
			      
				RequestDispatcher rd3 = null;
				List<Books> getAllBooks = deleteBookService.searchBook();
				System.out.println(getAllBooks);
				//request.setAttribute("allBooks", allBooks);
				//request.setAttribute("getAllBooks", getAllBooks);
				 session.setAttribute("getAllBooks", getAllBooks);
				
				
			}else {
				String msg = "you cannot delete the book because It's already assigned to a some students";
				request.setAttribute("deleteBook", msg);
				response.getWriter().print(msg);
				System.out.println(msg);
			}
			
			RequestDispatcher rd2 = null;
			
			//rd2 = request.getRequestDispatcher("../updateBooks3.jsp");
			
			rd2 = request.getRequestDispatcher("../updateBooks3.jsp");
			//rd2.forward(request, response);
			///rd2.forward(request, response);
		}

		if (request.getRequestURI().endsWith("showbooks.jsp")) {
			bookservice = BooksServiceFactory.getBookService();
			RequestDispatcher rd3 = null;
			List<Books> allBooks = bookservice.getAllBooks();
			request.setAttribute("allBooks", allBooks);
			rd3 = request.getRequestDispatcher("../showallbooks.jsp");
			rd3.forward(request, response);
		}

		if (request.getRequestURI().endsWith("searchbookforupdate")) {
			bookservice = BooksServiceFactory.getBookService();
			String bookId = request.getParameter("bookId");

			List<Books> searchBook = bookservice.searchBook(bookId);
			RequestDispatcher rd4 = null;
			request.setAttribute("searchBook", searchBook);
			rd4 = request.getRequestDispatcher("../editbook.jsp");
			rd4.forward(request, response);
		}
		if (request.getRequestURI().endsWith("updatebook")) {

			System.out.println(request.getRequestURI());

			IBooksService bookservice1 = new BooksServiceImpl();

			Books book = new Books();
			book.setBookId(request.getParameter("bookId"));

			book.setAuthorName(request.getParameter("authorName"));

			book.setTitle(request.getParameter("bookTitle"));

			book.setCatName(request.getParameter("category"));

			book.setBookPrice(Integer.parseInt(request.getParameter("bookPrice")));
			book.setQty(Integer.parseInt(request.getParameter("qty")));
			book.setEdition(request.getParameter("edition"));
			book.setDescription(request.getParameter("description"));

			Part backImage = request.getPart("backImage");
			Part frontImage = request.getPart("frontImage");

			byte[] frontByte = frontImage.getInputStream().readAllBytes();
			byte[] backByte = backImage.getInputStream().readAllBytes();

		

			book.setBackImage(backByte);
			book.setFrontImage(frontByte);

			System.out.println("yes geeing data");
			RequestDispatcher rd5 = null;
			String status = bookservice1.updateBook(book);
			request.setAttribute("updateBook", status);

			if (status.equals("success")) {
				
				RequestDispatcher rd3 = null;
				List<Books> getAllBooks = bookservice1.searchBook();
				System.out.println(getAllBooks);
				HttpSession session = request.getSession(true);
				//request.setAttribute("allBooks", allBooks);
				session.setAttribute("getAllBooks", getAllBooks);
				//rd3 = request.getRequestDispatcher("../showallbooks.jsp");
				//rd3.forward(request, response);
			}

			// response.setProperty(response.HTTP_STATUS_CODE, "500");
			response.getWriter().print(status);
			// rd5 = request.getRequestDispatcher("../updateBooks2.jsp");
			rd5 = request.getRequestDispatcher("../updateBooks3.jsp");
			//rd5.forward(request, response);
			System.out.println("&&&&&&&&&&&&&&&&&&&&&&&");

		}

	}

}
