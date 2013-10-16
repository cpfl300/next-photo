package org.nhnnext.web;

import org.nhnnext.repository.AttachCommentRepository;
import org.nhnnext.repository.Boardrepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AttachCommentController {
	@Autowired
	private Boardrepository boardRepository;
	
	@Autowired
	private AttachCommentRepository attachRepository;
	
	@RequestMapping(value="/board/{id}/attachComment", method=RequestMethod.POST)
	public String attachComment(@PathVariable Long id, String attachComment) {
		Board board = boardRepository.findOne(id);
		AttachComment comment = new AttachComment(attachComment, board);
		attachRepository.save(comment);
		
//		Iterable coments = attachRepository.findAll();
//		model.addAttribute(coments);
		
		return "redirect:/board/list";
//		return "list";
	}

}
