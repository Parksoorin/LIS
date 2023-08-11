package egovframework.d.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
import egovframework.d.model.lisq100DTO;
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
	
	@RequestMapping(value = "/joinUserD.do", method = RequestMethod.POST)
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
	
	@RequestMapping(value = "/loginUserD.do", method = RequestMethod.POST)
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
	
	@RequestMapping(value = "/qcManagementGrid.do")
	public String qcManagementGrid(Model model) throws Exception {
		return ".main/qcmanagement/QCManagementGrid";
	}
	
	
	@RequestMapping(value = "/qcManagementLisq100.do")
	@ResponseBody
	public JSONObject qcManagementLisq100(@RequestParam Map<String,Object> map, HttpSession session, HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {
		JSONObject json = new JSONObject();
		List<lisq100DTO> data = dService.lisq100();
//		List<Map> dataList = new ArrayList();
		
		System.out.println(data);
		System.out.println(data.size());
		System.out.println(data.get(0).getQcCode());
		
//		for(int i=0;i<data.size();i++) {
//			Map<String,Object> map1 = new HashMap<String,Object>();
//			// 'QC 코드','QC물질명','Lot No', 'Level', '검사파트', '시작일', '종료일', '고정검체번호',
//			map1.put("QC 코드", data.get(i).getQcCode());
////			map1.put("QC물질명", i+20);
//			dataList.add(map1);
//		}
		
//		json.put("rows", dataList);
		
		return json;
	}
}
