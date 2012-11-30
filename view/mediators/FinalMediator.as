package view.mediators {
	import flash.events.Event;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.components.Final;
	
	public class FinalMediator extends Mediator implements IMediator {
		
		public static const NAME:String = "FinalMediator";
		
		public function FinalMediator(viewComponent:Object=null) {
			super(NAME, viewComponent);
			final.addEventListener(Final.NEXT, final_nextHandler);
		}
		
		private function final_nextHandler(event:Event):void {
			facade.sendNotification(ApplicationFacade.SHOW_INTRO);
		}
		
		public function get final():Final {
			return viewComponent as Final;
		}
	}
}