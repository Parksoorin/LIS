package egovframework.ex.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.ex.service.exService;

@Controller
public class exController {

	@Resource(name = "exService")
	private exService exService;
	
	@RequestMapping(value = "/oneGrid.do")
	public String oneGrid(Model model) throws Exception {
		return "main/oneGrid";
	}
	@RequestMapping(value = "/twoGrid.do")
	public String twoGrid(Model model) throws Exception {
		return "main/twoGrid";
	}
	@RequestMapping(value = "/threeGrid.do")
	public String threeGrid(Model model) throws Exception {
		return "main/threeGrid";
	}
	
}
