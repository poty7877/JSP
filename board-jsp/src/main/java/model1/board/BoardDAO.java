package model1.board;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

import common.JDBConnect;

public class BoardDAO extends JDBConnect {

	// 생성자를 이용해서 1단계 2단계를 처리
	public BoardDAO() {

	}

	public BoardDAO(ServletContext application) {
		super(application);

	} // 3번째 개선한 jdbc 연결

	public int selectCount(Map<String, Object> map) { // board 테이블의 게시물 개수를 알아와야함
		int totalCount = 0; // 리턴값

		// 3단계 : 쿼리문
		String sql = "SELECT COUNT(*) FROM BOARD";
		if (map.get("searchWord") != null) { // 검색어가 있으면
			sql += " WHERE " + map.get("searchField") + " LIKE '%" + map.get("searchWord") + "%'";
			// searchField : 제목, 내용, 작성자(Object)
			// searchWord : input text로 넘어온 글자
			// select count(*) from baord where 제목 like ' %딸기%(Object) ';
		} // 검색어가 있으면 조건이 추가된다.

		// 4단계 : 쿼리문 실행
		try {
			statement = connection.createStatement(); // 쿼리문 연결
			resultSet = statement.executeQuery(sql); // 쿼리문 실행하여 결과를 표로 받음
			resultSet.next();
			totalCount = resultSet.getInt(1); // 첫번재 column 값을 가져옴
			System.out.println("totalcount : " + totalCount);
		} catch (SQLException e) {
			System.out.println("BoardDAO.selectCount() 메서드 오류");
			System.out.println("게시물 개수를 구하는 오류 발생");
			e.printStackTrace();
		}
		return totalCount;
	}

	// 게시물의 리스트 출력
	public List<BoardDTO> selectList(Map<String, Object> map) {
		List<BoardDTO> listBoardDTO = new Vector<BoardDTO>();

		String sql = "SELECT * FROM BOARD";
		// 조건 추가
		if (map.get("searchWord") != null) { // 검색어가 있으면
			sql += " WHERE " + map.get("searchField") + " LIKE '%" + map.get("searchWord") + "%'";
			// searchField : 제목, 내용, 작성자(Object)
			// searchWord : input text로 넘어온 글자
			// select count(*) from baord where 제목 like ' %딸기%(Object) ';
		} // 검색어가 있으면 조건이 추가된다.
			// 정렬 추가
		sql += " ORDER BY NUM DESC";
		// 3단계 쿼리문 완성

		// 4단계 : 쿼리문 실행
		try {
			statement = connection.createStatement(); // 쿼리문 생성
			resultSet = statement.executeQuery(sql); // 쿼리문 실행하여 결과를 표로 받음

			while (resultSet.next()) {
				BoardDTO boardDTO = new BoardDTO(); // 빈 객체 생성

				boardDTO.setNum(resultSet.getString("num"));
				boardDTO.setId(resultSet.getString("id"));
				boardDTO.setTitle(resultSet.getString("title"));
				boardDTO.setContent(resultSet.getString("content"));
				boardDTO.setPostdate(resultSet.getDate("postdate"));
				boardDTO.setVisitcount(resultSet.getString("visitcount")); // 객체에 값 삽입완료
				// name 필드 null

				listBoardDTO.add(boardDTO); // 위에서 만든 객체를 리스트(배열)에 넣음

			} // while문 종료

		} catch (SQLException e) {
			System.out.println("BoardDAO.selectList() 메서드 오류");
			System.out.println("board테이블 모든 리스트 출력 오류");
			e.printStackTrace();
		}

		return listBoardDTO;

	}

	// 게시글 등록용 메서드
	public int insertWrite(BoardDTO dto) {
		int result = 0;

		String sql = "INSERT INTO BOARD(NUM,TITLE,CONTENT,ID,VISITCOUNT) VALUES(seq_board_num.nextval, ?, ?, ?, 0)";

		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, dto.getTitle());
			preparedStatement.setString(2, dto.getContent());
			preparedStatement.setString(3, dto.getId());

			result = preparedStatement.executeUpdate();

		} catch (SQLException e) {
			System.out.println("BoardDAO.insertWrite() 메서드 오류 발생");
			System.out.println("쿼리문을 확인하세요");
			e.printStackTrace();
		}

		return result;
	}

	// 게시글의 제목을 클릭했을 때 상세보기 페이지
	public BoardDTO selectView(String num) {
		BoardDTO viewDTO = new BoardDTO();
		// 메서드 호출 시 입력은 num(board 테이블의 pk.bno) 으로 받고
		// 가져온 데이터를 BoardDTO 객체에 넣어 리턴.

		// 3단계 쿼리문 작성. (member pk -> board fk)

		// String sql = "SELECT * FROM BOARD WHERE NUM = ?"; // 작성자를 판단 할수 없음
		// member에 있는 작성자를 가져올수 있도록 join을 사용하여 처리
		String sql = "SELECT B.*, M.NAME FROM MEMBER M INNER JOIN BOARD B ON M.ID = B.ID WHERE NUM = ?";
		// MEMBER 테이블의 별칭은 M, BOARD 테이블의 별칭은 B라고 선언.
		// 부모 테이블인 M에 INNER JOIN으로 B 자식테이블을 연결, M.ID와 B.ID가 같은 자료를 찾음.
		// 조건은 파라미터로 받은 BNO를 이용
		// 찾아온 값은 BOARD의 모든 것과, MEMBER의 NAME을 가져옴. -> DTO에 NAME필드를 추가.

		try {
			preparedStatement = connection.prepareStatement(sql); // 객체 생성
			preparedStatement.setString(1, num);
			resultSet = preparedStatement.executeQuery(); // 쿼리 실행 - >표로 받음

			if (resultSet.next()) {
				viewDTO.setNum(resultSet.getString("NUM"));
				viewDTO.setTitle(resultSet.getString("TITLE"));
				viewDTO.setContent(resultSet.getString("CONTENT"));
				viewDTO.setVisitcount(resultSet.getString("VISITCOUNT"));
				viewDTO.setPostdate(resultSet.getDate("POSTDATE"));
				viewDTO.setId(resultSet.getString("ID"));
				viewDTO.setName(resultSet.getString("NAME"));
				System.out.println(viewDTO.toString());
			}
		} catch (SQLException e) {
			System.out.println("BoardDAO.selectView() 메서드 오류 발생");
			System.out.println("쿼리문을 확인하세요");
			e.printStackTrace();
		}

		return viewDTO;
	}

	// list.jsp에서 게시글의 제목을 클릭했을 때 visitcount 증가
	public void updateVisitCount(String num) {

		String sql = "UPDATE BOARD SET VISITCOUNT = VISITCOUNT + 1 WHERE NUM = ?";
		// visitcount를 1씩 증가 (조건이 num인)

		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, num);
			preparedStatement.executeUpdate(); // void인 경우 result, resultSet 안씀!
			// 실행만 하고 결과 반환 x

		} catch (SQLException e) {
			System.out.println("BoardDAO.updateVisitCount() 메서드 오류 발생");
			System.out.println("쿼리문을 확인하세요");
			e.printStackTrace();
		}

	}

	// 수정할 객체를 받아서 성공시 1개의 값을 수정했다는 리턴.
	public int updateEdit(BoardDTO boardDTO) {
		int result = 0;

		String sql = "UPDATE BOARD SET TITLE = ?, CONTENT = ? WHERE NUM = ? ";
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, boardDTO.getTitle());
			preparedStatement.setString(2, boardDTO.getContent());
			preparedStatement.setString(3, boardDTO.getNum());

			result = preparedStatement.executeUpdate();
			if (result > 0) {
				System.out.println(result + "개 게시글 수정 완료");
			}
		} catch (SQLException e) {
			System.out.println("BoardDAO.updateEdit() 메서드 오류 발생");
			System.out.println("쿼리문을 확인하세요");
			e.printStackTrace();
		}

		return result;
	}

	// dto를 받아서 삭제후에 int로 리턴하는 메서드
	public int deletePost(BoardDTO boardDTO) {
		int result = 0;

		String sql = "DELETE FROM BOARD WHERE NUM = ?";
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, boardDTO.getNum());
			result = preparedStatement.executeUpdate();
		} catch (SQLException e) {
			System.out.println("BoardDAO.deletePost() 메서드 오류 발생");
			System.out.println("쿼리문을 확인하세요");
			e.printStackTrace();
		}

		return result;

	}

}
