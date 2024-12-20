package co.kh.dev.mvc.control;

import co.kh.dev.mvc.action.Action;
import co.kh.dev.mvc.action.indexAction;

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
		if (cmd.equals("/index.do"))
		{
			action = new indexAction();
		}
		return action;
	}
	
	

}
