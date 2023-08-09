package egovframework.e.service;

import egovframework.e.model.UserEDTO;

public interface EService {
	int joinUser(UserEDTO dto);
	
	boolean duplicate(UserEDTO dto);
	
	UserEDTO findOne(String id);
	
}
