package egovframework.b.web;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.b.model.UserBDTO;
import egovframework.b.service.BService;
import egovframework.util.Sha256;

@Controller
public class BController {
	@Resource(name="BService")
	BService bService;
	
	@RequestMapping(value = "/loginB.do")
	public String startPage(Model model) throws Exception {
		return ".login/loginB";
	}
	
	@RequestMapping(value = "/joinUser.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject exGrid(@RequestParam Map<String, Object> map, HttpSession session, HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {
		System.out.println(map);
		JSONObject json = new JSONObject();
		
		UserBDTO dto = new UserBDTO(); // ctrl + shift + o	import
		// 패스워드 암호화, 보안상의 문제가 생길 수 있음
		String pw = Sha256.encrypt(map.get("password").toString());
		
		dto.setId(map.get("id").toString());
		dto.setPassword(pw);
		
		boolean isDuplicateId = bService.duplicate(dto);
		System.out.print(isDuplicateId);
		if(isDuplicateId) {
			json.put("result",  "fail");
		} else {
			json.put("result",  "success");
			int join = bService.joinUser(dto);
			
		}
		
		
		
		
		return json;
	}
}
