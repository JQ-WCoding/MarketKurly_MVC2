package command;

import bean.ItemDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class _43searchItemPro implements CommandAction{

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
        request.setCharacterEncoding("UTF-8");

        String itemName = request.getParameter("item");

        int check = ItemDAO.getInstance().searchItem(itemName);

        System.out.println(check);

        request.setAttribute("check", check);

        return "/43_searchItemPro.jsp";
    }
}
