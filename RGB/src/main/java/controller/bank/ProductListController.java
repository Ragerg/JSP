package controller.bank;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.bank.ProductDAO;
import biz.bank.ProductVO;
import controller.Controller;

public class ProductListController implements Controller {

    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) {

        ProductDAO dao = new ProductDAO();
        List<ProductVO> productList = dao.getProductList();

        request.setAttribute("productList", productList);
        return "/jsp/bank/productList.jsp";

    }
}