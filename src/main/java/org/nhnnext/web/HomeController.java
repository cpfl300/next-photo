package org.nhnnext.web;


import java.util.Iterator;

import org.nhnnext.repository.Boardrepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/board")

public class HomeController {
	@Autowired
	private Boardrepository boardRepository;
	@RequestMapping("/")
	public String index() {
		return "index";
	}
	
	@RequestMapping("/upload")
	public String upload() {
		return "upload";
	}

	// DB에 저장하기 
	@RequestMapping(value="", method=RequestMethod.POST)
	public String uploaded(Board board, MultipartFile file) {
		String fileName = FileUploader.upload(file);
		board.setFileName(fileName);
		Board certainBoard = boardRepository.save(board);
		
		System.out.println("board: " + board);
		
		return "redirect:/board/" + certainBoard.getId();
	}
	
	//Data수정하기 
	@RequestMapping(value="/modify/{id}", method=RequestMethod.POST)
	public String modify(@PathVariable Long id, Board board, MultipartFile file) {
		boardRepository.delete(id);
		String fileName = FileUploader.upload(file);
		board.setFileName(fileName);
//		board.setId(id);
		Board certainBoard = boardRepository.save(board);
		
		System.out.println("board: " + board);
				
//		return "redirect:/board/modify/" + certainBoard.getId();
		return "redirect:/board/" + certainBoard.getId();
	}
	
	//Data삭제하기 
	@RequestMapping(value="/delete/{id}", method=RequestMethod.POST)
	public String delete(@PathVariable Long id){
		boardRepository.delete(id);
		return "redirect:/";
	}

	
	// 방금 저장한 Date DB에서 가져오기
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String show(@PathVariable Long id, Model model){
		Board certainBoard = boardRepository.findOne(id);
		model.addAttribute("certainBoard", certainBoard);
		
		return "show";
	}
	
	
	// Data 가져오기_List
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model){
		
		Iterable ir = boardRepository.findAll();
		Iterator it = ir.iterator();
		model.addAttribute("iterator", it);

		return "list";
	}
		
}
