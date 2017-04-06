package kr.or.kmaca.security.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;

public class CustomLoginFailureHandler extends SimpleUrlAuthenticationFailureHandler {

	private String defaultFailureUrl;

	public String getDefaultFailureUrl() {
		return defaultFailureUrl;
	}

	public void setDefaultFailureUrl(String defaultFailureUrl) {
		this.defaultFailureUrl = defaultFailureUrl;
	}

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {

		// TODO...
		if (exception instanceof BadCredentialsException
				|| exception instanceof InternalAuthenticationServiceException) {
			this.defaultFailureUrl = request.getContextPath() + "/login/login.do?error=1";
		} else {
			this.defaultFailureUrl = request.getContextPath() + "/login/login.do?error=999";
		}

		super.setDefaultFailureUrl(this.defaultFailureUrl);
		super.onAuthenticationFailure(request, response, exception);
	}
}
