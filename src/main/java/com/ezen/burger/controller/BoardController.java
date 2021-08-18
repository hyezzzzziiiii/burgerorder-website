package com.ezen.burger.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezen.burger.dto.Paging;
import com.ezen.burger.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	BoardService bs;
	
	@RequestMapping("boardmain")
	public String BugerW(Model model, HttpServletRequest request) {
		String url="Brand/boardmain";
		HttpSession session = request.getSession();
		int page = 1;
		
		if( request.getParameter("page") != null ) {
			page = Integer.parseInt(request.getParameter("page"));
			session.setAttribute("page", page);
		} else if( session.getAttribute("page")!= null ) {
			page = (int) session.getAttribute("page");
		} else {
			page = 1;
			session.removeAttribute("page");
		}
		Paging paging = new Paging();
		paging.setPage(page);
		int count = bs.getAllCount();
		paging.setTotalCount(count);
		paging.paging();
		model.addAttribute("boardList",	bs.selectAll(paging) );
		model.addAttribute("paging", paging);
		return url;
	}
}
