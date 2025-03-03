package poly.locth.servlet;

import java.io.File;
import java.io.IOException;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import poly.locth.dao.UserDAO;
import poly.locth.entity.User;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet({ "/UserServlet/login", "/UserServlet/logout", "/UserServlet/forgot", "/UserServlet/change-pass",
		"/UserServlet/edit-profile", "/UserServlet/register" })
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	UserDAO udao = new UserDAO();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		đăng xuất
		if (request.getRequestURI().contains("/logout")) {
//			xóa session ng dùng hiện tại
			request.getSession().removeAttribute("user");
			response.sendRedirect("/ASM_Java4/HomeServlet/index");
//			đăng nhập
		} else if (request.getRequestURI().contains("UserServlet/register")) {
			request.setAttribute("showAc", "on");
			request.getRequestDispatcher("/views/login.jsp").forward(request, response);
//			lấy lại pass
		}

		else if (request.getRequestURI().contains("UserServlet/forgot")) {
			User uForgot = new User();
			try {
				// Lấy dữ liệu từ request
				BeanUtils.populate(uForgot, request.getParameterMap());
				System.err.println(uForgot.getId() + " pass " + uForgot.getEmail());

				// Kiểm tra tài khoản
				User checkFogot = udao.findById(uForgot.getId());
				if (checkFogot != null && uForgot.getEmail().equals(checkFogot.getEmail())) {

//			            forwardTo = "/forgot"; // Chuyển đến trang quên mật khẩu
					sendMail(checkFogot, request, response);
					request.setAttribute("messege", "Đã gửi mật khẩu thông qua email : " + uForgot.getEmail());
					request.getRequestDispatcher("/views/forgot-pass.jsp").forward(request, response);
					return;
				} else {
					// Sai mật khẩu
					request.setAttribute("messege", "Sai tài khoản hoặc email");
				}
			} catch (Exception e) {
				// Sai tài khoản hoặc lỗi truy vấn
				request.setAttribute("messege", "Sai tài khoản ");
				e.printStackTrace();
			}
			request.getRequestDispatcher("/views/forgot-pass.jsp").forward(request, response);

		}
//		edit-profile
		else if (request.getRequestURI().contains("UserServlet/edit-profile")) {
			request.getRequestDispatcher("/views/edit-profile.jsp").forward(request, response);

		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("servlet chạy s");
		User uLogin = new User();
		System.err.println(request.getParameter("remember"));
		String forwardTo = "/views/login.jsp"; // Mặc định quay lại trang login
//	    change-pass

		if (request.getRequestURI().contains("UserServlet/change-pass")) {
			User uChange = new User();
			try {
				// Lấy dữ liệu từ request
				BeanUtils.populate(uChange, request.getParameterMap());
				System.err.println(uChange.getId() + " pass " + uChange.getPassword());

				// Kiểm tra tài khoản
				User change = udao.findById(uChange.getId());
				if (change != null && uChange.getPassword().equals(change.getPassword())) {
					change.setPassword(request.getParameter("newpass"));
					udao.update(change);
//			Chuyển đến trang change mật khẩu
					request.setAttribute("messege", "Cập nhật mật khẩu thành công ");
					request.getRequestDispatcher("/views/change-pass.jsp").forward(request, response);
					return;
				} else {
					// Sai mật khẩu
					request.setAttribute("messege", "Sai tài khoản hoặc mật khẩu");
				}
			} catch (Exception e) {
				// Sai tài khoản hoặc lỗi truy vấn
				request.setAttribute("messege", "Sai tài khoản hoặc mật khẩu ");
				e.printStackTrace();
			}
			request.getRequestDispatcher("/views/change-pass.jsp").forward(request, response);

		}
//	     chinh sua edit
		else if (request.getRequestURI().contains("UserServlet/edit-profile")) {
			User uChange = new User();
			try {
				// Lấy dữ liệu từ request
				BeanUtils.populate(uChange, request.getParameterMap());
				udao.update(uChange);
				request.setAttribute("messege", "Cập nhật thành công ");
				request.getSession().setAttribute("user", uChange);
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.getRequestDispatcher("/views/edit-profile.jsp").forward(request, response);
		} else if (request.getRequestURI().contains("UserServlet/register")) {
			User register = new User();
			String selectPage = "/views/login.jsp";
			String isActive = null;
			try {
				BeanUtils.populate(register, request.getParameterMap());
				if (udao.findById(register.getId())== null) {
					
					udao.create(register);
					request.setAttribute("messege", "Đăng kí thành công");
					selectPage = "/views/index.jsp";
					request.getSession().setAttribute("user", register);					
//					chuyển tới trang chủ
					response.sendRedirect(request.getContextPath() + "/HomeServlet/index");
					return;
				}else {
					isActive = "on";
					request.setAttribute("messege", "tài khoản đã tồn tại");
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
			request.setAttribute("showAc", isActive);
			request.getRequestDispatcher(selectPage).forward(request, response);
		}
		else {
//		    login

			try {
				// Lấy dữ liệu từ request
				BeanUtils.populate(uLogin, request.getParameterMap());
				System.err.println(uLogin.getId() + " pass " + uLogin.getPassword());

				// Kiểm tra tài khoản
				User checkLogin = udao.findById(uLogin.getId());
				if (checkLogin != null && uLogin.getPassword().equals(checkLogin.getPassword())) {
					// Đăng nhập thành công
					request.getSession().setAttribute("user", checkLogin);
//		            forwardTo = "/HomeServlet"; // Chuyển đến trang chính
					if (checkLogin.getAdmin()) {
						response.sendRedirect(request.getContextPath() + "/videos");
						return;
					}else {
						response.sendRedirect(request.getContextPath() + "/HomeServlet/index");
						return;
					}
					
				} else {
					// Sai mật khẩu
					request.setAttribute("messeges", "Sai tài khoản hoặc mật khẩu");
				}
			} catch (Exception e) {
				// Sai tài khoản hoặc lỗi truy vấn
				request.setAttribute("messeges", "Sai tài khoản hoặc mật khẩu");
				e.printStackTrace();
			}

			// Chỉ forward một lần dựa trên kết quả
			request.getRequestDispatcher(forwardTo).forward(request, response);
		}

	}

	private void sendMail(User email1, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			Properties p = new Properties();
			p.put("mail.smtp.auth", "true");
			p.put("mail.smtp.starttls.enable", "true");
			p.put("mail.smtp.ssl.protocols", "TLSv1.2");
			p.put("mail.smtp.host", "smtp.gmail.com");
			p.put("mail.smtp.port", 587);
			p.put("mail.debug", "true");
			Session s = Session.getDefaultInstance(p, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("loctranhuu96@gmail.com", "evbv crav avsw pewj");
				}
			});
			javax.mail.Message msg = new MimeMessage(s);
			msg.setFrom(new InternetAddress("loctranhuu96@gmail.com"));
//        String email1 = request.getParameter("id");
			msg.setRecipients(javax.mail.Message.RecipientType.TO, InternetAddress.parse(email1.getEmail()));
//        String subject = request.getParameter("subject");
			String subject = "Mật khẩu của bạn";
			msg.setSubject(subject);
//        String content = request.getParameter("body");
			String content = "Mật khẩu của bạn là " + email1.getPassword()
					+ ". Hãy ghi nhớ mật khẩu của bạn, không chia sẻ với bất kì ai.";
			MimeBodyPart contenpart = new MimeBodyPart();

			contenpart.setContent(content, "text/html; charset=utf-8");

			MimeMultipart multipart = new MimeMultipart();

			multipart.addBodyPart(contenpart);
			msg.setContent(multipart);
			Transport.send(msg);
			request.setAttribute("message", "Send email success!");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			request.setAttribute("message", "Send email fail!");
		}
	}
}
