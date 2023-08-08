package egovframework.e.mapper;


import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.e.model.UserEDTO;

@Mapper("EMapper") // 네임값 지정해줌, 일치시켜주는 것이 좋음
public interface EMapper {
	int joinUser(UserEDTO dto);

	
}
