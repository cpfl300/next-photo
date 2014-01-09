package org.nhnnext.web;

import org.nhnnext.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/join")
public class JoinController {

	@Autowired
	private MemberRepository memberRepository;
	
	@RequestMapping("/form")
	public String join(){
		return "joinForm";
	}
	
	@RequestMapping(value="", method=RequestMethod.POST)
	public String login(Member member) {
		//DB에 같은 ID 있나 체크해야 함 		
		memberRepository.save(member);
		return "redirect:/";
	}
	
}
