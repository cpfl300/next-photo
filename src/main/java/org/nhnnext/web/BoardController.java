package org.nhnnext.web;

import java.util.Collections;
import java.util.Iterator;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpSession;

import org.h2.engine.Session;
import org.nhnnext.repository.AttachCommentRepository;
import org.nhnnext.repository.Boardrepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/board")
public class BoardController {
	private static final Logger log = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private Boardrepository boardRepository;
	@Autowired
	private AttachCommentRepository attachCommentRepository;

	@RequestMapping("/upload")
	public String upload(HttpSession session) {
		if(session.getAttribute("userId")!= null){
			
			return "upload";
		}
		return "redirect:/";
	}
	
	// 수정할 form 호출 
	@RequestMapping("callModify/{id}")
	public String callModify(@PathVariable Long id, Model model){
		Board certainBoard = boardRepository.findOne(id);
		model.addAttribute("certainBoard", certainBoard);
		return "/modify";
	}

	// DB에 저장하기
	@RequestMapping(value = "", method = RequestMethod.POST)
	public String uploaded(Board board, MultipartFile file) {

		String fileName = FileUploader.upload(file);
		board.setFileName(fileName);
		Board certainBoard = boardRepository.save(board);

		return "redirect:/board/" + certainBoard.getId();
	}
	
	@RequestMapping(value ="/board.json", method = RequestMethod.POST)
	public @ResponseBody Board straightUpload(Board board, MultipartFile file){
		log.debug("board: {}", board); // 로그를 찍는 코드
		String fileName = FileUploader.upload(file);
		board.setFileName(fileName);
		return boardRepository.save(board);
	}

	// Data수정하기
	@RequestMapping(value = "/modify/{id}", method = RequestMethod.POST)
	public String modify(@PathVariable Long id, Board newBoard,
			MultipartFile file) {
		Board board = boardRepository.findOne(id);

		String fileName = FileUploader.upload(file);
		board.setFileName(fileName);
		board.setTitle(newBoard.getTitle());
		board.setComment(newBoard.getComment());

		Board certainBoard = boardRepository.save(board);

		System.out.println("board: " + board);

		return "redirect:/board/" + certainBoard.getId();
	}

	// Data삭제하기
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.POST)
	public String delete(@PathVariable Long id) {
		Iterable iter = attachCommentRepository.findAll();
		Iterator it = iter.iterator();

		while (it.hasNext()) {
			AttachComment attcom = (AttachComment) it.next();
			Long boardNum = attcom.getBoard().getId();

			if (boardNum.equals(id)) {
				attachCommentRepository.delete(attcom.getId());;
			}
		}

		boardRepository.delete(id);
		return "redirect:/";
	}
	
	//XML delete
	@RequestMapping(value = "/{id}/delete.json", method = RequestMethod.POST)
	public Object XMLdelete(@PathVariable Long id) {
		Iterable iter = attachCommentRepository.findAll();
		Iterator it = iter.iterator();
		
		while (it.hasNext()) {
			AttachComment attcom = (AttachComment) it.next();
			Long boardNum = attcom.getBoard().getId();
			
			if (boardNum.equals(id)) {
				attachCommentRepository.delete(attcom.getId());;
			}
		}
		
		boardRepository.delete(id);
		
		return null;
	}

	// 방금 저장한 Date DB에서 가져오기
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String show(@PathVariable Long id, Model model) {
		Board certainBoard = boardRepository.findOne(id);
		model.addAttribute("certainBoard", certainBoard);

		return "show2";
	}

	// Data 가져오기_List
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model, Model comModel) {

		Iterable ir = boardRepository.findAll();
		Collections.reverse((List)ir);
		model.addAttribute("iterator", ir);

		return "list2";
	}

}
