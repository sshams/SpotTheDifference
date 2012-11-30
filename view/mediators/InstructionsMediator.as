package view.mediators {
	import flash.events.Event;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.components.Instructions;
	
	public class InstructionsMediator extends Mediator implements IMediator {
		
		public static const NAME:String = "InstructionsMediator";
		
		public function InstructionsMediator(viewComponent:Object=null) {
			super(NAME, viewComponent);
			instructions.addEventListener(Instructions.NEXT, instructions_nextHandler);
		}
		
		private function instructions_nextHandler(event:Event):void {
			facade.sendNotification(ApplicationFacade.SHOW_DIFFERENCE);
		}
		
		public function get instructions():Instructions {
			return viewComponent as Instructions;
		}
	}
}