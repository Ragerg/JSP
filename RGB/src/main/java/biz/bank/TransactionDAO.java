package biz.bank;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import biz.bank.BankVO;
import biz.board.BoardVO;
import biz.common.JDBCUtil;
import biz.user.*;

public class TransactionDAO {
	private Connection conn;
	private PreparedStatement stmt;
	private ResultSet rs;

	// 계좌이체
	public int Transaction(TransactionVO transD, TransactionVO transW) {
		int result = 0;
		StringBuilder sql1 = new StringBuilder();
		//출금계좌에서 마이너스
		sql1.append("update account set account_balance= (account_balance-?) where account_no=?");

		try {
			conn = JDBCUtil.getConnection();
			//자동커밋 꺼두기
			conn.setAutoCommit(false);
			stmt = conn.prepareStatement(sql1.toString());
			
			stmt.setLong(1, transW.getTrans_amount());
			stmt.setString(2, transW.getTrans_Account());
			
			result = stmt.executeUpdate();
			
			if(result != 1) {
				result = 0;
				throw new Exception("1에러발생!!");
			}
			
			StringBuilder sql2 = new StringBuilder();
			//입금계좌에서 플러스
			sql2.append("update account set account_balance= (account_balance+?) where account_no=?");
			
			stmt = conn.prepareStatement(sql2.toString());
			
			stmt.setLong(1, transD.getTrans_amount());
			stmt.setString(2, transD.getTrans_Account());
			
			result = stmt.executeUpdate();
			
			if(result != 1) {
				result = 0;
				throw new Exception("2에러발생!!");
			}
				
			StringBuilder sql3 = new StringBuilder();
			//출금거래 기록
			sql3.append("INSERT INTO TRANSACTION");
			sql3.append("(BANK_CD, TRANS_NAME, TRANS_TYPE, TRANS_AMOUNT, TRANS_ACCOUNT, TRANS_BALANCE )");
			sql3.append("VALUES(?, ?, ?, ?, ?, ");
			sql3.append("(select account_balance from account where account_no=?))");
			
			stmt = conn.prepareStatement(sql3.toString());
			
			stmt.setString(1, transW.getBank_cd());
			stmt.setString(2, transW.getTrans_name());
			stmt.setString(3, transW.getTrans_type());
			stmt.setLong(4, transW.getTrans_amount());
			stmt.setString(5, transW.getTrans_Account());
			stmt.setString(6, transW.getTrans_Account());
			
			result = stmt.executeUpdate();
		
			if(result != 1) {
				result = 0;
				throw new Exception("3에러발생!!");
			}
			
			StringBuilder sql4 = new StringBuilder();
			//입금거래 기록
			sql4.append("INSERT INTO TRANSACTION");
			sql4.append("(BANK_CD, TRANS_NAME, TRANS_TYPE, TRANS_AMOUNT, TRANS_ACCOUNT, TRANS_BALANCE )");
			sql4.append("VALUES(?, ?, ?, ?, ?, ");
			sql4.append("(select account_balance from account where account_no=?))");
			
			stmt = conn.prepareStatement(sql4.toString());
			
			stmt.setString(1, transD.getBank_cd());
			stmt.setString(2, transD.getTrans_name());
			stmt.setString(3, transD.getTrans_type());
			stmt.setLong(4, transD.getTrans_amount());
			stmt.setString(5, transD.getTrans_Account());
			stmt.setString(6, transD.getTrans_Account());
			
			result = stmt.executeUpdate();
			
			if(result != 1) {
				result = 0;
				throw new Exception("4에러발생!!");
			}
			
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		
		return result;
	}
	
	//거래내역 리스트
	public List<TransactionVO> getTransList(String account_no) {
		List<TransactionVO> transList = new ArrayList<TransactionVO>();
        StringBuilder sql = new StringBuilder();

        sql.append("SELECT *");
        sql.append("  FROM TRANSACTION");
        sql.append(" WHERE TRANS_ACCOUNT=?");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(sql.toString());
            stmt.setString(1, account_no);

            rs = stmt.executeQuery();
            
            while (rs.next()) {
            	TransactionVO trans = new TransactionVO();
                trans.setTrans_date(rs.getDate("TRANS_DATE"));
                trans.setTrans_name(rs.getString("TRANS_NAME"));
                trans.setTrans_amount(rs.getLong("TRANS_AMOUNT"));
                trans.setTrans_balance(rs.getLong("TRANS_BALANCE"));
                trans.setTrans_type(rs.getString("TRANS_TYPE"));
                transList.add(trans);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return transList;
    }


}
