package biz.book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
	
	// 도서검색
    public List<BookVO> searchBookList(String searchItem, String searchText) {

    	List<BookVO> bookList = new ArrayList<BookVO>();
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT ISBN, TITLE, AUTHOR, PUBDATE, ");
		sql.append("       REGDATE, IMAGE, PUBLISHER, ");
		sql.append("       DESCRIPTION, ");
		sql.append("       COUNT(ISBN)  AS COUNT, ");
		sql.append("       SUM(STATUS) AS RENTABLE ");
		sql.append("  FROM T_BOOK ");
		sql.append(" WHERE INSTR(UPPER(" + searchItem + "), UPPER(?)) > 0");
		sql.append(" GROUP BY ISBN, TITLE, AUTHOR, PUBDATE, ");
		sql.append("          REGDATE, IMAGE, PUBLISHER, ");
		sql.append("          DESCRIPTION");
		sql.append(" ORDER BY TITLE");

        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(sql.toString());
            stmt.setString(1, searchText);
            rs = stmt.executeQuery();

            while (rs.next()) {
                BookManagementVO book = new BookManagementVO();
                book.setIsbn(rs.getString("isbn"));
                book.setTitle(rs.getString("title"));
                book.setAuthor(rs.getString("author"));
                book.setPubdate(rs.getString("pubdate"));
                book.setRegDate(rs.getString("regdate"));
                book.setImage(rs.getString("image"));
                book.setPublisher(rs.getString("publisher"));
                book.setDescription(rs.getString("description"));
                book.setCount(rs.getInt("count"));
                book.setRentAble(rs.getInt("rentable"));

                bookList.add(book);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(rs, stmt, conn);
        }
        return bookList;
    }

    //전체 도서목록
    public List<BookVO> getBookList() {

    	List<BookVO> bookList = new ArrayList<BookVO>();
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT ISBN, TITLE, AUTHOR, PUBDATE, ");
		sql.append("       REGDATE, IMAGE, PUBLISHER, ");
		sql.append("       DESCRIPTION, ");
		sql.append("       COUNT(ISBN)  AS COUNT, ");
		sql.append("       SUM(STATUS) AS RENTABLE ");
		sql.append("  FROM T_BOOK ");
		sql.append(" GROUP BY ISBN, TITLE, AUTHOR, PUBDATE, ");
		sql.append("          REGDATE, IMAGE, PUBLISHER, ");
		sql.append("          DESCRIPTION");
		sql.append(" ORDER BY TITLE");

        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(sql.toString());
            rs = stmt.executeQuery();

            while (rs.next()) {
                BookManagementVO book = new BookManagementVO();
                book.setIsbn(rs.getString("isbn"));
                book.setTitle(rs.getString("title"));
                book.setAuthor(rs.getString("author"));
                book.setPubdate(rs.getString("pubdate"));
                book.setRegDate(rs.getString("regdate"));
                book.setImage(rs.getString("image"));
                book.setPublisher(rs.getString("publisher"));
                book.setDescription(rs.getString("description"));
                book.setCount(rs.getInt("count"));
                book.setRentAble(rs.getInt("rentable"));

                bookList.add(book);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(rs, stmt, conn);
        }
        return bookList;
    }

    // 도서 삭제 시 isbn 같은 책들 목록
    public List<BookVO> getBookISBN(String isbn) {
        List<BookVO> bookList = new ArrayList<BookVO>();
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT * FROM T_BOOK WHERE ISBN = ? ORDER BY REGNO");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(sql.toString());
            stmt.setString(1, isbn);
            rs = stmt.executeQuery();

            while (rs.next()) {
            	BookManagementVO book = new BookManagementVO();
                book.setRegNo(rs.getInt("regno"));
                book.setIsbn(rs.getString("isbn"));
                book.setTitle(rs.getString("title"));
                book.setAuthor(rs.getString("author"));
                book.setPubdate(rs.getString("pubdate"));
                book.setRegDate(rs.getString("regdate"));
                book.setImage(rs.getString("image"));
                book.setPublisher(rs.getString("publisher"));
                book.setDescription(rs.getString("description"));
                book.setStatus(rs.getInt("status"));

                bookList.add(book);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(rs, stmt, conn);
        }
        return bookList;
    }

    // 도서삭제
    public int deleteBook(int regNo) {
        int result = 0;
        StringBuilder sql = new StringBuilder();
        sql.append("DELETE FROM T_BOOK WHERE REGNO = ?");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(sql.toString());
            stmt.setInt(1, regNo);
            result = stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(rs, stmt, conn);
        }
        return result;
    }
}

