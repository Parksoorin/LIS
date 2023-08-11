package egovframework.e.web;

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

import egovframework.e.model.UserEDTO;
import egovframework.e.service.EService;
import egovframework.util.Sha256;

@Controller
public class EController {
	@Resource(name="EService")
	private EService eService;
	
	@RequestMapping(value = "/loginE.do")
	public String startPage(Model model) throws Exception {
		return ".login/loginE";
	}
	
	
	@RequestMapping(value= "/loginProcessE.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject login(@RequestParam Map<String, Object> map, HttpSession session, HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception{
		
		JSONObject json = new JSONObject();
		String id = map.get("id").toString();
		String password = map.get("password").toString();
		
		UserEDTO userEDTO = eService.findOne(id);
		
		if(userEDTO.getId() == null) {
			json.put("result", "none");
			json.put("id", id);
			return json;
		}
		
		if( id.equals(userEDTO.getId()) && 
				Sha256.encrypt(password).equals(userEDTO.getPassword())) {
			
			json.put("result", "success");
			
			
		} else {
			json.put("result", "fail");
		}
		
		return json;
	
	}
	
	@RequestMapping(value = "/joinUserE.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject exGrid(@RequestParam Map<String, Object> map, HttpSession session, HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {
		System.out.println(map);
		JSONObject json = new JSONObject();
		
		UserEDTO dto = new UserEDTO(); // ctrl + shift + o	import
		// 패스워드 암호화, 보안상의 문제가 생길 수 있음
		String pw = Sha256.encrypt(map.get("password").toString());
		
		dto.setId(map.get("id").toString());
		dto.setPassword(pw);
		
		boolean isDuplicateId = eService.duplicate(dto);
		System.out.print(isDuplicateId);
		if(isDuplicateId) {
			json.put("result",  "fail");
		} else {
			json.put("result",  "success");
			int join = eService.joinUser(dto);
			
		}
		
		
		return json;
	}
	
	@RequestMapping(value = "/DCListGrid.do")
	public String qcManagementGrid(Model model) throws Exception {
		return ".main/dclist/DCListGrid";
	}
}
