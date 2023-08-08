package egovframework.d.service;

import egovframework.d.model.UserDDTO;

public interface DService {
	int joinUser(UserDDTO dto);
	int checkUser(String id);
	UserDDTO loginUser(UserDDTO dto);
}
