package poly.locth.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.fasterxml.jackson.databind.ObjectMapper;

import poly.locth.dao.UserDAO;
import poly.locth.entity.User;

/**
 * Servlet implementation class ManagerUsers
 */
@WebServlet({"/users/*"})
public class ManagerUsers extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static final int ITEMS_PER_PAGE = 5;

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerUsers() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */UserDAO udao = new UserDAO();
	 @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
////		lấy thông tin
//		String info = request.getPathInfo();
////		nếu null thì lấy hết us
//		if (info == null) {
//			ObjectMapper mapper = new ObjectMapper();
//			String json = mapper.writeValueAsString(udao.findAll());
//			response.setContentType("application/json");
//			response.setCharacterEncoding("utf-8");
//			response.getWriter().print(json);
//		}
	if (request.getRequestURI().contains("/edit")) {
		String id = request.getParameter("id-user");
		if (id == null) {
			
		}else {			
			request.setAttribute("userEdit",udao.findById(id) );
		}
	}
		// Lấy số trang từ request, mặc định là 1
        int page = 1 ;     
       
//        	lay chi so truoc
        	String pageParam = request.getParameter("page");
			if (pageParam != null) {
				page = Integer.parseInt(pageParam);
			}else {
				try {
					page = (int) request.getSession().getAttribute("remember1");
				} catch (Exception e) {
					page = 1;
				}
				
			}
//        	luu vao session de ghi nho phan trang
        	request.getSession().setAttribute("remember1",page);
        int totalItems = udao.findAll().size();
        int totalPages = (int) Math.ceil((double) totalItems / ITEMS_PER_PAGE);
        // Tính chỉ số bắt đầu
        int start = (page - 1) * ITEMS_PER_PAGE;
        System.err.println("remember ddc luu "+ request.getSession().getAttribute("remember1"));
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        System.err.println(page+" page bang nhiu as");
        
        
		request.setAttribute("totalUsers", udao.findAll().size());
		request.setAttribute("userList", udao.findAllByPage(start,ITEMS_PER_PAGE));
	 request.getRequestDispatcher("/views/admin-user.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String uri = request.getRequestURI();
		 if (uri.contains("/create")) {
			User uNew = new User();
			try {
				BeanUtils.populate(uNew, request.getParameterMap());
				
				udao.create(uNew);
				request.setAttribute("messege", "Them thanh cong");
			} catch (Exception e) {
				request.setAttribute("messege", "Them that bai");
			}
		}else if(uri.contains("/update")) {
			User uNew = new User();
			try {
				BeanUtils.populate(uNew, request.getParameterMap());
				udao.update(uNew);
				request.setAttribute("messege", "Sua thanh cong");
			} catch (Exception e) {
				request.setAttribute("messege", "Sua that bai");
			}
		}else if(uri.contains("/delete")) {
			String id = request.getParameter("id-user");
			User uNew = new User();
			try {
				BeanUtils.populate(uNew, request.getParameterMap());
				udao.delete(id);
				request.setAttribute("messege", "Xoa thanh cong");
			} catch (Exception e) {
				request.setAttribute("messege", "Xoa that bai");
			}
		}
		// Lấy số trang từ request, mặc định là 1
	        int page = 1 ;     
	       
//	        	lay chi so truoc
	        	String pageParam = request.getParameter("page");
				if (pageParam != null) {
					page = Integer.parseInt(pageParam);
				}else {
					try {
						page = (int) request.getSession().getAttribute("remember1");
					} catch (Exception e) {
						page = 1;
					}
					
				}
//	        	luu vao session de ghi nho phan trang
	        	request.getSession().setAttribute("remember1",page);
	        int totalItems = udao.findAll().size();
	        int totalPages = (int) Math.ceil((double) totalItems / ITEMS_PER_PAGE);
	        // Tính chỉ số bắt đầu
	        int start = (page - 1) * ITEMS_PER_PAGE;
	        System.err.println("remember ddc luu "+ request.getSession().getAttribute("remember1"));
	        request.setAttribute("currentPage", page);
	        request.setAttribute("totalPages", totalPages);
	        System.err.println(page+" page bang nhiu as");
	        
	        
			request.setAttribute("totalUsers", udao.findAll().size());
			request.setAttribute("userList", udao.findAllByPage(start,ITEMS_PER_PAGE));
		 request.getRequestDispatcher("/views/admin-user.jsp").forward(request, response);
	}

}
