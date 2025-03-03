package poly.locth.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import poly.locth.dao.FavoriteDAO;
import poly.locth.dao.UserDAO;
import poly.locth.dao.VideoDAO;
import poly.locth.entity.Favorite;
import poly.locth.entity.Share;
import poly.locth.entity.User;
import poly.locth.entity.Video;

/**
 * Servlet implementation class ReportServlet
 */
@WebServlet("/reports/*")
public class ReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */FavoriteDAO favoriteDAO = new FavoriteDAO();
	 VideoDAO videoDAO = new VideoDAO();
	 UserDAO userDAO = new UserDAO();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.err.println(favoriteDAO.reportUFav().size());;
		Video v = new Video();
		Video v2 = new Video();

		List<Object[]> results = favoriteDAO.reportUFav();
		
		String id = request.getParameter("video-id");
		if (id == null) {
			
		}else {
			v = videoDAO.findById(id);
			videoDAO.em.refresh(v);

			List<Favorite> listfav = v.getFavorites();
		    List<Map<String, Object>> data = new ArrayList<>();
		 // Duyệt qua danh sách Favorite và lấy thông tin cần thiết
		    listfav.forEach(fav -> {
		        Map<String, Object> favData = new HashMap<>();
		        favData.put("userId", fav.getUser().getId());
		        favData.put("title",fav.getVideo().getTitle());
		        favData.put("fullname", fav.getUser().getFullname());
		        favData.put("email", fav.getUser().getEmail());
		        favData.put("likeDate", fav.getLikeDate());
		        data.add(favData);
		    });
		    
		    // Gửi dữ liệu qua request để sử dụng trong JSP
		    request.setAttribute("favoritesData", data);
			
		}
		String id2 = request.getParameter("video-id2");
		if (id2 != null) {
			v2 = videoDAO.findById(id2);
			videoDAO.em.refresh(v2);
			
			List<Share> listfav = v2.getShares();
		    List<Map<String, Object>> data = new ArrayList<>();
		 // Duyệt qua danh sách Favorite và lấy thông tin cần thiết
		    listfav.forEach(fav -> {
		        Map<String, Object> favData = new HashMap<>();
		        favData.put("emails", fav.getEmails());
		        favData.put("fullname", fav.getUser().getFullname());
		        favData.put("email", fav.getUser().getEmail());
		        favData.put("sentDate", fav.getSharedate());
		        data.add(favData);
		    });
		    
		    // Gửi dữ liệu qua request để sử dụng trong JSP
		    request.setAttribute("shareList", data);
			
		}
		
//		teen video
		request.setAttribute("videoList", videoDAO.findAll());
//		tab1
	    request.setAttribute("results", results);
	    request.getRequestDispatcher("/views/admin-report.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
