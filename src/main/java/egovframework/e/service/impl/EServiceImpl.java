package egovframework.e.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.e.mapper.EMapper;
import egovframework.e.model.UserEDTO;
import egovframework.e.service.EService;

@Service("EService")
public class EServiceImpl implements EService {

	@Resource(name="EMapper")
	private EMapper eMapper;
	
	@Override
	public int joinUser(UserEDTO dto) {
		System.out.println("serviceimpl");
		return eMapper.joinUser(dto);
	}

	

}
