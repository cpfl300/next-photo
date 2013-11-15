package org.nhnnext.web;

import javax.servlet.http.HttpSession;

import org.h2.engine.Session;
import org.nhnnext.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/login")
public class LogInController {

	@Autowired
	private MemberRepository memberRepository;

	@RequestMapping("/form")
	public String form() {
		return "loginForm";
	}

	@RequestMapping(value = "/logout")
	public String logout(HttpSession session){
		session.removeAttribute("userId");
		return "redirect:/";
	}
	
	@RequestMapping(value = "", method = RequestMethod.POST)
	public String login(Member mem, HttpSession session) {
		String userId = mem.getUserId();
		Member userInfo = memberRepository.findByUserId(userId);

		//Login 정보가 일치하는 경우
		if (mem.getPassword().equals(userInfo.getPassword())) {
//			model.addAttribute("userId", userId);
			session.setAttribute("userId", userId);
			return "redirect:/";
		}

		//ID or password실패한 경우 
		else {
			return "loginForm";
		}
	}

}
