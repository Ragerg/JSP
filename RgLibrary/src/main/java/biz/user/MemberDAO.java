package biz.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import biz.common.JDBCUtil;

public class MemberDAO {
	private Connection conn;
	private PreparedStatement stmt;
	private ResultSet rs;

	private static String MEMBER_INSERT = "insert into t_member(id, pw, name, address, phone) "
			+ " values(?, ?, ?, ?, ?) ";

	private static String ID_CHECK = "select id from t_member where id = ? ";

	private static String MEMBER_GET = "select * from t_member where id=? and pw=?";

	// 회원가입 시 멤버 추가
	public void insertMember(MemberVO vo) {
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(MEMBER_INSERT);
			stmt.setString(1, vo.getId());
			stmt.setString(2, vo.getPw());
			stmt.setString(3, vo.getName());
			stmt.setString(4, vo.getAddress());
			stmt.setString(5, vo.getPhone());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	// 회원가입 시 중복 아이디 체크
	public int idCheck(String id) {
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(ID_CHECK);
			stmt.setString(1, id);
			rs = stmt.executeQuery();

			if(rs.next()) {
				// 중복 아이디
				return 0;
			} else {
				// 가입가능 아이디
				return 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		//데이터베이스 오류
		return -1; 
	}

	// 로그인
	public MemberVO logIn(MemberVO vo) {
		MemberVO member = null;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(MEMBER_GET);
			stmt.setString(1, vo.getId());
			stmt.setString(2, vo.getPw());

			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				member = new MemberVO();
				member.setId(rs.getString("id"));
				member.setPw(rs.getString("pw"));
				member.setName(rs.getString("name"));
				member.setAddress(rs.getString("address"));
				member.setPhone(rs.getString("phone"));
				member.setRole(rs.getString("role"));

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return member;
	}
}

// 마이페이지
//    public MemberVO MemberPage(String id) {
//
//        StringBuilder sql = new StringBuilder();
//        sql.append("select * from t_member where id = ? ");
//
//        MemberVO member = new MemberVO();
//
//        try (Connection conn = new ConnectionFactory().getConnection();
//                PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
//            pstmt.setString(1, id);
//
//            ResultSet rs = pstmt.executeQuery();
//            if (rs.next()) {
//                member.setName(rs.getString("name"));
//                member.setAddress(rs.getString("address"));
//                member.setPhoneNum(rs.getString("phone_num"));
//            }
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        return member;
//    }
//
//}