package org.nhnnext.web;

import java.io.File;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/board")

public class HomeController {
	@RequestMapping("/")
	public String index() {
		return "index";
	}
	
	@RequestMapping("/upload")
	public String upload() {
		return "upload";
	}

	@RequestMapping(value="", method=RequestMethod.POST)
	public String uploaded(String title, String comment, String photo) {
		System.out.println("title: " + title +", comment: " + comment+", photo: "+photo);
	
		
		System.out.println("");
		return "redirect:/";
	}
}
