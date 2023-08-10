package egovframework.c.mapper;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.c.model.UserCDTO;

@Mapper("CMapper")
public interface CMapper {
	int joinUserC(UserCDTO dto);  //db랑만 통신. 조회
	int userID(UserCDTO dto); // 회원가입 id 조회 후 개수 반환
	int loginID(UserCDTO dto); // 로그인 id 조회 후 개수 반환
}
