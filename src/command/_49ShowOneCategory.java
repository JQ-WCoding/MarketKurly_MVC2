package command;

import bean.ItemDAO;
import bean.ItemDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class _49ShowOneCategory implements CommandAction{
    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
        request.setCharacterEncoding("UTF-8");

        String category = request.getParameter("category");
        request.setAttribute("category", category);

        ArrayList<ItemDTO> items = ItemDAO.getInstance().getOneCategory(category);
        request.setAttribute("items", items);

        // 사용자(1)
        request.setAttribute("type", 1);

        return "49_showOneCategory.jsp";
    }

}
