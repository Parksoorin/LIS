package egovframework.a.web;

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

import egovframework.a.model.userADTO;
import egovframework.a.service.AService;
import egovframework.util.Sha256;

/*
 * 스프링의 MVC 패턴을 활용하여 사용자의 회원가입 요청을 처리하는 예시
 * 요청 파라미터를 받아 DTO 객체를 생성하고, 비밀번호를 해시화하여 서비스를 호출하여
 * 데이터베이스에 저장하는 절차를 담고 있는 코드
 */

/*
 * 자바에서 어노테이션은 사전적의미로는 주석이라는 뜻을 가지고 있다. 
 * 자바의 어노테이션은 소스코드에 추가해서 사용할 수 있는 메타 데이터의 일종이다.
 */

// 이 클래스가 스프링의 컨트롤러임을 나타내는 어노테이션이다.
@Controller
public class AController {
	
	// AService 라는 이름으로 등록된 빈(Bean)을 주입받기 위한 어노테이션.
	// 'AService'는 해당 컨트롤러에서 사용할 서비스 클래스
	@Resource(name="AService")
	AService aService;
	
	// "/loginA.do"라는 경로로 들어온 요청에 대한 처리를 위한 메서드를 정의.
	@RequestMapping(value = "/loginA.do")
	public String startPage(Model model) throws Exception {
		
		// '.login/loginA'뷰 페이지를 반환한다.
		return ".login/loginA";
	}
	
	// "/joinUser.do" 경로로 POST 요청이 들어왔을 때 처리를 위한 메서드를 정의한다.
	// 이 메서드는 JSON 형태의 데이터를 반환할 것이므로 @ResponseBody 어노테이션을 사용합니다.
	@RequestMapping(value = "/joinUserA.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject exGrid(@RequestParam Map<String, Object> map, HttpSession session, HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {
		System.out.println(map);
		
		/* 
		 * 요청 파라미터로 맵 형태의 데이터를 받아오고, 세션과 요청/응답 객체, 그리고 모델을 사용할 수 있도록 매개변수로 선언한다. 
		 * exGrid 메서드는 JSON 형태의 결과를 반환할 것이므로 JSONObject를 반환 타입으로 사용한다.
		 * */
		
		JSONObject json = new JSONObject();
		
		// 'userADTO' 클래스의 객체를 생성한다. 이 클래스는 사용자 데이터의 정보를 담는 DTO(Data Transfer Object)이다.
		userADTO dto = new userADTO();
		
		// 입력으로 받은 비밀번호를 SHA-256 해시로 암호화한다. 'Sha256.encrypt()' 메서드는 비밀번호를 해시화한 문자열을 반환한다.
		String pw = Sha256.encrypt(map.get("password").toString());
				// DTO 객체에 아이디와 암호화된 비밀번호를 설정한다.
				dto.setId(map.get("id").toString());
				dto.setPassword(pw);
			
			// aService를 통해 'joinUser' 메서드를 호출하여 사용자 정보를 데이터베이스에 저장한다.
			int join = aService.joinUser(dto);
			// JSON 객체에 "result" 키와 "success" 값을 넣어서 결과를 저장한다.
			json.put("result", "success");
		
		// JSON 객체를 반환하여 클라이언트에 응답한다.
		return json;
	}
}
