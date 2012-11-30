package view.components {
	import com.muizz.IAnimatable;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.Timer;
	
	public class Clock extends MovieClip implements IAnimatable {
		
		public static const TIME_OVER:String = "timeOver";
		
		private var timer:Timer;
		private var clock:MovieClip;
		private var time:TextField;
		private var textFormat:TextFormat;
		private var counter:int = 120;
		
		public function Clock(){
			clock = this.getChildByName("_clock") as MovieClip;
			time = clock.getChildByName("_time") as TextField;
			timer = new Timer(1000);
			timer.addEventListener(TimerEvent.TIMER, timer_timerHandler);
			
			textFormat = time.getTextFormat();
		}
		
		public function animateIn():void {
			timer.start();
		}
		
		public function animateIn_completeHandler():void {
		}
		
		public function animateOut():void {
		}
		
		public function animateOut_completeHandler():void {
		}
		
		public function stopTimer():void {
			timer.stop();
		}
		
		public function reset():void {
			timer.reset();
			counter = 120;
			time.text = "2:00";
			time.setTextFormat(textFormat);
		}
		
		private function timer_timerHandler(event:TimerEvent):void {
			counter--;
			
			var minutes:int = counter / 60;
			var seconds:int = counter % 60;
			
			time.text = minutes + ":" + ((seconds < 10) ? "0" + seconds : seconds);
			
			time.setTextFormat(textFormat);
			
			if(minutes == 0 && seconds == 0){
				timer.stop();
				dispatchEvent(new Event(TIME_OVER));
			}
			
		}

	}
}