package org.medipaw.service;

import java.util.List;

import org.springframework.dao.DuplicateKeyException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

import org.medipaw.domain.AuthVO;
import org.medipaw.domain.MemberVO;
import org.medipaw.mapper.MemberMapper;

@Service
@RequiredArgsConstructor
public class MemberService {
	
	private final MemberMapper mMapper;
    private final BCryptPasswordEncoder encoder;
	
	public void join(MemberVO memberVO) throws DuplicateKeyException{
		memberVO.setPw(encoder.encode(memberVO.getPw()));
		
		if(mMapper.select(memberVO.getId()) != null) {
			throw new DuplicateKeyException("DuplicateKey Exception!!");
		}
		int cnt = mMapper.saveUser(memberVO);
		if(cnt > 0) {
			AuthVO authVO = new AuthVO();
			authVO.setId(memberVO.getId());
			authVO.setAuth(memberVO.getRole().toString());
			
			mMapper.saveRole(authVO);
		}
	}

}

