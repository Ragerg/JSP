package biz.bank;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import biz.common.JDBCUtil;

public class ProductDAO {

    private Connection conn;
    private PreparedStatement stmt;
    private ResultSet rs;

    // 금융상품 전체보기
    public List<ProductVO> getProductList() {
        List<ProductVO> productList = new ArrayList<ProductVO>();
        StringBuilder sql = new StringBuilder();

        sql.append("SELECT * FROM PRODUCT WHERE STATUS_CD = 1");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(sql.toString());

            System.out.println(sql.toString());
            rs = stmt.executeQuery();

            while (rs.next()) {
                ProductVO product = new ProductVO();
                product.setProduct_cd(rs.getString("product_cd"));
                product.setProduct_name(rs.getString("product_name"));
                product.setInterest_rate(rs.getFloat("interest_rate"));
                product.setReg_date(rs.getDate("reg_date"));
                productList.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return productList;
    }

    // 금융상품 하나 보기
    public ProductVO getProduct(String product_cd) {
        ProductVO product = null;
        StringBuilder sql = new StringBuilder();

        sql.append("SELECT * FROM PRODUCT WHERE PRODUCT_CD = ?");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(sql.toString());
            stmt.setString(1, product_cd);

            rs = stmt.executeQuery();

            if (rs.next()) {
            	product = new ProductVO();
            	product.setProduct_cd(rs.getString("product_cd"));
            	product.setProduct_name(rs.getString("product_name"));
            	product.setInterest_rate(rs.getFloat("interest_rate"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return product;
    }

}
