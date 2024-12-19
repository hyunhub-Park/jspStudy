//package co.kh.board.action;
//
//import java.io.IOException;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import co.kh.board.control.ActionForward;
//
//public interface CommandAction
//{
//	public interface Action
//	{
//		// 추상메소드.
//		public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException;
//
//	}
//}


package co.kh.board.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.kh.board.control.ActionForward;


public interface CommandAction {
	//추상메소드
		public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
				throws IOException;

}

