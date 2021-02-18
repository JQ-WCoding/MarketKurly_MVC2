package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.*;

@WebServlet("*.do")
public class Controller extends HttpServlet {
    private Map<String, Object> commandMap = new HashMap<String, Object>();

    @Override
    public void init() throws ServletException {
        commandMap.put("/index.do", new _00ShopMain());
        commandMap.put("/managerMain.do", new _01ManagerMain());
        commandMap.put("/managerLogin.do", new _02ManagerLogin());
        commandMap.put("/managerLoginPro.do", new _03ManagerLoginPro());
        commandMap.put("/managerLogout.do", new _04ManagerLogout());
        commandMap.put("/addNewItem.do", new _05AddNewItem());
        commandMap.put("/addNewItemPro.do", new _06AddNewItemPro());
        commandMap.put("/updateItem.do", new _07UpdateItem());
        commandMap.put("/updateItemPro.do", new _08UpdateItemPro());
        commandMap.put("/deleteItemPro.do", new _09DeleteItemPro());
        commandMap.put("/checkOrderList.do", new _10CheckOrderList());
        commandMap.put("/itemListForManager.do", new _11ItemListForManager());
        commandMap.put("/adminShowBoard.do", new _44adminShowBoard());
        commandMap.put("/adminShowBoardContent.do" , new _45adminShowBoardContent());
        commandMap.put("/adminBoardReply.do", new _46adminBoardReply());
//		//--------------------------------------------------------------------------
        commandMap.put("/join.do", new _18Join());
        commandMap.put("/joinPro.do", new _19JoinPro());
        commandMap.put("/checkDoubleId.do", new _20CheckDoubleId());
        commandMap.put("/checkDoubleEmail.do", new _21CheckDoubleEmail());
        commandMap.put("/login.do", new _22Login());
        commandMap.put("/loginPro.do", new _23LoginPro());
        commandMap.put("/logout.do", new _24Logout());
        commandMap.put("/showAllItem.do", new _25ShowAllItem());
        commandMap.put("/showOneItem.do", new _26ShowOneItem());
        commandMap.put("/showNewItem.do", new _27ShowNewItem());
        commandMap.put("/showBestItem.do", new _28ShowBestItem());
        commandMap.put("/showDiscountedItem.do", new _29ShowDiscountedItem());
        commandMap.put("/insertCart.do", new _30InsertCart());
        commandMap.put("/cartInfo.do", new _31CartInfo());
        commandMap.put("/order.do", new _32Order());
        commandMap.put("/insertOrderList.do", new _33InsertOrderList());
        commandMap.put("/deleteCart.do", new _34DeleteCart());
        commandMap.put("/checkMyOrderList.do", new _35MyOrderList());
        commandMap.put("/showBoardListForCustomer.do", new _36ShowBoardListForCustomer());
        commandMap.put("/boardWriteForCustomer.do", new _37BoardWriteForCustomer());
        commandMap.put("/boardWriteForCustomerPro.do", new _38BoardWriteForCustomerPro());
        commandMap.put("/showBoardContentForCustomer.do", new _39ShowBoardContentForCustomer());
        commandMap.put("/boardUpdateForCustomer.do", new _40BoardUpdateForCustomer());
        commandMap.put("/boardUpdateForCustomerPro.do", new _41BoardUpdateForCustomerPro());
        commandMap.put("/boardDeleteForCustomer.do", new _42BoardDeleteForCustomer());
        commandMap.put("/searchItemPro.do", new _43searchItemPro());
        commandMap.put("/boardDeleteForAdmin.do", new _47boardDeleteforAdmin());
        commandMap.put("/boardWriteForAdmin.do", new _48boardWriteForAdmin());
        commandMap.put("/showOneCategory.do", new _49ShowOneCategory());
    }

    protected void requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String view = null;
        CommandAction com;

        try {
            String command = request.getRequestURI();

            if (command.indexOf(request.getContextPath()) == 0) {
                command = command.substring(request.getContextPath().length());
            }

            com = (CommandAction) commandMap.get(command);
            view = com.requestPro(request, response);

            System.out.println("com = " + com);
            System.out.println("view = " + view);

        } catch (Throwable e) {
            e.printStackTrace();
        }
		
		/*
		 *	. 경로 : /MarketKurly_MVC2/index.do
		 *	. 이처럼 JSP페이지에서 경로마다 프로젝트명을 적어줘야 하는데 프로젝트명을 수정할 경우,
		 * 	    모든 페이지의 이름을 바꿔줘야하는 번거로움이 있다.	
		 * 	. 이를 위해 프로젝트명을 얻어올 수 있는 명령어(request.contextPath)를 통해 
			    변수에 저장하고, 이것을 재사용한다.
		 */
        String path = request.getContextPath();

        request.setAttribute("contextPath", path);
        //contents
        request.setAttribute("cont", view);

        // RequestDispatcher dispatcher = request.getRequestDispatcher("/00_index.jsp");
        // dispatcher.forward(request, response);
        request.getRequestDispatcher("/00_index.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        requestPro(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        requestPro(request, response);
    }

}
