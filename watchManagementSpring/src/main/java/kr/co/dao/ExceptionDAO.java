package kr.co.dao;

import java.util.List;

import kr.co.vo.ExceptionVO;
import kr.co.vo.SearchCriteria;

public interface ExceptionDAO {

		// 예외 세팅 등록
		public void write(ExceptionVO exceptionVO) throws Exception;
		
		// 예외 세팅 목록 조회
		public List<ExceptionVO> list(SearchCriteria scri) throws Exception;
		
		//예외 세팅 총 갯수
		public int listCount(SearchCriteria scri) throws Exception;
		
		// 예외 세팅 조회
		public ExceptionVO read(int eno) throws Exception;
		
		// 예외 세팅 수정
		public void update(ExceptionVO exceptionVO) throws Exception;
		
		// 예외 세팅 삭제
		public void delete(int eno) throws Exception;
}
