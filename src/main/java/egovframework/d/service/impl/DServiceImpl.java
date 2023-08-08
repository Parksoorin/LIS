package egovframework.d.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.d.mapper.DMapper;
import egovframework.d.model.UserDDTO;
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

}
