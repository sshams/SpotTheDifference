package {
	import controller.StartupCommand;
	
	import org.puremvc.as3.interfaces.IFacade;
	import org.puremvc.as3.patterns.facade.Facade;
	
	public class ApplicationFacade extends Facade implements IFacade {
		
		public static const STARTUP:String = "startup";
		public static const SHOW_PACK:String = "showPack";
		public static const SHOW_INSTRUCTIONS:String = "showInstructions";
		public static const SHOW_DIFFERENCE:String = "showDifference";
		public static const SHOW_WIN:String = "showWin";
		public static const SHOW_LOSE:String = "showLose";
		public static const SHOW_FINAL:String = "showFinal";
		public static const SHOW_INTRO:String = "showIntro";
		public static const STOP_TIMER:String = "stopTimer";
		
		public static function getInstance():ApplicationFacade {
			if(instance == null){
				instance = new ApplicationFacade();
			}
			return instance as ApplicationFacade;
		}
		
		override protected function initializeController():void {
			super.initializeController();
			registerCommand(STARTUP, StartupCommand);
		}
		
		public function start(app:SpotTheDifference):void {
			sendNotification(STARTUP, app);
		}
		
	}
	
}