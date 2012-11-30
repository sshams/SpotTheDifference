package view.mediators {
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	public class SpotTheDifferenceMediator extends Mediator implements IMediator {
		
		public static const NAME:String = "SpotTheDifferenceMediator";
		
		public function SpotTheDifferenceMediator(viewComponent:Object=null) {
			super(NAME, viewComponent);
		}
		
		override public function listNotificationInterests():Array {
			return [
				ApplicationFacade.SHOW_PACK,
				ApplicationFacade.SHOW_INSTRUCTIONS,
				ApplicationFacade.SHOW_DIFFERENCE,
				ApplicationFacade.SHOW_WIN,
				ApplicationFacade.SHOW_LOSE,
				ApplicationFacade.SHOW_FINAL,
				ApplicationFacade.SHOW_INTRO
			];
		}
		
		override public function handleNotification(notification:INotification):void {
			switch(notification.getName()){
				case ApplicationFacade.SHOW_PACK:
					spotTheDifference.removeIntro();
					spotTheDifference.addPack();
					break;
				case ApplicationFacade.SHOW_INSTRUCTIONS:
					spotTheDifference.removePack();
					spotTheDifference.addInstructions();
					break;
				case ApplicationFacade.SHOW_DIFFERENCE:
					spotTheDifference.removeInstructions();
					spotTheDifference.addDifference();
					spotTheDifference.addClock();
					break;
				case ApplicationFacade.SHOW_WIN:
					spotTheDifference.removeDifference();
					spotTheDifference.removeClock();
					spotTheDifference.addWin();
					break;
				case ApplicationFacade.SHOW_LOSE:
					spotTheDifference.removeDifference();
					spotTheDifference.removeClock();
					spotTheDifference.addLose();
					break;
				case ApplicationFacade.SHOW_FINAL:
					spotTheDifference.removeWin();
					spotTheDifference.removeLose();
					spotTheDifference.addFinal();
					break;
				case ApplicationFacade.SHOW_INTRO:
					spotTheDifference.removeFinal();
					spotTheDifference.addIntro();
					break;
			}
		}
		
		public function get spotTheDifference():SpotTheDifference {
			return viewComponent as SpotTheDifference;
		}
		
	}
}