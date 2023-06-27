package biz.bank;

import java.util.Date;

public class BankVO {

	private String account_no;
	private String id;
	private String member_name;
	private String bank_code;
	private String pd_cd;
	private String account_pw;
	private Date account_date;
	private int account_balance;
	private String status_cd;

	public BankVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BankVO(String account_no, String id, String member_name, String bank_code, String pd_cd, String account_pw,
			Date account_date, int account_balance, String status_cd) {
		super();
		this.account_no = account_no;
		this.id = id;
		this.member_name = member_name;
		this.bank_code = bank_code;
		this.pd_cd = pd_cd;
		this.account_pw = account_pw;
		this.account_date = account_date;
		this.account_balance = account_balance;
		this.status_cd = status_cd;
	}

	public String getAccount_no() {
		return account_no;
	}

	public void setAccount_no(String account_no) {
		this.account_no = account_no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getBank_code() {
		return bank_code;
	}

	public void setBank_code(String bank_code) {
		this.bank_code = bank_code;
	}

	public String getPd_cd() {
		return pd_cd;
	}

	public void setPd_cd(String pd_cd) {
		this.pd_cd = pd_cd;
	}

	public String getAccount_pw() {
		return account_pw;
	}

	public void setAccount_pw(String account_pw) {
		this.account_pw = account_pw;
	}

	public Date getAccount_date() {
		return account_date;
	}

	public void setAccount_date(Date account_date) {
		this.account_date = account_date;
	}

	public int getAccount_balance() {
		return account_balance;
	}

	public void setAccount_balance(int account_balance) {
		this.account_balance = account_balance;
	}

	public String getStatus_cd() {
		return status_cd;
	}

	public void setStatus_cd(String status_cd) {
		this.status_cd = status_cd;
	}

	@Override
	public String toString() {
		return "BankVO [account_no=" + account_no + ", id=" + id + ", member_name=" + member_name + ", bank_code="
				+ bank_code + ", pd_cd=" + pd_cd + ", account_pw=" + account_pw + ", account_date=" + account_date
				+ ", account_balance=" + account_balance + ", status_cd=" + status_cd + "]";
	}

}
