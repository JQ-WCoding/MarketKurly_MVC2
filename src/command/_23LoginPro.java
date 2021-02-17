package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.CustomerDAO;

public class _23LoginPro implements CommandAction {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

        request.setCharacterEncoding("UTF-8");

        String id = request.getParameter("id");
        String pw = request.getParameter("pw");

        int check = CustomerDAO.getInstance().userCheck(id, pw);

        request.setAttribute("id", id);
        request.setAttribute("check", check);

        // 사용자(1)
        request.setAttribute("type", 1);

        return "/23_loginPro.jsp";
    }

}
