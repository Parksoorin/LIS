package egovframework.b.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.b.mapper.BMapper;
import egovframework.b.model.UserBDTO;
import egovframework.b.service.BService;

@Service("BService")
public class BServiceImpl implements BService {

	@Resource(name="BMapper")
	private BMapper bMapper;
	
	@Override
	public int joinUser(UserBDTO dto) {
		System.out.println("serviceimpl");
		return bMapper.joinUser(dto);
	}

	@Override
	public boolean duplicate(UserBDTO dto) {
		
		int result = bMapper.duplicate(dto);
		System.out.println("=====result=====" + result);
		if(result == 1) return true;
		return false;
	}

	@Override
	public UserBDTO findOne(String id) {
		
		return bMapper.findOne(id);
	}

}
