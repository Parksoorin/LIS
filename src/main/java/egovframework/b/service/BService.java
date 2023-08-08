package egovframework.b.service;

import egovframework.b.model.UserBDTO;

public interface BService {
	int joinUser(UserBDTO dto);

	boolean duplicate(UserBDTO dto);
	UserBDTO findOne(String id);
	
}
