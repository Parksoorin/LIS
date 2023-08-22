package egovframework.c.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.c.model.UserCDTO;
import egovframework.c.model.lisc001DTO;
import egovframework.c.model.lisc002DTO;
import egovframework.c.model.lisc003DTO;
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
	@RequestMapping(value = "/oneGridPage.do")
	public String oneGridPage(Model model) throws Exception {
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
	
	@RequestMapping(value = "/oneGridC.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject lisc001DTO(@RequestParam Map<String, Object> map, HttpSession session, HttpServletRequest request,
	HttpServletResponse response, Model model) throws Exception {

		System.out.println(map);
		JSONObject json = new JSONObject();
		try {
		    List<lisc001DTO> data = cService.lisc001list();
		    System.out.println(data);
		    JSONArray rowsArray = new JSONArray();
		    for (lisc001DTO item : data) {
		        JSONObject row = new JSONObject();
		        row.put("CODE_TYPE", item.getCodeType());
		        row.put("CODE_TYPE_NAME", item.getCodeTypeName());
		        row.put("COMMENTS", item.getComments());
		        // 필요한 다른 필드 추가
		        rowsArray.add(row);
		    }
		    json.put("rows", rowsArray);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return json;
	}
	
	
	
	@RequestMapping(value = "/oneGridC002.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject lisc002DTO(@RequestParam Map<String, Object> map, HttpSession session, HttpServletRequest request,
	HttpServletResponse response, Model model) throws Exception {
		String codetype = (String) map.get("type");
		System.out.println(map.get("type"));
		JSONObject json = new JSONObject();
		try {
		    List<lisc002DTO> data = cService.codetype(codetype);
		    System.out.println(data);
		    JSONArray rowsArray = new JSONArray();
		    for (lisc002DTO item : data) {
		        JSONObject row = new JSONObject();
		        row.put("CODE_TYPE", item.getCodeType());
		        row.put("CODE", item.getCode());
		        row.put("ITEM1", item.getItem1());
		        row.put("ITEM2", item.getItem2());
		        row.put("ITEM3", item.getItem3());
		        row.put("ITEM4", item.getItem4());
		        row.put("ITEM5", item.getItem5());
		        row.put("REMARK1", item.getRemark1());
		        row.put("REMARK2", item.getRemark2());
		        row.put("COMMENTS", item.getComments());
		        // 필요한 다른 필드 추가
		        rowsArray.add(row);
		    }
		    json.put("rows", rowsArray);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return json;
	}
	
	@RequestMapping(value = "/oneGridC003.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject lisc003DTO(@RequestParam Map<String, Object> map, HttpSession session, HttpServletRequest request,
	HttpServletResponse response, Model model) throws Exception {
		String code = (String) map.get("type");
		System.out.println(map.get("type"));
		JSONObject json = new JSONObject();
		try {
		    List<lisc003DTO> data = cService.code(code);
		    System.out.println(data);
		    JSONArray rowsArray = new JSONArray();
		    for (lisc003DTO item : data) {
		        JSONObject row = new JSONObject();
		        row.put("CODE_TYPE", item.getCodeType());
		        row.put("CODE", item.getCode());
		        row.put("ITEM1", item.getItem1());
		        row.put("ITEM2", item.getItem2());
		        row.put("ITEM3", item.getItem3());
		        row.put("ITEM4", item.getItem4());
		        row.put("ITEM5", item.getItem5());
		        row.put("REMARK1", item.getRemark1());
		        row.put("REMARK2", item.getRemark2());
		        row.put("COMMENTS", item.getComments());
		        // 필요한 다른 필드 추가
		        rowsArray.add(row);
		    }
		    json.put("rows", rowsArray);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return json;
	}
}





