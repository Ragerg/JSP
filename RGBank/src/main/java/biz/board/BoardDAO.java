package biz.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import biz.common.JDBCUtil;

public class BoardDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

    // 게시글 생성 (Create)
    public int createBoard(BoardVO board) {
        int result = 0;
        try {
        	conn = JDBCUtil.getConnection();
            pstmt = conn.prepareStatement("INSERT INTO board (id, title, author, content, is_public) VALUES (board_seq.NEXTVAL, ?, ?, ?, ?)");
            pstmt.setString(1, board.getTitle());
            pstmt.setString(2, board.getAuthor());
            pstmt.setString(3, board.getContent());
            pstmt.setString(4, board.isPublic() ? "Y" : "N");
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pstmt != null) { try { pstmt.close(); } catch (Exception e) {} }
            if (conn != null) { try { conn.close(); } catch (Exception e) {} }
        }
        return result;
    }

    // 게시글 읽기 (Read)
    public BoardVO readBoard(int id) {
        BoardVO board = null;
        try {
        	conn = JDBCUtil.getConnection();
            pstmt = conn.prepareStatement("SELECT * FROM board WHERE id = ?");
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                board = new BoardVO(rs.getInt("id"), rs.getString("title"), rs.getString("author"),
                                    rs.getString("content"), rs.getString("is_public").equals("Y"),
                                    rs.getDate("created_at"), rs.getDate("last_updated"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) { try { rs.close(); } catch (Exception e) {} }
            if (pstmt != null) { try { pstmt.close(); } catch (Exception e) {} }
            if (conn != null) { try { conn.close(); } catch (Exception e) {} }
        }
        return board;
    }

    // 게시글 수정 (Update)
    public int updateBoard(BoardVO board) {
        int result = 0;
        try {
        	conn = JDBCUtil.getConnection();
            pstmt = conn.prepareStatement("UPDATE board SET title = ?, author = ?, content = ?, is_public = ?, last_updated = SYSDATE WHERE id = ?");
            pstmt.setString(1, board.getTitle());
            pstmt.setString(2, board.getAuthor());
            pstmt.setString(3, board.getContent());
            pstmt.setString(4, board.isPublic() ? "Y" : "N");
            pstmt.setInt(5, board.getId());
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pstmt != null) { try { pstmt.close(); } catch (Exception e) {} }
            if (conn != null) { try { conn.close(); } catch (Exception e) {} }
        }
        return result;
    }

    // 게시글 삭제 (Delete)
    public int deleteBoard(int id) {
        int result = 0;
        try {
        	conn = JDBCUtil.getConnection();
            pstmt = conn.prepareStatement("DELETE FROM board WHERE id = ?");
            pstmt.setInt(1, id);
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pstmt != null) { try { pstmt.close(); } catch (Exception e) {} }
            if (conn != null) { try { conn.close(); } catch (Exception e) {} }
        }
        return result;
    }

    // 게시글 목록 가져오기
    public ArrayList<BoardVO> getBoardList() {
        ArrayList<BoardVO> boardList = new ArrayList<>();
        try {
        	conn = JDBCUtil.getConnection();
            pstmt = conn.prepareStatement("SELECT * FROM board ORDER BY id DESC");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                BoardVO board = new BoardVO(rs.getInt("id"), rs.getString("title"), rs.getString("author"),
                                             rs.getString("content"), rs.getString("is_public").equals("Y"),
                                             rs.getDate("created_at"), rs.getDate("last_updated"));
                boardList.add(board);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) { try { rs.close(); } catch (Exception e) {} }
            if (pstmt != null) { try { pstmt.close(); } catch (Exception e) {} }
            if (conn != null) { try { conn.close(); } catch (Exception e) {} }
        }
        return boardList;
    }
}
