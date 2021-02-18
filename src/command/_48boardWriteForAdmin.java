package command;

import bean.BoardDAO;
import bean.BoardDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class _48boardWriteForAdmin implements CommandAction{
    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
        request.setCharacterEncoding("UTF-8");
        int num = Integer.parseInt(request.getParameter("num"));

        BoardDTO beforeDTO = BoardDAO.getInstance().getOneBoard(num);

        String writer = request.getParameter("writer");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String pw = request.getParameter("pw");

        BoardDTO dto = new BoardDTO();
        dto.setWriter(writer);
        dto.setTitle(title);
        dto.setContent(content);
        dto.setPw(pw);

        // writeAnswer 메소드 사용
        BoardDAO.getInstance().writeAnswer(dto, beforeDTO);

        // 관리자(0)
        request.setAttribute("type", 0);

        return "48_boardWriteForAdminPro.jsp";
    }
}
