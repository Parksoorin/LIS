package egovframework.d.mapper;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.d.model.UserDDTO;

@Mapper("DMapper")
public interface DMapper {
	int joinUser(UserDDTO dto);
	int checkUser(String id);
	UserDDTO loginUser(UserDDTO dto);
}
