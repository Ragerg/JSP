package biz.rental;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import biz.common.JDBCUtil;

public class RentalDAO {
    private Connection conn;
    private PreparedStatement stmt;
    private ResultSet rs;

    // 도서대여
    public int insertRental(String id, String isbn) {
        int result = 0;
        StringBuilder sql1 = new StringBuilder();
        sql1.append("INSERT INTO T_RENTAL (ID, REGNO)");
        sql1.append("VALUES (");
        sql1.append("        ?,");
        sql1.append("        (SELECT MIN(REGNO) ");
        sql1.append("           FROM T_BOOK");
        sql1.append("          WHERE ISBN = ?");
        sql1.append("            AND STATUS = 1");
        sql1.append("       ))");

        StringBuilder sql2 = new StringBuilder();
        sql2.append("UPDATE T_BOOK");
        sql2.append("   SET STATUS = 0");
        sql2.append(" WHERE REGNO = (");
        sql2.append("      SELECT MIN(REGNO)");
        sql2.append("        FROM T_BOOK");
        sql2.append("       WHERE ISBN = ?");
        sql2.append("         AND STATUS = 1)");
        try {
            conn = JDBCUtil.getConnection();
            conn.setAutoCommit(false);
            stmt = conn.prepareStatement(sql1.toString());
            stmt.setString(1, id);
            stmt.setString(2, isbn);
            result = stmt.executeUpdate();

            if (result == 1) {
                stmt = conn.prepareStatement(sql2.toString());
                stmt.setString(1, isbn);
                result = stmt.executeUpdate();
                conn.commit();
            }

        } catch (Exception e) {
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException ex) {
                    e.printStackTrace();
                }
            }
            e.printStackTrace();
        } finally {
            JDBCUtil.close(rs, stmt, conn);
        }
        return result;
    }

    // 대여현황 조회
    public List<RentalVO> getRentalList(String id) {
        List<RentalVO> rentalList = new ArrayList<RentalVO>();
        StringBuilder sql = new StringBuilder();
        sql.append(
                "SELECT RENTNO, R.REGNO, TITLE, AUTHOR, IMAGE, TO_CHAR(RENTAL_DATE, 'YYYY-MM-DD') AS RENTAL_DATE, TO_CHAR(RETURN_DATE, 'YYYY-MM-DD') AS RETURN_DATE, RENEWAL");
        sql.append("  FROM T_BOOK   B, T_RENTAL R");
        sql.append(" WHERE B.REGNO = R.REGNO");
        sql.append("   AND ID = ?");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(sql.toString());
            stmt.setString(1, id);

            rs = stmt.executeQuery();

            while (rs.next()) {
                RentalVO rental = new RentalVO();
                rental.setRentNo(rs.getInt("RENTNO"));
                rental.setRegNo(rs.getInt("REGNO"));
                rental.setTitle(rs.getString("TITLE"));
                rental.setAuthor(rs.getString("AUTHOR"));
                rental.setImage(rs.getString("IMAGE"));
                rental.setRentalDate(rs.getString("RENTAL_DATE"));
                rental.setReturnDate(rs.getString("RETURN_DATE"));
                rental.setRenewal(rs.getInt("RENEWAL"));

                rentalList.add(rental);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(rs, stmt, conn);
        }
        return rentalList;
    }

    // 대여연장
    public int renewal(int rentNo) {
        int result = 0;
        StringBuilder sql = new StringBuilder();
        sql.append("UPDATE T_RENTAL");
        sql.append("   SET RENEWAL = 0, RETURN_DATE = RETURN_DATE + 7");
        sql.append(" WHERE RENTNO = ?");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(sql.toString());
            stmt.setInt(1, rentNo);

            result = stmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(rs, stmt, conn);
        }

        return result;
    }

    // 반납
    public int returnRental(int regNo) {
        int result = 0;
        StringBuilder sql = new StringBuilder();
        sql.append("DELETE FROM T_RENTAL");
        sql.append(" WHERE REGNO = ?");

        StringBuilder sql2 = new StringBuilder();
        sql2.append("UPDATE T_BOOK");
        sql2.append("   SET STATUS = 1");
        sql2.append(" WHERE REGNO = ?");
        try {
            conn = JDBCUtil.getConnection();
            conn.setAutoCommit(false);
            stmt = conn.prepareStatement(sql.toString());
            stmt.setInt(1, regNo);
            result = stmt.executeUpdate();

            if (result == 1) {
                stmt = conn.prepareStatement(sql2.toString());
                stmt.setInt(1, regNo);
                result = stmt.executeUpdate();
                conn.commit();
            }

        } catch (Exception e) {
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException ex) {
                    e.printStackTrace();
                }
            }
            e.printStackTrace();
        } finally {
            JDBCUtil.close(rs, stmt, conn);
        }

        return result;
    }
}