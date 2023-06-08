package biz.book;

public class BookManagementVO extends BookVO {
	private int count;
	private int rentAble;

	public BookManagementVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BookManagementVO(int regNo, String isbn, String title, String author, String publisher, String pubdate,
			String description, String image, String regDate, int status) {
		super(regNo, isbn, title, author, publisher, pubdate, description, image, regDate, status);
		// TODO Auto-generated constructor stub
	}

	public BookManagementVO(int count, int rentAble) {
		super();
		this.count = count;
		this.rentAble = rentAble;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getRentAble() {
		return rentAble;
	}

	public void setRentAble(int rentAble) {
		this.rentAble = rentAble;
	}

	@Override
	public String toString() {
		return "BookManagementVO [count=" + count + ", rentAble=" + rentAble + "]";
	}

}