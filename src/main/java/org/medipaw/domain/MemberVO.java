package org.medipaw.domain;

import java.util.Date;
import java.util.List;

import org.medipaw.enums.RoleEnum;

import lombok.Data;

@Data
public class MemberVO {
	private String id; //아이디
	private String pw; //비밀번호
 	private String name; // 이름
 	private RoleEnum role; // 롤
 	private String postNum; //우편번호
 	private String addr1; // 주소 1
 	private String addr2; // 주소 2
 	private String addr3; // 주소 3
 	private String phone; // 연락처
 	private String email; // 이메일
 	private Date birth; // 생년월일

	private boolean enabled; // 활성화여부
	private List<AuthVO> authList;
}
