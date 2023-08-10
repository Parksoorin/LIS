package egovframework.c.web;

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

import egovframework.c.model.UserCDTO;
import egovframework.c.service.CService;
import egovframework.util.Sha256;

@Controller
public class CController {
	
	@Resource(name = "CService")  // 서비스 선언
	CService cService;
	
	@RequestMapping(value = "/loginC.do")
	public String startPage(Model model) throws Exception {
		return ".login/loginC";
	}
	@RequestMapping(value = "/oneGridC.do")
	public String oneGridCPage(Model model) throws Exception {
		return ".main/oneGridC/oneGridC";
	}
	
	@RequestMapping(value = "/joinUserC.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject exGrid(@RequestParam Map<String, Object> map, HttpSession session, HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {

		JSONObject json = new JSONObject();
		UserCDTO dto = new UserCDTO();
		String pw = Sha256.encrypt(map.get("password").toString());
		dto.setId(map.get("id").toString());
		dto.setPassword(pw);
		
		int result = cService.userID(dto);  // boolean도 사용 가능. true or false . 서버는 무조건 거쳐야됨.
		if (result == 1) {
			json.put("result", "fail");  // 서비스에서 가져온걸 리턴. 거의 값 전달만 해줌.
		}
		else {
		// -- //
		int join = cService.joinUserC(dto);  // 서비스 조인 유저 실행
		json.put("result", "success");  // 서비스에서 가져온걸 리턴. 거의 값 전달만 해줌.
		}
		
		return json;
	}
	
	@RequestMapping(value = "/loginID.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject oneGrid(@RequestParam Map<String, Object> map, HttpSession session, HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {
		
		JSONObject json = new JSONObject();
		UserCDTO dto = new UserCDTO();
		String pw = Sha256.encrypt(map.get("password").toString());
		dto.setId(map.get("id").toString());
		dto.setPassword(pw);
		
		UserCDTO result = cService.loginID(dto);  // boolean도 사용 가능. true or false
		
		if (result == null) {
			json.put("result", "none");  // 서비스에서 가져온걸 리턴. 거의 값 전달만 해줌.
		}
		else {
			json.put("result", "success");  // 서비스에서 가져온걸 리턴. 거의 값 전달만 해줌.
		}
		
		return json;
	}
}





