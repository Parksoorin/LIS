package egovframework.a.service.impl;

// javax.annotation 패키지에서 'Resource'어노테이션을 가져온다. 이 어노테이션은  의존성 주입(Dependency Injection)을 위해 사용된다.
import javax.annotation.Resource;

// org.springframework.stereotype 패키지에서 Service 어노테이션을 가져온다. 이 어노테이션은 이 클래스가 스프링의 서비스 구현 클래스임을 나타내는 역할을 한다.
import org.springframework.stereotype.Service;

// AMapper 클래스를 가져온다. 이 클래스는 데이터베이스와의 상호작용을 담당하는 매퍼(Mapper)이다.
import egovframework.a.mapper.AMapper;
import egovframework.a.model.userADTO;
import egovframework.a.service.AService;

/*
 * 스프링의 서비스 구현 클래스로, 서비스 인터페이스에 정의된 메서드를 실제로 구현하여 비즈니스 로직을 처리하고 데이터베이스와의 상호작용을 담당한다.
 * */

@Service("AService")
public class AServiceImpl implements AService{
		
		@Resource(name="AMapper")
		private AMapper aMapper;

		public int joinUser(userADTO dto) {
			// TODO Auto-generated method stub
			return aMapper.joinUser(dto);
		}	
		
	}
