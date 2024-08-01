package fileUpload;

import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import common.DBConnPool;

public class MyFileDAO extends DBConnPool { // sql문 1단계 2단계 5단계

	// 입력 메서드
	public int insertFile(MyFileDTO myFileDTO) {
		int result = 0;

		String query = "INSERT INTO MYFILE(IDX, NAME, TITLE, CATE, OFILE, SFILE) "
				+ "VALUES(SEQ_BOARD_NUM.NEXTVAL, ?, ?, ?, ?, ?)";
		try {
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, myFileDTO.getName());
			preparedStatement.setString(2, myFileDTO.getTitle());
			preparedStatement.setString(3, myFileDTO.getCate());
			preparedStatement.setString(4, myFileDTO.getOfile());
			preparedStatement.setString(5, myFileDTO.getSfile()); // sql 3단계 완성

			result = preparedStatement.executeUpdate(); // sql 4단계 정수로 리턴

		} catch (SQLException e) {
			System.out.println("MyFileDAO.insertFile() method 오류 발생");
			System.out.println("query 문을 확인 하세요");
			e.printStackTrace();
		}

		return result;
	}

	// 출력 메서드
	public List<MyFileDTO> myFileLists() {
		List<MyFileDTO> fileList = new Vector<>(); // 멀티 쓰레드용

		String query = "SELECT * FROM MYFILE ORDER BY IDX DESC"; // 모든 데이터를 찾아옴(내림)
		try {
			statement = connection.createStatement();
			resultSet = statement.executeQuery(query);

			while (resultSet.next()) {
				MyFileDTO myFileDTO = new MyFileDTO(); // 빈 객체 생성
				myFileDTO.setIdx(resultSet.getString("idx"));
				myFileDTO.setName(resultSet.getString("name"));
				myFileDTO.setTitle(resultSet.getString("title"));
				myFileDTO.setCate(resultSet.getString("cate"));
				myFileDTO.setOfile(resultSet.getString("ofile"));
				myFileDTO.setSfile(resultSet.getString("sfile"));
				myFileDTO.setPostdate(resultSet.getString("postdate"));

				fileList.add(myFileDTO); // 리스트에 객체 넣음

			}
		} catch (SQLException e) {
			System.out.println("MyFileDAO.myFileLists() method 오류발생");
			System.out.println("query문을 확인 하세요");
			e.printStackTrace();
		}

		return fileList; // 테이블에 있는 모든 값이 리스트의 객체로 리턴 된다.
	}

	// 수정 메서드

	// 삭제 메서드

}
