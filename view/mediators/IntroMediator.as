package view.mediators {
	import flash.events.Event;
	
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.components.Intro;
	
	public class IntroMediator extends Mediator {
		
		public static const NAME:String = "IntroMediator";
		
		public function IntroMediator(viewComponent:Object=null) {
			super(NAME, viewComponent);
			intro.addEventListener(Intro.NEXT, intro_nextHandler);
		}
		
		private function intro_nextHandler(event:Event):void {
			facade.sendNotification(ApplicationFacade.SHOW_PACK);
		}
		
		public function get intro():Intro {
			return viewComponent as Intro;
		}
	}
}