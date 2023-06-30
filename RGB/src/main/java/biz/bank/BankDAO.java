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
		sql.append("       account_balance,");
		sql.append("       account_name");
		sql.append(") VALUES (?, ?, ?, ?, ?, ?, ?)");

		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql.toString());
			stmt.setString(1, bank.getAccount_no());
			stmt.setString(2, bank.getId());
			stmt.setString(3, bank.getMember_name());
			stmt.setString(4, bank.getPd_cd());
			stmt.setString(5, bank.getAccount_pw());
			stmt.setLong(6, bank.getAccount_balance());
			stmt.setString(7, bank.getAccount_name());

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

	// 내계좌 조회
	public List<BankVO> getAccountList(String id) {
		List<BankVO> accountList = new ArrayList<BankVO>();
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT * FROM ACCOUNT WHERE ID = ? AND STATUS_CD = 1");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql.toString());
			stmt.setString(1, id);

			rs = stmt.executeQuery();

			long totalBalance = 0L; // 총 잔액

			while (rs.next()) {
				BankVO account = new BankVO();
				account.setAccount_no(rs.getString("account_no"));
				account.setId(rs.getString("id"));
				account.setMember_name(rs.getString("member_name"));
				account.setBank_code(rs.getString("bank_code"));
				account.setPd_cd(rs.getString("pd_cd"));
				account.setAccount_pw(rs.getString("account_pw"));
				account.setAccount_date(rs.getDate("account_date"));
				account.setAccount_balance(rs.getLong("account_balance"));
				account.setStatus_cd(rs.getString("status_cd"));
				account.setAccount_name(rs.getString("account_name"));

				accountList.add(account);

				totalBalance += account.getAccount_balance(); // 총 잔액 누적
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return accountList;
	}

	// 계좌 상세 조회
	public BankVO getAccount(String id) {
		BankVO bank = null;
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT * FROM ACCOUNT WHERE ACCOUNT_NO = ?");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql.toString());
			stmt.setString(1, id);

			rs = stmt.executeQuery();

			if (rs.next()) {
				bank = new BankVO();
				bank.setAccount_no(rs.getString("ACCOUNT_NO"));
				bank.setAccount_pw(rs.getString("ACCOUNT_PW"));
				bank.setAccount_balance(rs.getLong("ACCOUNT_BALANCE"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return bank;
	}

	
	//오픈뱅킹 
	public List<BankVO> openBank(UserVO user) {
		List<BankVO> accountList = new ArrayList<BankVO>();
		StringBuilder sql = new StringBuilder();
		sql.append(" SELECT account_no, id, bank_code, ");
		sql.append("  CASE WHEN product_id = '5' THEN 'Y' ELSE 'Z' END as pd_cd, ");
		sql.append("  account_pw, ac_op_date as account_date, account_balance, '1' as status_cd, member_name, account_name");
		sql.append(" FROM account @JI");
		sql.append(" WHERE id = (SELECT ID FROM users @JI WHERE NAME= ? AND BIRTH= ? AND PHONE= ?)");
		
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql.toString());
			stmt.setString(1, user.getUser_name());
			stmt.setString(2, user.getUser_birthday());
			stmt.setString(3, user.getPhone_no().replace("-", ""));

			rs = stmt.executeQuery();

			long totalBalance = 0L; // 총 잔액

			while (rs.next()) {
				BankVO account = new BankVO();
				account.setAccount_no(rs.getString("account_no"));
				account.setId(rs.getString("id"));
				account.setMember_name(rs.getString("member_name"));
				account.setBank_code(rs.getString("bank_code"));
				account.setPd_cd(rs.getString("pd_cd"));
				account.setAccount_pw(rs.getString("account_pw"));
				account.setAccount_date(rs.getDate("account_date"));
				account.setAccount_balance(rs.getLong("account_balance"));
				account.setStatus_cd(rs.getString("status_cd"));
				account.setAccount_name(rs.getString("account_name"));

				accountList.add(account);

				totalBalance += account.getAccount_balance(); // 총 잔액 누적
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return accountList;
	}
	
	
	
//	public int openBank(UserVO user) {
//		int result = 0;
//		StringBuilder sql = new StringBuilder();
//		sql.append(" SELECT account_no, id, bank_code, ");
//		sql.append("  CASE WHEN product_id = '5' THEN 'Y' ELSE 'Z' END,");
//		sql.append("  account_pw, ac_op_date, account_balance, '1', member_name, account_name");
//		sql.append(" FROM account @JI");
//		sql.append(" WHERE id = (SELECT ID FROM users @JI WHERE NAME= ? AND BIRTH= ? AND PHONE= ?)");
//
//		try {
//			conn = JDBCUtil.getConnection();
//			stmt = conn.prepareStatement(sql.toString());
//			stmt.setString(1, user.getUser_name());
//			stmt.setString(2, user.getUser_birthday());
//			stmt.setString(3, user.getPhone_no().replace("-", ""));
//
//			result = stmt.executeUpdate();
//			System.out.println(result);
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			JDBCUtil.close(rs, stmt, conn);
//		}
//		return result;
//	}




}
