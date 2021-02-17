package command;

import bean.BoardDAO;
import bean.BoardDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class _45adminShowBoardContent implements CommandAction{
    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
        int num = Integer.parseInt(request.getParameter("num"));

        BoardDTO board = BoardDAO.getInstance().getOneBoard(num);

        request.setAttribute("board", board);

        // 관리자(2)
        request.setAttribute("type", 0);

        return "/45_adminShowBoardContent.jsp";
    }
}
