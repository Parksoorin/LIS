package egovframework.b.mapper;


import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.b.model.UserBDTO;

@Mapper("BMapper") // 네임값 지정해줌, 일치시켜주는 것이 좋음
public interface BMapper {
	int joinUser(UserBDTO dto);

	int duplicate(UserBDTO dto);
}
