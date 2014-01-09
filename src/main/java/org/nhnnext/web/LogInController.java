package org.nhnnext.web;

import javax.servlet.http.HttpSession;

import org.h2.engine.Session;
import org.nhnnext.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
		session.removeAttribute("userEmail");
		return "redirect:/";
	}
	
	@RequestMapping(value = "/login.json", method = RequestMethod.POST)
	public @ResponseBody String mobileLogin(Member mem, HttpSession session){
		String userEmail = mem.getUserEmail();
		Member userInfo = memberRepository.findByUserEmail(userEmail);
		String loginResult = null;
		//Login 정보가 일치하는 경우
		if (mem.getPassword().equals(userInfo.getPassword())) {
			session.setAttribute("userEmail", userEmail);
			loginResult ="{\"code\":200,\"result\":\"OK\"}";
		}

		//ID or password실패한 경우 
		else {
			loginResult="{\"code\":404,\"result\":\"FAIL\"}";
		}
		System.out.println(loginResult);
		return loginResult;
	}
	
	@RequestMapping(value = "", method = RequestMethod.POST)
	public String login(Member mem, HttpSession session) {
		String userEmail = mem.getUserEmail();
		Member userInfo = memberRepository.findByUserEmail(userEmail);

		//Login 정보가 일치하는 경우
		if (mem.getPassword().equals(userInfo.getPassword())) {
//			model.addAttribute("userId", userId);
			session.setAttribute("userEmail", userEmail);
			return "redirect:/";
		}

		//ID or password실패한 경우 
		else {
			return "loginForm";
		}
	}

}
