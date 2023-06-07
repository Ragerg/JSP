package biz.book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import biz.common.JDBCUtil;

public class BookDAO {
	private Connection conn;
	private PreparedStatement stmt;
	private ResultSet rs;

	private static String BOOK_INSERT = "insert into t_book(regno, isbn, title, author, publisher, pubdate, description, image) "
			+ " values(seq_t_book_regno.nextval, ?, ?, ?, ?, ?, ?, ?) ";

	// 책 추가
	public void insertBook(BookVO vo) {
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOOK_INSERT);
			stmt.setString(1, vo.getIsbn());
			stmt.setString(2, vo.getTitle());
			stmt.setString(3, vo.getAuthor());
			stmt.setString(4, vo.getPublisher());
			stmt.setString(5, vo.getPubdate());
			stmt.setString(6, vo.getDescription());
			stmt.setString(7, vo.getImage());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}
}

