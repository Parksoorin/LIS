package egovframework.d.service;

import java.util.List;

import egovframework.d.model.UserDDTO;
import egovframework.d.model.lisq100DTO;

public interface DService {
	int joinUser(UserDDTO dto);
	int checkUser(String id);
	UserDDTO loginUser(UserDDTO dto);
	List<lisq100DTO> lisq100();
}
