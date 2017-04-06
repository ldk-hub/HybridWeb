package kr.or.kmaca.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommonController {

	@RequestMapping(value = "/index.do")
	public String index(ModelMap map) throws Exception {
		return "/index";
	}
}
