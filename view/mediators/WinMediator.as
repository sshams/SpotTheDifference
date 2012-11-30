package view.mediators {
	import flash.events.Event;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.components.Win;
	
	public class WinMediator extends Mediator implements IMediator {
		
		public static const NAME:String = "WinMediator";
		
		public function WinMediator(viewComponent:Object=null) {
			super(NAME, viewComponent);
			win.addEventListener(Win.NEXT, win_nextHandler);
		}
		
		private function win_nextHandler(event:Event):void {
			facade.sendNotification(ApplicationFacade.SHOW_FINAL);
		}
		
		public function get win():Win {
			return viewComponent as Win;
		}
		
	}
}