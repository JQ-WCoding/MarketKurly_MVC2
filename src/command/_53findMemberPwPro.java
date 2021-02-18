package command;

import bean.CustomerDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class _53findMemberPwPro implements CommandAction{
    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
        request.setCharacterEncoding("UTF-8");

        String name = request.getParameter("name");
        String id = request.getParameter("id");
        String email = request.getParameter("email");

        String pw = CustomerDAO.getInstance().findPw(name, id, email);

        request.setAttribute("pw", pw);

        return "53_findMemberPwPro.jsp";
    }
}
