package biz.bank;

import java.util.Date;

public class TransactionVO {

	private String bank_cd;
	private String trans_name;
	private String trans_type;
	private long trans_amount;
	private Date trans_date;
	private String trans_time;
	private String trans_Account;
	private long trans_balance;

	public TransactionVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public TransactionVO(String bank_cd, String trans_name, String trans_type, long trans_amount,
			Date trans_date, String trans_time, String trans_Account, long trans_balance) {
		super();
		this.bank_cd = bank_cd;
		this.trans_name = trans_name;
		this.trans_type = trans_type;
		this.trans_amount = trans_amount;
		this.trans_date = trans_date;
		this.trans_time = trans_time;
		this.trans_Account = trans_Account;
		this.trans_balance = trans_balance;
	}

	public String getBank_cd() {
		return bank_cd;
	}

	public void setBank_cd(String bank_cd) {
		this.bank_cd = bank_cd;
	}

	public String getTrans_name() {
		return trans_name;
	}

	public void setTrans_name(String trans_name) {
		this.trans_name = trans_name;
	}

	public String getTrans_type() {
		return trans_type;
	}

	public void setTrans_type(String trans_type) {
		this.trans_type = trans_type;
	}

	public long getTrans_amount() {
		return trans_amount;
	}

	public void setTrans_amount(long trans_amount) {
		this.trans_amount = trans_amount;
	}

	public Date getTrans_date() {
		return trans_date;
	}

	public void setTrans_date(Date trans_date) {
		this.trans_date = trans_date;
	}

	public String getTrans_time() {
		return trans_time;
	}

	public void setTrans_time(String trans_time) {
		this.trans_time = trans_time;
	}

	public String getTrans_Account() {
		return trans_Account;
	}

	public void setTrans_Account(String trans_Account) {
		this.trans_Account = trans_Account;
	}

	public long getTrans_balance() {
		return trans_balance;
	}

	public void setTrans_balance(long trans_balance) {
		this.trans_balance = trans_balance;
	}

	@Override
	public String toString() {
		return "TransactionVO [bank_cd=" + bank_cd + ", trans_name=" + trans_name + ", trans_type="
				+ trans_type + ", trans_amount=" + trans_amount + ", trans_date=" + trans_date + ", trans_time="
				+ trans_time + ", trans_Account=" + trans_Account + ", trans_balance=" + trans_balance + "]";
	}

}
