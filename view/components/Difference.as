package view.components {
	import com.greensock.TweenMax;
	import com.muizz.IAnimatable;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	public class Difference extends MovieClip implements IAnimatable {
		
		private var differences:Vector.<MovieClip>;
		private var hotspots:Vector.<MovieClip>;
		private var shield:MovieClip; //to hide hotspots temporarily
		private var total:int = 0;
		private const TOTAL_DIFFERENCES:int = 7;
		
		public static const STOP_TIMER:String = "stopTimer";
		public static const NEXT:String = "next";
		
		public function Difference() {
			differences = new Vector.<MovieClip>();
			hotspots = new Vector.<MovieClip>();
			shield = this.getChildByName("_shield") as MovieClip;
			hideShield();
			
			for(var i:int=0; i<TOTAL_DIFFERENCES; i++){
				differences.push(this.getChildByName("difference" + i));
				hotspots.push(this.getChildByName("hotspot_" + i));
				
				differences[i].alpha = 0; 
				hotspots[i].alpha = 0;
			}
			enableHotspots();
		}
		
		public function animateIn():void {
			TweenMax.from(this, 1, {alpha:0});
		}
		
		public function animateIn_completeHandler():void {
		}
		
		public function animateOut():void {
		}
		
		public function animateOut_completeHandler():void {
		}
		
		public function reset():void {
			total = 0;
			enableHotspots();
		}
		
		private function hotspots_mouseDownHandler(event:MouseEvent):void {
			new Energy().play();
			
			var index:int = String(event.target.name).split("_")[1];
			
			TweenMax.to(differences[index], .5, {alpha:1, onStart:showShield});
			TweenMax.to(differences[index], 1, {alpha:0, delay:3.5, onComplete:hideShield});
			
			event.target.removeEventListener(MouseEvent.MOUSE_DOWN, hotspots_mouseDownHandler);
			event.target.buttonMode = false;
			
			total++;
			TextField(differences[index].index).text = String(total);
			if(total == TOTAL_DIFFERENCES) {
				dispatchEvent(new Event(STOP_TIMER));
			}
		}
		
		private function enableHotspots():void {
			for(var i:int=0; i<TOTAL_DIFFERENCES; i++){
				hotspots[i].buttonMode = true;
				hotspots[i].addEventListener(MouseEvent.MOUSE_DOWN, hotspots_mouseDownHandler);
			}			
		}
		
		private function showShield():void {
			shield.visible = true;
		}
		
		private function hideShield():void {
			shield.visible = false;
			if(total == TOTAL_DIFFERENCES) {
				dispatchEvent(new Event(NEXT));
			}
		}
		
	}
}