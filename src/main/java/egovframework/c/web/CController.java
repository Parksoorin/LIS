package egovframework.c.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CController {
	@RequestMapping(value = "/loginC.do")
	public String startPage(Model model) throws Exception {
		return ".login/loginC";
	}
}
