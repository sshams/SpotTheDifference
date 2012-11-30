package view.mediators {
	import flash.events.Event;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.components.Difference;
	
	public class DifferenceMediator extends Mediator implements IMediator {
		
		public static const NAME:String = "DifferenceMediator";
		
		public function DifferenceMediator(viewComponent:Object=null) {
			super(NAME, viewComponent);
			difference.addEventListener(Difference.STOP_TIMER, difference_stopTimerHandler);
			difference.addEventListener(Difference.NEXT, difference_nextHandler);
		}
		
		private function difference_stopTimerHandler(event:Event):void {
			facade.sendNotification(ApplicationFacade.STOP_TIMER);
		}
		
		private function difference_nextHandler(event:Event):void {
			facade.sendNotification(ApplicationFacade.SHOW_WIN);
		}
		
		public function get difference():Difference {
			return viewComponent as Difference;
		}
		
	}
}