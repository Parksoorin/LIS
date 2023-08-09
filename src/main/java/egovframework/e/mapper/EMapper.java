package egovframework.e.mapper;


import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.e.model.UserEDTO;

@Mapper("EMapper")
public interface EMapper {
	int joinUser(UserEDTO dto);

	int duplicate(UserEDTO dto);
	
	UserEDTO findOne(String id);
}
