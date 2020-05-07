package kr.co.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.vo.ExceptionVO;
import kr.co.vo.SearchCriteria;

@Repository
public class ExceptionDAOImpl implements ExceptionDAO {

	@Inject
	private SqlSession sqlSession;
	
	// 게시글 작성
	@Override
	public void write(ExceptionVO exceptionVO) throws Exception {
		sqlSession.insert("exceptionMapper.insert", exceptionVO);
		
	}

	// 게시물 목록 조회
	@Override
	public List<ExceptionVO> list(SearchCriteria scri) throws Exception {
	
		return sqlSession.selectList("exceptionMapper.listPage", scri);

	}
	
	// 게시물 총 갯수
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
	
		return sqlSession.selectOne("exceptionMapper.listCount", scri);

	}
	
	// 게시물 조회
	@Override
	public ExceptionVO read(int eno) throws Exception {
			
		return sqlSession.selectOne("exceptionMapper.read", eno);
	}

	// 게시물 수정
	@Override
	public void update(ExceptionVO exceptionVO) throws Exception {
		
		sqlSession.update("exceptionMapper.update", exceptionVO);
	}

	// 게시물 삭제
	@Override
	public void delete(int eno) throws Exception {
		
		sqlSession.delete("exceptionMapper.delete", eno);
	}
}