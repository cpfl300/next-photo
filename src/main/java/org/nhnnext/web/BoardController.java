package org.nhnnext.web;

import java.util.Iterator;

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
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/board")
public class BoardController {
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

	// DB에 저장하기
	@RequestMapping(value = "", method = RequestMethod.POST)
	public String uploaded(Board board, MultipartFile file) {
		String fileName = FileUploader.upload(file);
		board.setFileName(fileName);
		Board certainBoard = boardRepository.save(board);

		System.out.println("board: " + board);

		return "redirect:/board/" + certainBoard.getId();
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
		model.addAttribute("iterator", ir);

		return "list2";
	}

}
