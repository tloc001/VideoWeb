package poly.locth.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
 * Servlet implementation class FavServlet
 */
@WebServlet("/FavServlet/*")
public class FavServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FavServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	FavoriteDAO fdao = new FavoriteDAO();
	UserDAO userDAO = new UserDAO();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");

		String uri = request.getRequestURI();
		if (uri.contains("/unlike")) {
			String unlike_Id = request.getParameter("unlike-id");
			fdao.delete(Long.parseLong(unlike_Id));
			
			
			
			request.getSession().setAttribute("user", userDAO.findById(user.getId()));
			user = (User) request.getSession().getAttribute("user");
			
			
			
			response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
			response.setHeader("Pragma", "no-cache");
			response.setDateHeader("Expires", 0);
			System.err.println("sau khi unlike : "+user.getFavorites().size());
		} else if (uri.contains("share")) {

		}
		// Lấy thông tin user
		User me = userDAO.findById(user.getId());
//		load lại dữ liệu
		userDAO.em.refresh(me);
		// Lấy danh sách yêu thích của user
		List<Favorite> list = me.getFavorites();

		// Chuẩn bị một danh sách chứa dữ liệu cần thiết từ `Favorite`
		List<Map<String, Object>> videoList = new ArrayList<>();
		list.forEach(fav -> {
			Map<String, Object> videoData = new HashMap<>();
			videoData.put("id", fav.getId());
			videoData.put("idvideo", fav.getVideo().getId());
			videoData.put("title", fav.getVideo().getTitle());
			videoData.put("poster", fav.getVideo().getPoster());
			videoList.add(videoData);
		});
		System.err.println( " aa " +videoList.size());
		// Đưa danh sách này vào request
		request.removeAttribute("videoList1");
		request.setAttribute("videoList1", videoList);
		request.getRequestDispatcher("/views/favorite-video.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	VideoDAO vdao = new VideoDAO();

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");

		String email = request.getParameter("email");
		String note = request.getParameter("note");
		String share_id = request.getParameter("share-id");

		ShareDAO shareDAO = new ShareDAO();
		Share sh = new Share();
		sh.setUser(user);
		sh.setVideo(vdao.findById(share_id));
		shareDAO.create(sh);

		// Lấy thông tin user
		User me = userDAO.findById(user.getId());

		// Lấy danh sách yêu thích của user
		List<Favorite> list = me.getFavorites();

		// Chuẩn bị một danh sách chứa dữ liệu cần thiết từ `Favorite`
		List<Map<String, Object>> videoList = new ArrayList<>();

		list.forEach(fav -> {
			Map<String, Object> videoData = new HashMap<>();
			videoData.put("id", fav.getVideo().getId());
			videoData.put("title", fav.getVideo().getTitle());
			videoData.put("poster", fav.getVideo().getPoster());
			videoList.add(videoData);
		});

		// Đưa danh sách này vào request
		request.setAttribute("videoList", videoList);

		request.getRequestDispatcher("/views/favorite-video.jsp").forward(request, response);
	}

}
