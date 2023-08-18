package egovframework.b.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import egovframework.b.model.QcResultDTO;
import egovframework.b.model.UserBDTO;

public interface BService {
	int joinUser(UserBDTO dto);

	boolean duplicate(UserBDTO dto);
	UserBDTO findOne(String id);
	List<String> qcResultDate();
	List<Map<String, Object>> qcResultFindHashMap(List<String> dateList);
}
