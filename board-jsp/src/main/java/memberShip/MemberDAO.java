package memberShip;

import java.sql.SQLException;

import common.JDBConnect;

public class MemberDAO extends JDBConnect { // JDBConnect를 상속하여 1,2,5 단계를 적용.
	// jdbc를 처리하는 용도

	public MemberDAO(String driver, String url, String id, String pw) { // 2번째 방법으로 적용
		super(driver, url, id, pw); // 부모 생성자에게 전달
	} // 1단계, 2단계

	// 3단계 (sql문 생성)
	public MemberDTO getMemberDTO(String id, String pw) {
		MemberDTO memberDTO = new MemberDTO(); // 빈객체 생성
		String sql = "SELECT * FROM MEMBER WHERE ID = ? AND PASS = ?" ; // 쿼리문 생성 
		try {
			preparedStatement = connection.prepareStatement(sql); // 동적쿼리문 적용
			preparedStatement.setString(1, id);					// 첫번째 ? 처리
			preparedStatement.setString(2, pw);					// 두번째 ? 처리
			resultSet = preparedStatement.executeQuery();		// 쿼리 실행 ->표로 받음
			if(resultSet.next()) { // resultSet 표에 값이 있는지 확인
				memberDTO.setId(resultSet.getString("id"));
				memberDTO.setPass(resultSet.getString("pass"));
				memberDTO.setName(resultSet.getString("name"));
				memberDTO.setRegdate(resultSet.getString("regidate"));
			}
		} catch (SQLException e) {
			System.out.println("MemberDAO.getMemberDTO() 메서드 오류 (3단계)");
			e.printStackTrace();
		}
		
		
		return memberDTO;

	}

}
