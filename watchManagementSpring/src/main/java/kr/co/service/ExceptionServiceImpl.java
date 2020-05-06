package kr.co.service;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.dao.ExceptionDAO;
import kr.co.vo.ExceptionVO;
import kr.co.vo.SearchCriteria;

@Service
public class ExceptionServiceImpl implements ExceptionService {
	
	@Inject
	private ExceptionDAO dao;
	
	// 게시글 작성
	@Override
	public void write(ExceptionVO exceptionVO) throws Exception {
		dao.write(exceptionVO);
	}
	
	// 게시물 목록 조회
	@Override
	public List<ExceptionVO> list(SearchCriteria scri) throws Exception {

		return dao.list(scri);
	}
	
	// 게시물 총 갯수
	public int listCount(SearchCriteria scri) throws Exception {
		return dao.listCount(scri);
	}
	
	// 게시물 조회
	@Override
	public ExceptionVO read(int eno) throws Exception {
		return dao.read(eno);
	}
	
	@Override
	public void update(ExceptionVO exceptionVO) throws Exception {
		dao.update(exceptionVO);
	}

	@Override
	public void delete(int eno) throws Exception {
		
		dao.delete(eno);
	}
}