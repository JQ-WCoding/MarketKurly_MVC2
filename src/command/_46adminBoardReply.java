package command;

import bean.BoardDAO;
import bean.BoardDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class _46adminBoardReply implements CommandAction {
    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
        int num = Integer.parseInt(request.getParameter("num"));

        String title = BoardDAO.getInstance().getOneBoard(num).getTitle();
        request.setAttribute("title", title);

        // 관리자(0)
        request.setAttribute("type", 0);

        // 번호 넘겨주기 / 댓글시 전 글의 ref 수정을 위해
        request.setAttribute("num", num);

        return "47_boardWriteForAdmin.jsp";
    }
}
