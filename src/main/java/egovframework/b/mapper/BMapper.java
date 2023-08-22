package egovframework.b.mapper;


import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.b.model.QcResultDTO;
import egovframework.b.model.UserBDTO;
import egovframework.b.model.QcCodeDTO;

@Mapper("BMapper") // 네임값 지정해줌, 일치시켜주는 것이 좋음
public interface BMapper {
	int joinUser(UserBDTO dto);

	int duplicate(UserBDTO dto);
	
	UserBDTO findOne(String id);
	
	List<Map<String, Object>> qcResultFindHashMap(@Param("dateList") List<String> dateList);
	List<String>qcResultDate();

	List<String> gumsapartFindAll();

	List<String> jangbiFindAll();

	List<String> levelListFindAll();

	List<QcCodeDTO> qcCodeFindAll();
	
}
