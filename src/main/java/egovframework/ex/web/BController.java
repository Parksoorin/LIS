package egovframework.ex.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BController {
	@RequestMapping(value = "/loginB.do")
	public String startPage(Model model) throws Exception {
		return ".login/loginB";
	}
}
