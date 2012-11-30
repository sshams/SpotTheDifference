package view.components {
	import com.muizz.IAnimatable;
	import com.muizz.TweenClips;
	
	import fl.transitions.Tween;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class Pack extends MovieClip implements IAnimatable {
		
		private var objects:Vector.<MovieClip>;
		private static var TOTAL_OBJECTS:int = 2;
		
		public static const NEXT:String = "next";
		
		public function Pack() {
			objects = new Vector.<MovieClip>();
			for(var i:int=0; i<TOTAL_OBJECTS; i++){
				objects.push(this.getChildByName("object" + i));
			}
			
			var continuer:MovieClip = this.getChildByName("object1") as MovieClip;
			continuer.buttonMode = true;
			continuer.addEventListener(MouseEvent.MOUSE_DOWN, continuer_mouseDownHandler);
		}
		
		public function animateIn():void {
			TweenClips.from(objects, .5, {y:String(10), alpha:0});
		}
		
		public function animateIn_completeHandler():void {
		}
		
		public function animateOut():void {
			TweenClips.to(objects, .5, {y:String(-10), alpha:0}, animateOut_completeHandler);
		}
		
		public function animateOut_completeHandler():void {
			dispatchEvent(new Event(NEXT));
		}
		
		public function reset():void {
			TweenClips.to(objects, .1, {y:String(10), alpha:1});
		}
		
		private function continuer_mouseDownHandler(event:MouseEvent):void {
			new Nice().play();
			animateOut();
		}
	}
}