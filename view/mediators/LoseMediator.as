package view.mediators {
	import flash.events.Event;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.patterns.mediator.Mediator;
	import view.components.Lose;
	
	public class LoseMediator extends Mediator implements IMediator {
		
		public static const NAME:String = "LoseMediator";
		
		public function LoseMediator(viewComponent:Object=null) {
			super(NAME, viewComponent);
			lose.addEventListener(Lose.NEXT, lose_nextHandler);
		}
		
		private function lose_nextHandler(event:Event):void {
			trace('lose next');
			facade.sendNotification(ApplicationFacade.SHOW_FINAL);
		}
		
		public function get lose():Lose {
			return viewComponent as Lose;
		}
		
	}
}