package egovframework.a.service.impl;

// javax.annotation 패키지에서 'Resource'어노테이션을 가져온다. 이 어노테이션은  의존성 주입(Dependency Injection)을 위해 사용된다.
import javax.annotation.Resource;

// org.springframework.stereotype 패키지에서 Service 어노테이션을 가져온다. 이 어노테이션은 이 클래스가 스프링의 서비스 구현 클래스임을 나타내는 역할을 한다.
import org.springframework.stereotype.Service;

// AMapper 클래스를 가져온다. 이 클래스는 데이터베이스와의 상호작용을 담당하는 매퍼(Mapper)이다.
import egovframework.a.mapper.AMapper;
// userADTO 클래스를 가져온다. 이 클래스는 사용자 데이터의 정보를 담는 DTO(Data Transfer Object)이다.
import egovframework.a.model.userADTO;
// AService 인터페이스를 가져온다. 이 인터페이스는 서비스 계층의 역할을 정의한 것이다.
import egovframework.a.service.AService;

/*
 * 스프링의 서비스 구현 클래스로, 서비스 인터페이스에 정의된 메서드를 실제로 구현하여 비즈니스 로직을 처리하고 데이터베이스와의 상호작용을 담당한다.
 * */

// AService 라는 이름으로 스프링 빈으로 등록하기 위한 이노테이션이다.
@Service("AService")
public class AServiceImpl implements AService{
		
		// AMapper 라는 이름으로 등록된 빈(Bean)을 주입받기 위한 어노테이션이다. AMapper는 데이터베이스와의 상호작용을 담당하는 매퍼 클래스이다.
		@Resource(name="AMapper")
		// AMapper 클래스의 인스턴스를 멤버 변수로 선언한다. 이를 통해 매퍼의 메서드를 호춣할 수 있다.
		private AMapper aMapper;

		// AService 인터페이스의 joinUser 메서드를 구현한다. 이 메서드는 매퍼의 joinUser 메서드를 호출하여 사용자 데이터를 데이터베이스에 저장한다.
		public int joinUser(userADTO dto) {
			// TODO Auto-generated method stub
			// 매퍼의 joinUser 메서드를 호출하여 사용자 데이터를 데이터베이스에 저장하고, 저장 성공 여부를 정수 형태로 반환한다.
			return aMapper.joinUser(dto);
		}	
		
	}
