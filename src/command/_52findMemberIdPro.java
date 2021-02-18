package command;

import bean.CustomerDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class _52findMemberIdPro implements CommandAction {
    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

        request.setCharacterEncoding("UTF-8");

        String name = request.getParameter("name");
        String email = request.getParameter("email");

        String checkId = CustomerDAO.getInstance().findId(name, email);

        request.setAttribute("checkId", checkId);
        // 사용자 (1)
        request.setAttribute("type", 1);

        return "51_findMemberIdPro.jsp";
    }
}
