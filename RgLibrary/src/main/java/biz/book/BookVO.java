package biz.book;

public class BookVO {

	private int regNo; //책번호
	private String isbn; // isbn
	private String title; // 책제목 
	private String author; // 저자 
	private String publisher; // 출판사 
	private String pubdate; // 출판일
	private String description; // 책소개
	private String image; // 책표지 이미지 링크
	private String regDate; // 도서관 책등록일
	private int status; // 대여가능 여부
	
	public BookVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BookVO(int regNo, String isbn, String title, String author, String publisher, String pubdate,
			String description, String image, String regDate, int status) {
		super();
		this.regNo = regNo;
		this.isbn = isbn;
		this.title = title;
		this.author = author;
		this.publisher = publisher;
		this.pubdate = pubdate;
		this.description = description;
		this.image = image;
		this.regDate = regDate;
		this.status = status;
	}

	public int getRegNo() {
		return regNo;
	}

	public void setRegNo(int regNo) {
		this.regNo = regNo;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
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

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getPubdate() {
		return pubdate;
	}

	public void setPubdate(String pubdate) {
		this.pubdate = pubdate;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "BookVO [regNo=" + regNo + ", isbn=" + isbn + ", title=" + title + ", author=" + author + ", publisher="
				+ publisher + ", pubdate=" + pubdate + ", description=" + description + ", image=" + image
				+ ", regDate=" + regDate + ", status=" + status + "]";
	}

	
	
}
