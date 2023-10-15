package org.medipaw.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.medipaw.domain.MemberVO;
import org.medipaw.service.MemberService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequiredArgsConstructor
public class MemberController {
	
	private final MemberService memberService;
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	@ResponseBody
	public String join(HttpServletRequest request, @RequestBody MemberVO memberVO) {
		
		memberService.join(memberVO);
		
		return "home";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String goJoinPage(HttpServletRequest request) {
		
		return "/member/join";
	}
	
}
