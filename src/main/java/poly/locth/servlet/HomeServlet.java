package poly.locth.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import poly.locth.dao.FavoriteDAO;
import poly.locth.dao.ShareDAO;
import poly.locth.dao.UserDAO;
import poly.locth.dao.VideoDAO;
import poly.locth.entity.Favorite;
import poly.locth.entity.Share;
import poly.locth.entity.User;

/**
 * Servlet implementation class HomeServlet
 */
@WebServlet({ "/HomeServlet/index", "/HomeServlet/share", "/HomeServlet/like", "/HomeServlet/unlike" })
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final int ITEMS_PER_PAGE = 9;
	
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public HomeServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	FavoriteDAO fdao = new FavoriteDAO();
	UserDAO udao = new UserDAO();
	VideoDAO vdao = new VideoDAO();
	ShareDAO shareDAO = new ShareDAO();
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Lấy thông tin user từ session
		String uri = request.getRequestURI();
		User user = (User) request.getSession().getAttribute("user");
		if (uri.contains("/HomeServlet/index")) {

			
			
		} else if (uri.contains("/like")) {
			String like_Id = request.getParameter("like-id");
			Favorite f = new Favorite();
			f.setUser(user);			
			f.setVideo(vdao.findById(like_Id));
			fdao.create(f);
			udao.em.refresh(udao.findById(user.getId()));
			request.getSession().setAttribute("user", udao.findById(user.getId()));
			user = (User) request.getSession().getAttribute("user");
			

			request.getSession().setAttribute("user", udao.findById(user.getId()));
		
			System.err.println("sau khi like : "+user.getFavorites().size());
		}
			

//		phân trang
		int page = 1;

//        	lay chi so truoc
		String pageParam = request.getParameter("page");
		if (pageParam != null) {
			page = Integer.parseInt(pageParam);
		} else {
			try {
				page = (int) request.getSession().getAttribute("remember3");
			} catch (Exception e) {
				page = 1;
			}

		}
//        	luu vao session de ghi nho phan trang
		request.getSession().setAttribute("remember3", page);	
		int totalItems = vdao.findAll().size();
		int totalPages = (int) Math.ceil((double) totalItems / ITEMS_PER_PAGE);		
		// Tính chỉ số bắt đầu
		int start = (page - 1) * ITEMS_PER_PAGE;
		request.setAttribute("currentPage", page);
		request.setAttribute("totalPages", totalPages);
		request.setAttribute("videoList", vdao.findAllByPage(start, ITEMS_PER_PAGE));
		request.getRequestDispatcher("/views/index.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
		String email = request.getParameter("email");
		String share_id = request.getParameter("share-id");

		ShareDAO shareDAO = new ShareDAO();
		Share sh = new Share();
		sh.setUser(user);
		sh.setVideo(vdao.findById(share_id));
		sh.setEmails(email);
		shareDAO.create(sh);
		
		  String message = "Thao tác thành công!";
		    
		    response.setContentType("text/html;charset=UTF-8");
		    response.getWriter().write("<script>alert('" + message + "'); window.history.back();</script>");

//		phân trang
		int page = 1;

//        	lay chi so truoc
		String pageParam = request.getParameter("page");
		if (pageParam != null) {
			page = Integer.parseInt(pageParam);
		} else {
			try {
				page = (int) request.getSession().getAttribute("remember3");
			} catch (Exception e) {
				page = 1;
			}

		}
//        	luu vao session de ghi nho phan trang
		request.getSession().setAttribute("remember3", page);
		int totalItems = vdao.findAll().size();
		int totalPages = (int) Math.ceil((double) totalItems / ITEMS_PER_PAGE);
		// Tính chỉ số bắt đầu
		int start = (page - 1) * ITEMS_PER_PAGE;
		request.setAttribute("currentPage", page);
		request.setAttribute("totalPages", totalPages);
		request.setAttribute("videoList", vdao.findAllByPage(start, ITEMS_PER_PAGE));
		
		request.getRequestDispatcher("/views/index.jsp").forward(request, response);

	}
	
}
