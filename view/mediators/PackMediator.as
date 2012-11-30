package view.mediators {
	import flash.events.Event;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.components.Pack;
	
	public class PackMediator extends Mediator implements IMediator {
		
		public static const NAME:String = "PackMediator";
		
		public function PackMediator(viewComponent:Object=null) {
			super(NAME, viewComponent);
			pack.addEventListener(Pack.NEXT, pack_nextHandler);
		}
		
		private function pack_nextHandler(event:Event):void {
			facade.sendNotification(ApplicationFacade.SHOW_INSTRUCTIONS);
		}
		
		public function get pack():Pack {
			return viewComponent as Pack;
		}
		
	}
}