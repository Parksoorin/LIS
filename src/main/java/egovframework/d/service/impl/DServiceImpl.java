package egovframework.d.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.d.mapper.DMapper;
import egovframework.d.model.UserDDTO;
import egovframework.d.model.lisc100DTO;
import egovframework.d.model.lisq100DTO;
import egovframework.d.model.lisq110DTO;
import egovframework.d.service.DService;

@Service("DService")
public class DServiceImpl implements DService {
	
	@Resource(name="DMapper")
	private DMapper dMapper;

	@Override
	public int joinUser(UserDDTO dto) {
		return dMapper.joinUser(dto);
	}

	@Override
	public int checkUser(String id) {
		return dMapper.checkUser(id);
	}

	@Override
	public UserDDTO loginUser(UserDDTO dto) {
		return dMapper.loginUser(dto);
	}

	@Override
	public List<lisq100DTO> lisq100() {
		return dMapper.lisq100();
	}
	
	@Override
	public List<lisq110DTO> lisq110(String qcCode) {
		return dMapper.lisq110(qcCode);
	}

	@Override
	public List<lisc100DTO> lisc100() {
		return dMapper.lisc100();
	}

}
