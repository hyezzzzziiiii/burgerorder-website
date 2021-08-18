package com.ezen.burger.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.burger.dao.IBoardDao;
import com.ezen.burger.dto.BoardVO;
import com.ezen.burger.dto.Paging;

@Service
public class BoardService {
	
	@Autowired
	IBoardDao bdao;
	
	
	
	
	
	
	public int getAllCount() {
		return bdao.getAllCount();
	}
	
	
	public List<BoardVO> selectAll(Paging paging){
		List<BoardVO> list = bdao.selectAll(paging);
		
		// 리스트를 이용한 반복 실행문을 실행합니다
		for( BoardVO bvo : list) {
			// 각 게시물의 댓글 갯수를 조회하는 메서드를 호출하여 갯수를 얻습니다
			int count = 0;
			count = bdao.getCountReply( bvo.getNum() );
			// 그 갯수를 현재 게시물의  Replycnt 변수에 저장합니다
			bvo.setReplycnt(count);
		}
		return list;
	}
}
