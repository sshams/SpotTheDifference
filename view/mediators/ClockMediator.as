package view.mediators {
	import flash.events.Event;
	import flash.profiler.showRedrawRegions;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.components.Clock;
	
	public class ClockMediator extends Mediator implements IMediator {
		
		public static const NAME:String = "ClockMediator";
		
		public function ClockMediator(viewComponent:Object=null) {
			super(NAME, viewComponent);
			clock.addEventListener(Clock.TIME_OVER, clock_timeOverHandler);
		}
		
		private function clock_timeOverHandler(event:Event):void {
			facade.sendNotification(ApplicationFacade.SHOW_LOSE);
		}
		
		override public function listNotificationInterests():Array {
			return [ApplicationFacade.STOP_TIMER];
		}
		
		override public function handleNotification(notification:INotification):void {
			switch(notification.getName()){
				case ApplicationFacade.STOP_TIMER:
					clock.stopTimer();
					break;
			}
		}
		
		public function get clock():Clock {
			return viewComponent as Clock;
		}
	}
}