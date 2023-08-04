package egovframework.a.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AController {
	@RequestMapping(value = "/loginA.do")
	public String startPage(Model model) throws Exception {
		return ".login/loginA";
	}
}
