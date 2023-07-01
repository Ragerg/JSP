package biz.bank;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
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
        StringBuilder sql = new StringBuilder();
        System.out.println("D: " + transD);
        System.out.println("W: " + transW);
        sql.append("{call P_Transaction(?, ?, ?, ?, ?, ?, ?, ?) }");
        try {
            conn = JDBCUtil.getConnection();
            CallableStatement cstmt = conn.prepareCall(sql.toString());
            //출금계좌
            cstmt.setString(1, transW.getTrans_Account());
            //출금은행 코드
            cstmt.setString(2, transW.getBank_cd());
            //보내는사람 이름
            cstmt.setString(3, transD.getTrans_name());
            //입금계좌
            cstmt.setString(4, transD.getTrans_Account());
            //입금은행 코드
            cstmt.setString(5, transD.getBank_cd());
            //받는사람 이름
            cstmt.setString(6, transW.getTrans_name());
            //거래 금액
            cstmt.setLong(7, transW.getTrans_amount());
            cstmt.registerOutParameter(8, Types.INTEGER);
            cstmt.execute();

            // 결과값 가져오기
            result = cstmt.getInt(8);
            cstmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(stmt, conn);
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
    	sql.append(" ORDER BY TRANS_NO DESC");
    	
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
    
    //오픈거래내역 리스트
    public List<TransactionVO> getOpenTransList(String bank_code, String account_no) {
    	List<TransactionVO> transList = new ArrayList<TransactionVO>();
    	StringBuilder sql = new StringBuilder();
    	
    	switch (bank_code) {
        case "333":
	    	sql.append("WITH temp AS (");
	    	sql.append(" SELECT TRANSACTION_DATE as Trans_date, TRANSACTION_TYPE as Trans_type, SENDER_NAME as Trans_name, AMOUNT as Trans_amount,");
	    	sql.append(" LAG(AMOUNT) OVER (ORDER BY TRANSACTION_DATE DESC) AS PREV_AMOUNT, a.ACCOUNT_BALANCE");
	    	sql.append("  FROM ACCOUNT@JI a JOIN TRANSACTION_HISTORY@JI th ON a.ACCOUNT_NO = th.TRANSACTION_ID");
	    	sql.append(" WHERE a.ACCOUNT_NO =?)");
	    	sql.append(" SELECT Trans_date, Trans_type, Trans_name, Trans_amount,");
	    	sql.append(" CASE WHEN ROW_NUMBER() OVER (ORDER BY Trans_date DESC) = 1 THEN ACCOUNT_BALANCE");
	    	sql.append(" ELSE ACCOUNT_BALANCE - SUM(CASE");
	    	sql.append(" WHEN Trans_type = '출금' THEN -PREV_AMOUNT");
	    	sql.append(" ELSE PREV_AMOUNT END) OVER (ORDER BY Trans_date DESC) END AS Trans_balance");
	    	sql.append(" FROM temp ORDER BY Trans_date DESC");
    	 break;
        case "777":
        	sql.append("SELECT *");
        	sql.append("  FROM TRANSACTION @YJ");
        	sql.append(" WHERE TRANS_ACCOUNT=?");
        	sql.append(" ORDER BY TRANS_DATE DESC");
        	 break;
        }
    	try {
    		conn = JDBCUtil.getConnection();
    		stmt = conn.prepareStatement(sql.toString());
    		stmt.setString(1, account_no);
    		
    		rs = stmt.executeQuery();
    		
    		System.out.println(sql);
    		
    		while (rs.next()) {
    			TransactionVO trans = new TransactionVO();
    			trans.setTrans_date(rs.getDate("Trans_date"));
    			trans.setTrans_name(rs.getString("Trans_name"));
    			trans.setTrans_amount(rs.getLong("Trans_amount"));
    			trans.setTrans_balance(rs.getLong("Trans_balance"));
    			trans.setTrans_type(rs.getString("Trans_type"));
    			transList.add(trans);
    			System.out.println(trans);
    		}
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    	return transList;
    }
	
	//받는 사람 이름 확인
	public String checkAccount(String toAccount, String bank_code) {
        String name = "";
        StringBuilder sql = new StringBuilder();

        switch (bank_code) {
	        case "999":
	            sql.append("SELECT USER_NAME FROM BANK_USER WHERE USER_ID = (");
	            sql.append("       SELECT ID  FROM ACCOUNT WHERE ACCOUNT_NO = ?)");
	            break;
	        case "333":
	            sql.append("SELECT NAME FROM USERS@JI WHERE ID = (");
	            sql.append("SELECT ID FROM ACCOUNT@JI WHERE ACCOUNT_NO = ?)");
	            break;
	        case "777":
	            sql.append("SELECT NAME FROM BANK_USERS@YJ WHERE ID = (");
	            sql.append("       SELECT ID FROM ACCOUNT@YJ WHERE ACCOUNT_NO = ?)");
	            break;
        }
        
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(sql.toString());
            stmt.setString(1, toAccount);

            rs = stmt.executeQuery();

            if (rs.next()) {
                name = rs.getString(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(rs, stmt, conn);
        }
        return name;
    
	}


}

//	// 계좌이체 자바코드_너무 아까워ㅠㅜㅜ
//	public int Transaction(TransactionVO transD, TransactionVO transW) {
//		int result = 0;
//		StringBuilder sql1 = new StringBuilder();
//		//출금계좌에서 마이너스
//		sql1.append("update account set account_balance= (account_balance-?) where account_no=?");
//
//		try {
//			conn = JDBCUtil.getConnection();
//			//자동커밋 꺼두기
//			conn.setAutoCommit(false);
//			stmt = conn.prepareStatement(sql1.toString());
//			
//			stmt.setLong(1, transW.getTrans_amount());
//			stmt.setString(2, transW.getTrans_Account());
//			
//			result = stmt.executeUpdate();
//			
//			if(result != 1) {
//				result = 0;
//				throw new Exception("1에러발생!!");
//			}
//			
//			StringBuilder sql2 = new StringBuilder();
//			//입금계좌에서 플러스
//			sql2.append("update account set account_balance= (account_balance+?) where account_no=?");
//			
//			stmt = conn.prepareStatement(sql2.toString());
//			
//			stmt.setLong(1, transD.getTrans_amount());
//			stmt.setString(2, transD.getTrans_Account());
//			
//			result = stmt.executeUpdate();
//			
//			if(result != 1) {
//				result = 0;
//				throw new Exception("2에러발생!!");
//			}
//				
//			StringBuilder sql3 = new StringBuilder();
//			//출금거래 기록
//			sql3.append("INSERT INTO TRANSACTION");
//			sql3.append("(BANK_CD, TRANS_NAME, TRANS_TYPE, TRANS_AMOUNT, TRANS_ACCOUNT, TRANS_BALANCE )");
//			sql3.append("VALUES(?, ?, ?, ?, ?, ");
//			sql3.append("(select account_balance from account where account_no=?))");
//			
//			stmt = conn.prepareStatement(sql3.toString());
//			
//			stmt.setString(1, transW.getBank_cd());
//			stmt.setString(2, transW.getTrans_name());
//			stmt.setString(3, transW.getTrans_type());
//			stmt.setLong(4, transW.getTrans_amount());
//			stmt.setString(5, transW.getTrans_Account());
//			stmt.setString(6, transW.getTrans_Account());
//			
//			result = stmt.executeUpdate();
//		
//			if(result != 1) {
//				result = 0;
//				throw new Exception("3에러발생!!");
//			}
//			
//			StringBuilder sql4 = new StringBuilder();
//			//입금거래 기록
//			sql4.append("INSERT INTO TRANSACTION");
//			sql4.append("(BANK_CD, TRANS_NAME, TRANS_TYPE, TRANS_AMOUNT, TRANS_ACCOUNT, TRANS_BALANCE )");
//			sql4.append("VALUES(?, ?, ?, ?, ?, ");
//			sql4.append("(select account_balance from account where account_no=?))");
//			
//			stmt = conn.prepareStatement(sql4.toString());
//			
//			stmt.setString(1, transD.getBank_cd());
//			stmt.setString(2, transD.getTrans_name());
//			stmt.setString(3, transD.getTrans_type());
//			stmt.setLong(4, transD.getTrans_amount());
//			stmt.setString(5, transD.getTrans_Account());
//			stmt.setString(6, transD.getTrans_Account());
//			
//			result = stmt.executeUpdate();
//			
//			if(result != 1) {
//				result = 0;
//				throw new Exception("4에러발생!!");
//			}
//			
//			conn.commit();
//		} catch (Exception e) {
//			try {
//				conn.rollback();
//			} catch (SQLException e1) {
//				e1.printStackTrace();
//			}
//			e.printStackTrace();
//		} finally {
//			JDBCUtil.close(rs, stmt, conn);
//		}
//		
//		return result;
//	}
//	