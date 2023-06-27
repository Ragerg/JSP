package biz.bank;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import biz.bank.BankVO;
import biz.common.JDBCUtil;
import biz.user.*;

public class BankDAO {
	private Connection conn;
	private PreparedStatement stmt;
	private ResultSet rs;
	
//	private static String MONEY_INSERT = "UPDATE ACCOUNT SET ac_money = ac_money + ? WHERE ac_number = ?";
//
//	private static String GET_ACCOUNT = "select * from account where user_id=? ";
//	
//	private static String ID_CHECK = "select user_id from user_info where user_id = ? ";
//
//	private static String MEMBER_GET = "select * from user_info where user_id =? and password=?";

	
	

	// 계좌개설
    public int insertAccount(BankVO bank) {
        int result = 0;
        StringBuilder sql = new StringBuilder();
        sql.append("INSERT INTO ACCOUNT (");
        sql.append("       account_no,");
        sql.append("       id,");
        sql.append("       member_name,");
        sql.append("       pd_cd,");
        sql.append("       account_pw,");
        sql.append("       account_balance");
        sql.append(") VALUES (?, ?, ?, ?, ?, ?)");

        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(sql.toString());
            stmt.setString(1, bank.getAccount_no());
            stmt.setString(2, bank.getId());
            stmt.setString(3, bank.getMember_name());
            stmt.setString(4, bank.getPd_cd());
            stmt.setString(5, bank.getAccount_pw());
            stmt.setInt(6, bank.getAccount_balance());

            result = stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(rs, stmt, conn);
        }
        return result;
    }
    
 // 계좌 중복확인
    public boolean checkAccount(String account_no) {
        boolean check = false;
        String sql = "select * from ACCOUNT where account_no = ?";

        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(sql.toString());
            stmt.setString(1, account_no);

            rs = stmt.executeQuery();

            if (rs.next()) {
                check = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return check;
    }

}
