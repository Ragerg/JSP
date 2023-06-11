package biz.rental;

public class RentalVO {

	private int rentNo;
	private int regNo;
	private String title;
	private String author;
	private String image;
	private String rentalDate;
	private String returnDate;
	private int renewal;

	public RentalVO() {
		super();
	}

	public RentalVO(int rentNo, int regNo, String title, String author, String image, String rentalDate,
			String returnDate, int renewal) {
		super();
		this.rentNo = rentNo;
		this.regNo = regNo;
		this.title = title;
		this.author = author;
		this.image = image;
		this.rentalDate = rentalDate;
		this.returnDate = returnDate;
		this.renewal = renewal;
	}

	public int getRentNo() {
		return rentNo;
	}

	public void setRentNo(int rentNo) {
		this.rentNo = rentNo;
	}

	public int getRegNo() {
		return regNo;
	}

	public void setRegNo(int regNo) {
		this.regNo = regNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getRentalDate() {
		return rentalDate;
	}

	public void setRentalDate(String rentalDate) {
		this.rentalDate = rentalDate;
	}

	public String getReturnDate() {
		return returnDate;
	}

	public void setReturnDate(String returnDate) {
		this.returnDate = returnDate;
	}

	public int getRenewal() {
		return renewal;
	}

	public void setRenewal(int renewal) {
		this.renewal = renewal;
	}

	@Override
	public String toString() {
		return "RentalVO [rentNo=" + rentNo + ", regNo=" + regNo + ", title=" + title + ", author=" + author
				+ ", image=" + image + ", rentalDate=" + rentalDate + ", returnDate=" + returnDate + ", renewal="
				+ renewal + "]";
	}

}
