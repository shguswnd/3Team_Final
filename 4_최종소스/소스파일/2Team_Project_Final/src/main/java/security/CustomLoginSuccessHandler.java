package security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest  request, 
										HttpServletResponse response,
										Authentication      authentication) throws IOException, ServletException 
	{
		String userType = request.getParameter("type") == null ? "admin" : "default" ;
		
		String redirectURL = "/";
		
		if (userType.equals("admin")) {
			List<String> roleList = new ArrayList<String>();
			authentication.getAuthorities().forEach(authority->{
				roleList.add(authority.getAuthority());
			});
			redirectURL = roleList.contains("ROLE_ADMIN") ? "/admin" : "/";
		}
		
		response.sendRedirect(redirectURL);
	}
}
