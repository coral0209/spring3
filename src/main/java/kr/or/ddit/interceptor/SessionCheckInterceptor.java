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
	

		logger.debug("sessionCheck �� �Դ��� test");
		//������������ Ȯ���ϴ� ���� session�� S_USER �Ӽ��� �ִ��� �˻��Ѵ�. 
		if(request.getSession().getAttribute("S_USER")
			 == null	) {
			response.sendRedirect("/login/view");
			return false; 
		}
				
	return true; 
	
	}

}
