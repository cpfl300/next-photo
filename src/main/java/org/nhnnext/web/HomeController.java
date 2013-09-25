package org.nhnnext.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	@RequestMapping("/")
	public String index() {
		return "index";
	}
	
	@RequestMapping("/board/upload")
	public String upload() {
		return "upload";
	}

	@RequestMapping(value="/board", method=RequestMethod.POST)
	public String uploaded(String title, String comment) {
		System.out.println("title: " + title +", comment: " + comment);
		return "upload";
	}
}
