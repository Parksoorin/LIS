package egovframework.a.mapper;

// org.egovframe.rte.psl.dataaccess.mapper 패키지에서 Mapper 어노테이션을 가져온다.
// 이 어노테이션은 스프링의 @Repository 어노테이션과 유사한 역할을 한다. 즉, 매퍼를 스프링 빈으로 등록하기 위해 사용한다.
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

// userADTO 클래스를 가져온다. 이 클래스는 사용자 데이터의 정보를 담는 DTO이다.
import egovframework.a.model.userADTO;

/*
 * 데이터베이스와의 상호작용을 처리하는 매퍼 인터페이스로, 
 * 실제로는 이 인터페이스를 구현한 클래스가 데이터베이스 연동을 위한 SQL 쿼리와 연결하여 데이터를 처리하게 된다.
 */

// AMapper 라는 이름으로 스프링 빈으로 등록하기 위한 어노테이션이다.
@Mapper("AMapper")
// AMapper 인터페이스를 정의한다. 이 인터페이스는 데이터베이스와의 상호 작용을 담당하는 메서드를 포함한다.
public interface AMapper {
	// joinUserA 메서드를 선언한다. 이 메서드는 사용자 정보를 데이터베이스에 저장하는 역할을 한다. 반환값은 저장 성공 여부를 나타내는 정수이다.
	int joinUserA(userADTO dto);
	
	int duplicate(userADTO dto);
		
	userADTO findOne(String id);
}
