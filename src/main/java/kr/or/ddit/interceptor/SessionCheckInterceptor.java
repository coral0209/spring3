package kr.or.ddit.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class SessionCheckInterceptor extends HandlerInterceptorAdapter {
	
	private static final Logger logger = LoggerFactory.getLogger(SessionCheckInterceptor.class);
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
	

		logger.debug("sessionCheck 잘 왔는지 test");
		//정상접속인지 확인하는 로직 session에 S_USER 속성이 있는지 검사한다. 
		if(request.getSession().getAttribute("S_USER")
			 == null	) {
			response.sendRedirect("/login/view");
			return false; 
		}
				
	return true; 
	
	}

}
