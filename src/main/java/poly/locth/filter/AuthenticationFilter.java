package poly.locth.filter;

import java.io.IOException;
import java.util.Date;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import poly.locth.entity.User;

/**
 * Servlet Filter implementation class UTF_8
 */
@WebFilter({"/HomeServlet/unlike","/FavServlet/*","/HomeServlet/like","/HomeServlet/share","/UserServlet/edit-profile","/UserServlet/change-pass"})
public class AuthenticationFilter extends HttpFilter implements Filter {
       
    /**
     * @see HttpFilter#HttpFilter()
     */
    public AuthenticationFilter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse)resp;
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");		
		User user = (User) request.getSession().getAttribute("user");
		if (user != null) {
			String uri = request.getRequestURI();
			Date time = new Date();	
			System.out.println("User "+user.getId() + user.getFullname()+ " đã đăng nhập vào lúc "+ time + "vào " +uri);
			chain.doFilter(request, response);
		}else if(user == null) {
			request.getSession().setAttribute("messeges", "Đăng nhập đi bạn");
			response.sendRedirect("/ASM_Java4/views/login.jsp");
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
