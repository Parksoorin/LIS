package egovframework.c.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.c.mapper.CMapper;
import egovframework.c.model.UserCDTO;
import egovframework.c.service.CService;
@Service("CService")

public class CServiseimpl implements CService{
	
	@Resource(name="CMapper")
	private CMapper cMapper;
	@Override
	public int joinUserC(UserCDTO dto) {
		return cMapper.joinUserC(dto);  // 매퍼에 조인 유저 확인 // 중복체크는 서비스에서
	}
	@Override
	public int userID(UserCDTO dto) {
		// TODO Auto-generated method stub
		return cMapper.userID(dto);
	}
	public UserCDTO loginID(UserCDTO dto) {
		// TODO Auto-generated method stub
		return cMapper.loginID(dto);
	}
}
