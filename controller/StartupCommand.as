package controller {
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import view.mediators.ClockMediator;
	import view.mediators.DifferenceMediator;
	import view.mediators.FinalMediator;
	import view.mediators.InstructionsMediator;
	import view.mediators.IntroMediator;
	import view.mediators.LoseMediator;
	import view.mediators.PackMediator;
	import view.mediators.SpotTheDifferenceMediator;
	import view.mediators.WinMediator;
	
	public class StartupCommand extends SimpleCommand {
		
		override public function execute(notification:INotification):void {
			var app:SpotTheDifference = notification.getBody() as SpotTheDifference;
		
			facade.registerMediator(new SpotTheDifferenceMediator(app));
			facade.registerMediator(new IntroMediator(app.intro));
			facade.registerMediator(new PackMediator(app.pack));
			facade.registerMediator(new InstructionsMediator(app.instructions));
			facade.registerMediator(new DifferenceMediator(app.difference));
			facade.registerMediator(new ClockMediator(app.clock));
			facade.registerMediator(new WinMediator(app.win));
			facade.registerMediator(new LoseMediator(app.lose));
			facade.registerMediator(new FinalMediator(app.final));
		}
	}
}