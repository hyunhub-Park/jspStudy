package co.kh.dev.student.control;

import co.kh.dev.student.action.Action;
import co.kh.dev.student.action.DeleteFormAction;
import co.kh.dev.student.action.DeleteProcAction;
import co.kh.dev.student.action.IdCheckAction;
import co.kh.dev.student.action.IndexAction;
import co.kh.dev.student.action.LoginFormAction;
import co.kh.dev.student.action.LoginProcAction;
import co.kh.dev.student.action.LogoutAction;
import co.kh.dev.student.action.ModifyFormAction;
import co.kh.dev.student.action.ModifyProcAction;
import co.kh.dev.student.action.RegFormAction;
import co.kh.dev.student.action.RegProcAction;
import co.kh.dev.student.action.ZipCheckAction;

// 계속 사용해야하므로 싱글톤 방식 사용.
public class ActionFactory
{
	// 1. private 자기 참조변수.
	private static ActionFactory factory;

	// 2. getters.
	public static synchronized ActionFactory getInstance()
	{
		if (factory == null)
		{
			factory = new ActionFactory();
			
			/*this.factory = new ActionFactory(); static이므로 this(X).*/
		}
		return factory;
	}
	
	// 3. 생성자는 무조건 private. 외부에서 절대 new 할 수 없도록.
	private ActionFactory()
	{
	}
	
	public Action getAction(String cmd)
	{
		Action action = null;
		switch (cmd) {
		case "/index.do":
			action = new IndexAction();
			break;
		case "/regForm.do":
			action = new RegFormAction();
			break;
		case "/idCheck.do":
			action = new IdCheckAction();
			break;
		case "/zipCheck.do":
			action = new ZipCheckAction();
			break;
		case "/regProc.do":
			action = new RegProcAction();
			break;
		case "/login.do":
			action = new LoginFormAction();
			break;
		case "/loginProc.do":
			action = new LoginProcAction();
			break;
		case "/logout.do":
			action = new LogoutAction();
			break;
		case "/modifyForm.do":
			action = new ModifyFormAction();
			break;
		case "/modifyProc.do":
			action = new ModifyProcAction();
			break;
		case "/deleteForm.do":
			action = new DeleteFormAction();
			break;
		case "/deleteProc.do":
			action = new DeleteProcAction();
			break;
			
			
		default:
			action = new IndexAction();
			break;
		}
		return action;
	}
}