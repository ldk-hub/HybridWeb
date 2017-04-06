package kr.or.kmaca.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/login")
public class LoginController {

	@RequestMapping(value = "/login")
	public String login(ModelMap map) throws Exception {
		return "login/login";
	}
	
}
