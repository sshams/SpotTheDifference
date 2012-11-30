package view.components {
	import com.greensock.TweenMax;
	import com.muizz.IAnimatable;
	import com.muizz.TweenClips;
	
	import fl.transitions.Tween;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class Intro extends MovieClip implements IAnimatable {
		
		private const TOTAL_OBJECTS:int = 3;
		private var objects:Vector.<MovieClip>;
		private var isAnimating:Boolean = false;
		
		public static const NEXT:String = "next";
		
		public function Intro() {
			objects = new Vector.<MovieClip>();
			
			for(var i:int=0; i<TOTAL_OBJECTS; i++){
				objects.push(this.getChildByName("objects" + i));	
			}
			
			this.buttonMode = true;
			this.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
		}
		
		public function animateIn():void {
			isAnimating = true;
			TweenClips.from(objects, .5, {y:String(20), alpha:0}, animateIn_completeHandler);
		}
		
		public function animateIn_completeHandler():void {
			isAnimating = false;
		}
		
		public function animateOut():void {
			TweenClips.to(objects, .5, {y:String(-10), alpha:0}, animateOut_completeHandler);
		}
		
		public function animateOut_completeHandler():void {
			dispatchEvent(new Event(NEXT));
		}
		
		public function reset():void {
			TweenClips.to(objects, 0, {y:String(10), alpha:1});
		}
		
		private function mouseDownHandler(event:MouseEvent):void {
			if(!isAnimating){
				new Nice().play();
				animateOut();
			}
		}
	}
}