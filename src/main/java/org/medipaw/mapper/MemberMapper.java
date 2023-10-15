package org.medipaw.mapper;

import org.medipaw.domain.AuthVO;
import org.medipaw.domain.MemberVO;

public interface MemberMapper {
	public MemberVO select(String id);
	
	public int saveUser(MemberVO memberVO);
	
	public int saveRole(AuthVO authVO); 
}
