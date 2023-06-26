package biz.board;

import java.sql.Date;

public class BoardVO {
	private int id;
	private String title;
	private String author;
	private String content;
	private boolean isPublic;
	private String createdAt;

	public BoardVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BoardVO(int id, String title, String author, String content, boolean isPublic, String createdAt) {
		super();
		this.id = id;
		this.title = title;
		this.author = author;
		this.content = content;
		this.isPublic = isPublic;
		this.createdAt = createdAt;
	}

	public BoardVO(int int1, String string, String string2, String string3, boolean equals, Date date, Date date2) {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public boolean isPublic() {
		return isPublic;
	}

	public void setPublic(boolean isPublic) {
		this.isPublic = isPublic;
	}

	public String getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}

	@Override
	public String toString() {
		return "BoardVO [id=" + id + ", title=" + title + ", author=" + author + ", content=" + content + ", isPublic="
				+ isPublic + ", createdAt=" + createdAt + "]";
	}

}
