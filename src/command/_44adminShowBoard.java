package command;

import bean.BoardDAO;
import bean.BoardDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class _44adminShowBoard implements CommandAction{
    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
        int pageSize = 5;

        int curPageNum = 1;
        if(request.getParameter("curPageNum") != null){
            curPageNum = Integer.parseInt(request.getParameter("curPageNum"));
        }

        int count = BoardDAO.getInstance().getAllBoardCount();

        int startRow = (curPageNum - 1) * pageSize;
        ArrayList<BoardDTO> boardList = BoardDAO.getInstance().getAllBoardList(startRow, pageSize);

        int number = count - startRow;

        int clickablePageSize = 5;
        int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
        int startPage;
        if(curPageNum % pageSize != 0){
            startPage = (curPageNum / pageSize) * pageSize + 1;
        }else{
            startPage = ((curPageNum / pageSize )- 1) * pageSize + 1;
        }
        int endPage = startPage + pageSize - 1;
        if(endPage > pageCount) endPage = pageCount;

        request.setAttribute("pageSize", pageSize);
        request.setAttribute("count", count);
        request.setAttribute("boardList", boardList);
        request.setAttribute("number", number);

        request.setAttribute("clickablePageSize", clickablePageSize);
        request.setAttribute("pageCount", pageCount);
        request.setAttribute("startPage", startPage);
        request.setAttribute("endPage", endPage);

        // 관리자(0)
        request.setAttribute("type", 0);

        return "/44_adminShowBoard.jsp";
    }
}
