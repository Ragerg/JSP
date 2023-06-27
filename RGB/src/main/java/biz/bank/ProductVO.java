package biz.bank;

import java.util.Date;

public class ProductVO {
	private String product_cd;
	private String product_name;
	private float interest_rate;
	private Date reg_date;

	public ProductVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ProductVO(String product_cd, String product_name, float interest_rate, Date reg_date) {
		super();
		this.product_cd = product_cd;
		this.product_name = product_name;
		this.interest_rate = interest_rate;
		this.reg_date = reg_date;
	}

	public String getProduct_cd() {
		return product_cd;
	}

	public void setProduct_cd(String product_cd) {
		this.product_cd = product_cd;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public float getInterest_rate() {
		return interest_rate;
	}

	public void setInterest_rate(float interest_rate) {
		this.interest_rate = interest_rate;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	@Override
	public String toString() {
		return "ProductVO [product_cd=" + product_cd + ", product_name=" + product_name + ", interest_rate="
				+ interest_rate + ", reg_date=" + reg_date + "]";
	}

}
