package egovframework.a.service;

//userADTO 클래스를 가져온다. 이 클래스는 사용자 데이터의 정보를 담는 DTO(Data Transfer Object)이다.
import egovframework.a.model.userADTO;


/*
 * 스프링의 서비스 계층을 구현하기 위한 인터페이스로, 비즈니스 로직을 정의하고 컨트롤러와 데이터베이스 계층 간의 중재 역할을 수행하는 역할을 한다. 
 * 이 인터페이스를 구현하는 클래스에서는 실제 비즈니스 로직을 구현하여 사용자 데이터를 데이터베이스에 저장하게 될 것이다.
 */

// AService 인터페이스를 정의한다. 이 인터페이스는 서비스 계층의 역할을 담당한다.
public interface AService {
	// joinUser 메서드를 선언한다. 이 메서드는 사용자 정보를 입력받아 데이터베이스에 저장하는 역할을 수행한다.
	// 반환값은 저장 성공 여부를 나타내는 정수(0,1)이다.
	int joinUserA(userADTO dto);
	
	boolean duplicate(userADTO dto);
	userADTO findOne(String id);
}
