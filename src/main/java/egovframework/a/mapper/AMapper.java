package egovframework.a.mapper;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.a.model.userADTO;

@Mapper("AMapper")
public interface AMapper {
	int joinUser(userADTO dto);
}
