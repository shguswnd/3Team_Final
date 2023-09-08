package controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import service.BoardService;
import vo.Notice;

@Controller
public class NoticeController extends HttpServlet{
	private BoardService boardservice;
	
	@Autowired
	public void setBoardservice(BoardService boardservice) {
		this.boardservice = boardservice;
	}
	
	
	//게시판 폼
	@GetMapping("board")
	public String notices(String pg, String field, String query, Model model) {
		List<Notice> list = boardservice.notices(pg, field, query);
		model.addAttribute("list", list);
		return "board/notice";
	}
	

}
