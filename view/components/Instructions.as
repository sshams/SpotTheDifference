package view.components {
	import com.muizz.IAnimatable;
	import com.muizz.TweenClips;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class Instructions extends MovieClip implements IAnimatable {
		
		private var clips:Vector.<MovieClip>;
		private const TOTAL_CLIPS:int = 5;
		
		public static const NEXT:String = "next";
		
		public function Instructions() {
			clips = new Vector.<MovieClip>();
			for(var i:int=0; i<TOTAL_CLIPS; i++){
				clips.push(this.getChildByName("clip" + i));
			}
			
			var demarrez:MovieClip = this.getChildByName("clip" + (TOTAL_CLIPS-1)) as MovieClip;
			demarrez.buttonMode = true;
			demarrez.addEventListener(MouseEvent.MOUSE_DOWN, demarrez_mouseDownHandler);
		}
		
		public function animateIn():void {
			TweenClips.from(clips, .5, {y:String(10), alpha:0});
		}
		
		public function animateIn_completeHandler():void {
		}
		
		public function animateOut():void {
			TweenClips.to(clips, .5, {y:String(-10), alpha:0}, animateOut_completeHandler);
		}
		
		public function animateOut_completeHandler():void {
			dispatchEvent(new Event(NEXT));
		}
		
		public function reset():void {
			TweenClips.to(clips, .1, {y:String(10), alpha:1});
		}
		
		private function demarrez_mouseDownHandler(event:MouseEvent):void {
			new Nice().play();
			animateOut();
		}
	}
}