package egovframework.d.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.d.model.UserDDTO;
import egovframework.d.model.lisc100DTO;
import egovframework.d.model.lisq100DTO;
import egovframework.d.model.lisq110DTO;

@Mapper("DMapper")
public interface DMapper {
	int joinUser(UserDDTO dto);
	int checkUser(String id);
	UserDDTO loginUser(UserDDTO dto);
	List<lisq100DTO> lisq100();
	List<lisq110DTO> lisq110();
	List<lisc100DTO> lisc100();
}
