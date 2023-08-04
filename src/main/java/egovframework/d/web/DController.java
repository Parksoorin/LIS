package egovframework.d.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DController {
	@RequestMapping(value = "/loginD.do")
	public String startPage(Model model) throws Exception {
		return ".login/loginD";
	}
}
