package egovframework.d.web;

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

import egovframework.d.model.UserDDTO;
import egovframework.d.service.DService;
import egovframework.util.Sha256;

@Controller
public class DController {
	
	@Resource(name="DService")
	DService dService;
	
	@RequestMapping(value = "/loginD.do")
	public String startPage(Model model) throws Exception {
		return ".login/loginD";
	}
	
	@RequestMapping(value = "/joinUser.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject singup(@RequestParam Map<String,Object> map, HttpSession session, HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {
		JSONObject json = new JSONObject();
		UserDDTO dto = new UserDDTO();
		
		String id = map.get("id").toString();
		int check = dService.checkUser(id);
		
		// System.out.println(check);
		
		if (check != 1) {
			String pw = Sha256.encrypt(map.get("password").toString());
			dto.setId(id);
			dto.setPassword(pw);
			// 서비스의 조인유저를 실행하라
			int join = dService.joinUser(dto);
			json.put("result", "success");
		} else {
			json.put("result", "error");
		}
		
		return json;
	}
	
	@RequestMapping(value = "/loginUser.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject login(@RequestParam Map<String,Object> map, HttpSession session, HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {
		JSONObject json = new JSONObject();
		UserDDTO dto = new UserDDTO();
		
		String id = map.get("id").toString();
		String pw = Sha256.encrypt(map.get("password").toString());
		
		dto.setId(id);
		dto.setPassword(pw);
		
		UserDDTO login = dService.loginUser(dto);
		
		if (login.getId() == null) {
			json.put("result", "error");
		} else {
			json.put("user", login);
			json.put("result", "success");
		}
		
		return json;
	}
}
