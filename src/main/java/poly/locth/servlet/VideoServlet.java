package poly.locth.servlet;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.nio.file.Paths;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;
import poly.locth.dao.VideoDAO;
import poly.locth.entity.Video;

/**
 * Servlet implementation class VideoServlet
 */
@WebServlet({"/VideoServlet/detail","/videos/*"})
@MultipartConfig
public class VideoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String UPLOAD_DIRECTORY = "uploads";
    private static final int ITEMS_PER_PAGE = 5;

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VideoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */		VideoDAO vdao = new VideoDAO();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String info = request.getPathInfo();
		
		String forward = "/views/detail-video.jsp";
		if (request.getRequestURI().contains("VideoServlet/detail")) {
			String idVideo = request.getParameter("id");		
			System.out.println(idVideo);
			Video vid = vdao.findById(idVideo);
			int views = vid.getViews();
			vid.setViews(views+1);
			vdao.update(vid);
			
			
			  Random random = new Random();
			    int totalItems = vdao.findAll().size();
		        int totalPages = (int) Math.ceil((double) totalItems / ITEMS_PER_PAGE);
		        // Lấy giá trị ngẫu nhiên trong khoảng từ 1 đến 10 (bao gồm 1 và 10)
		        int randomValue = random.nextInt(totalPages) + 1; // nextInt(10) trả về giá trị từ 0 đến 9
		        request.setAttribute("videoList2", vdao.findAllByPage(randomValue, ITEMS_PER_PAGE));
			
			request.setAttribute("video", vid);
			
		}else if(info != null && !info.contains("/detail")){
			String id = info.substring(1).trim();			
			request.setAttribute("videoEdit",vdao.findById(id) );
		
			forward = "/views/admin-vid.jsp";
			
						
		}else {
		
			forward = "/views/admin-vid.jsp";
		}
		
		// Lấy số trang từ request, mặc định là 1
        int page = 1 ;     
       
//        	lay chi so truoc
        	String pageParam = request.getParameter("page");
			if (pageParam != null) {
				page = Integer.parseInt(pageParam);
			}else {
				try {
					page = (int) request.getSession().getAttribute("remember");
				} catch (Exception e) {
					page = 1;
				}
				
			}
//        	luu vao session de ghi nho phan trang
        	request.getSession().setAttribute("remember",page);
        int totalItems = vdao.findAll().size();
        int totalPages = (int) Math.ceil((double) totalItems / ITEMS_PER_PAGE);
        // Tính chỉ số bắt đầu
        int start = (page - 1) * ITEMS_PER_PAGE;
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        
			request.setAttribute("totalVideos", vdao.findAll().size());
        request.setAttribute("videoList", vdao.findAllByPage(start, ITEMS_PER_PAGE));       
		request.getRequestDispatcher(forward).forward(request, response);
	
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String info = request.getPathInfo();
		
		  if (info != null) {
				String id = info.substring(1).trim();
						if (request.getParameter("action").contains("delete")) {
							vdao.delete(id);
						}else {
							try {
								Video a = vdao.findById(id);							
								BeanUtils.populate(a, request.getParameterMap());
								Part filePart = request.getPart("poster"); // Lấy phần file
								String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // Lấy
																														// tên
																														// file
//			          	        nếu ng dùng kh chọn ảnh
								if (!fileName.isEmpty()) {
									// Đường dẫn lưu ảnh trên server
									String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
									File uploadDir = new File(uploadPath);
									if (!uploadDir.exists()) {
										uploadDir.mkdir();
									}
									// Lưu file ảnh lên server
									String filePath = uploadPath + File.separator + fileName;
									filePart.write(filePath);
									// Đường dẫn ảnh để hiện thị lên JSP
									String photoURL = UPLOAD_DIRECTORY + "/" + fileName;
									a.setPoster(photoURL);
								}
								vdao.update(a);
								vdao.em.flush();
								vdao.em.refresh(a);
								request.setAttribute("message", "Sửa thành công");
							} catch (Exception e) {
								request.setAttribute("message", "Sửa thất bại");
							}
						}
					} else {
						Video a1 = new Video();
						try {
							BeanUtils.populate(a1, request.getParameterMap());
//		          			hình ảnh
							System.out.println("okk");
							Part filePart = request.getPart("poster"); // Lấy phần file
							String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // Lấy
																													// tên
																													// file
							// Đường dẫn lưu ảnh trên server
							String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
							File uploadDir = new File(uploadPath);
							if (!uploadDir.exists()) {
								uploadDir.mkdir();
							}
							// Lưu file ảnh lên server
							String filePath = uploadPath + File.separator + fileName;
							filePart.write(filePath);
							// Đường dẫn ảnh để hiện thị lên JSP
							String photoURL = UPLOAD_DIRECTORY + "/" + fileName;
							a1.setPoster(photoURL);
							vdao.create(a1);
							request.setAttribute("message", "Thêm thành công");
						} catch (IllegalAccessException | InvocationTargetException e) {
							request.setAttribute("message", "Thêm thất bại");
							e.printStackTrace();
						}
					}
		  int page = 1 ;     
	       
//      	lay chi so truoc
      	String pageParam = request.getParameter("page");
			if (pageParam != null) {
				page = Integer.parseInt(pageParam);
			}else {
				try {
					page = (int) request.getSession().getAttribute("remember");
				} catch (Exception e) {
					page = 1;
				}
				
			}
//      	luu vao session de ghi nho phan trang
      	request.getSession().setAttribute("remember",page);
      int totalItems = vdao.findAll().size();
      int totalPages = (int) Math.ceil((double) totalItems / ITEMS_PER_PAGE);
      // Tính chỉ số bắt đầu
      int start = (page - 1) * ITEMS_PER_PAGE;
      request.setAttribute("currentPage", page);
      request.setAttribute("totalPages", totalPages);

		  			System.err.println(request.getSession().getAttribute("remember")+ "aaaa");
		  			request.setAttribute("videoList", vdao.findAllByPage(start,ITEMS_PER_PAGE));
		  			request.setAttribute("totalVideos", vdao.findAll().size());
					request.getRequestDispatcher("/views/admin-vid.jsp").forward(request, response);
				}
				
				
		  
			
	}


