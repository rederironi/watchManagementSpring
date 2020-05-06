package kr.co.service;

import java.util.List;

import kr.co.vo.ExceptionVO;
import kr.co.vo.SearchCriteria;

public interface ExceptionService {

	// 게시글 작성
	public void write(ExceptionVO exceptionVO) throws Exception;

	// 게시물 목록 조회
	public List<ExceptionVO> list(SearchCriteria scri) throws Exception;
	
	// 게시물 총 갯수
	public int listCount(SearchCriteria scri) throws Exception;
	
	// 게시물 목록 조회
	public ExceptionVO read(int eno) throws Exception;
	
	// 게시물 수정
	public void update(ExceptionVO exceptionVO) throws Exception;
	
	// 게시물 삭제
	public void delete(int eno) throws Exception;
	
}