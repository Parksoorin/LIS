package egovframework.c.service;

import egovframework.c.model.UserCDTO;

public interface CService {  // 매퍼에서 가져온 다음에 가공 주로 여기에 작성
	int joinUserC(UserCDTO dto);
	// UserCDTO selectUser ,,,로 사용
	int userID(UserCDTO dto); // 
	UserCDTO loginID(UserCDTO dto);
}
