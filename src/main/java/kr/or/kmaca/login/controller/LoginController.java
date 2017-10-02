package kr.or.kmaca.login.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.or.kmaca.email.Email;
import kr.or.kmaca.email.EmailSender;
import kr.or.kmaca.login.service.LoginService;
import kr.or.kmaca.security.vo.UserInfo;


@Controller
@RequestMapping(value = "/login")
public class LoginController {
	
	@Autowired
	private LoginService loginService;
	
	@Autowired
	private EmailSender emailSender;
	
	@Autowired
	private Email email;
	
	//로그인
	@RequestMapping(value = "/login")
	public String login(ModelMap map) throws Exception {
		return "login/login";
	}
	//회원가입
	@RequestMapping(value = "/insertId")
	@ResponseBody
	public void insertId(UserInfo userInfo) throws Exception {
		loginService.insertId(userInfo);
	}
	//아이디 중복체크
	@RequestMapping(value = "/idCheck")
	@ResponseBody
	public String idCheck(UserInfo userInfo) throws Exception {
		return loginService.idCheck(userInfo);
	}
	
	    @RequestMapping("/sendpw.do")
	    public ModelAndView sendEmailAction (@RequestParam Map<String, Object> paramMap, ModelMap model) throws Exception {
	        ModelAndView mav;
	        String id=(String) paramMap.get("id");
	        String e_mail=(String) paramMap.get("email");
	        String pw=loginService.getPw(paramMap);
	        System.out.println(pw);
	        if(pw!=null) {
	            email.setContent("비밀번호는 "+pw+" 입니다.");
	            email.setReceiver(e_mail);
	            email.setSubject(id+"님 비밀번호 찾기 메일입니다.");
	            emailSender.SendEmail(email);
	            mav= new ModelAndView("redirect:/login.do");
	            return mav;
	        }else {
	            mav=new ModelAndView("redirect:/logout.do");
	            return mav;
	        }
	    }
	
}
