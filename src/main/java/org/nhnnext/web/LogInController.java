package org.nhnnext.web;

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

	@RequestMapping(value = "", method = RequestMethod.POST)
	public String login(Member mem, Model model) {
		String userId = mem.getUserId();
		Member userInfo = memberRepository.findByUserId(userId);

		if (mem.getPassword().equals(userInfo.getPassword())) {
			model.addAttribute("userId", userId);
			return "redirect:/";
		}

		//ID or password실패한 경우 
		else {
			return "loginForm";
		}
	}

}
