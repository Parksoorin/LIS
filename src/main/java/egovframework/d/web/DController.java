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
import egovframework.d.model.lisc100DTO;
import egovframework.d.model.lisq100DTO;
import egovframework.d.model.lisq110DTO;
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
		List<Map> dataList = new ArrayList();
		
		for(int i=0; i<data.size(); i++) {
			Map<String,Object> map1 = new HashMap<String,Object>();
			// 'QC 코드','QC물질명','Lot No', 'Level', '검사파트', '시작일', '종료일', '고정검체번호',
			map1.put("qcCode", data.get(i).getQcCode());
			map1.put("qcName", data.get(i).getQcName());
			map1.put("lotNo", data.get(i).getLotNo());
			map1.put("qcLevel", data.get(i).getQcLevel());
			map1.put("testPart", data.get(i).getItem1());
			map1.put("startDate", data.get(i).getStartDate());
			map1.put("endDate", data.get(i).getEndDate());
			map1.put("qcSpecimenSer", data.get(i).getQcSpecimenSer());
			dataList.add(map1);
		}
		
		json.put("rows", dataList);
		
		return json;
	}
	
	@RequestMapping(value = "/qcManagementLisq110.do")
	@ResponseBody
	public JSONObject qcManagementLisq110(@RequestParam Map<String,String> map, HttpSession session, HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {
		JSONObject json = new JSONObject();
		
		System.out.println(map);
		List<lisq110DTO> data = dService.lisq110(map.get("qcCode"));
		
		List<Map> dataList = new ArrayList();
		
		System.out.println(data.get(0));
		
		for(int i=0; i<data.size(); i++) {
			Map<String,Object> map1 = new HashMap<String,Object>();
			// '검사코드', '검사명', '검사파트', 'Mean', 'SD', 'CV', '허용(L)', '허용(H)', '서술형', '단위', '시작일', '종료일', 
	    	// '1(2S)', '판정(1_2S)', '1(3S)', '판정(1_3S)', '2(2S)', '판정(2_2S)', 'R(4S)', '판정(R_4S)', '4(1S)', '판정(4_1S)', '10X', '판정(10X)', '순번', '그래프'
			map1.put("testCode", data.get(i).getTestCode());
			map1.put("gumsaName", data.get(i).getGumsaName1());
			map1.put("jundalPart", data.get(i).getItem1());
			map1.put("meanValue", data.get(i).getMeanValue());
			map1.put("sdValue", data.get(i).getSdValue());
			map1.put("cvValue", data.get(i).getCvValue());
			map1.put("lowValue", data.get(i).getLowValue());
			map1.put("highValue", data.get(i).getHighValue());
			map1.put("susulValue", data.get(i).getSusulValue());
			map1.put("danui", data.get(i).getDanui());
			map1.put("startDate", data.get(i).getStartDate());
			map1.put("endDate", data.get(i).getEndDate());
			map1.put("rule12S", data.get(i).getRule12S());
			map1.put("gubun12S", data.get(i).getGubun12S());
			map1.put("rule13S", data.get(i).getRule13S());
			map1.put("gubun13S", data.get(i).getGubun13S());
			map1.put("rule22S", data.get(i).getRule22S());
			map1.put("gubun22S", data.get(i).getGubun22S());
			map1.put("ruleR4S", data.get(i).getRuleR4S());
			map1.put("gubunR4S", data.get(i).getGubunR4S());
			map1.put("rule41S", data.get(i).getRuleR41S());
			map1.put("gubun41S", data.get(i).getGubunR41S());
			map1.put("rule10X", data.get(i).getRule10X());
			map1.put("gubun10X", data.get(i).getGubun10X());
			map1.put("testCodeSeq", data.get(i).getTestCodeSeq());
			map1.put("graphYN", data.get(i).getGraphYN());
			dataList.add(map1);
		}
		
		json.put("rows", dataList);
		
		return json;
	}
	
	@RequestMapping(value = "/qcManagementLisc100.do")
	@ResponseBody
	public JSONObject qcManagementLisc100(@RequestParam Map<String,Object> map, HttpSession session, HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {
		JSONObject json = new JSONObject();
		List<lisc100DTO> data = dService.lisc100();
		List<Map> dataList = new ArrayList();
		
		for(int i=0; i<data.size(); i++) {
			Map<String,Object> map1 = new HashMap<String,Object>();
			// '검사코드', '검사명',
			map1.put("testCode", data.get(i).getTestCode());
			map1.put("gumsaName", data.get(i).getGumsaName1());
			dataList.add(map1);
		}
		
		json.put("rows", dataList);
		
		return json;
	}
}
