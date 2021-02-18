package command;

import bean.BoardDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class _47boardDeleteforAdmin implements CommandAction{
    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
        int num = Integer.parseInt(request.getParameter("num"));

        BoardDAO.getInstance().deleteBoard(num);

        // 관리자(0)
        request.setAttribute("type", 0);

        return "/46_boardDeleteForAdmin.jsp";
    }
}
