package com.khd.Mypage.MypageController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MypageController {
	@RequestMapping(value = "member/memberjoin", method = RequestMethod.POST)
	public String viewMypage() {
		return null;
	}

}
