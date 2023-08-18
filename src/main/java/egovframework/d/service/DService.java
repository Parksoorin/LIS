package egovframework.d.service;

import java.util.List;

import egovframework.d.model.UserDDTO;
import egovframework.d.model.lisc100DTO;
import egovframework.d.model.lisq100DTO;
import egovframework.d.model.lisq110DTO;

public interface DService {
	int joinUser(UserDDTO dto);
	int checkUser(String id);
	UserDDTO loginUser(UserDDTO dto);
	List<lisq100DTO> lisq100();
	List<lisq110DTO> lisq110(String qcCode);
	List<lisc100DTO> lisc100();
}
