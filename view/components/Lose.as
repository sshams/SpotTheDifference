package view.components {
	import com.muizz.IAnimatable;
	import com.muizz.TweenClips;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class Lose extends MovieClip implements IAnimatable {
		
		public static const NEXT:String = "next";
		
		private var text:MovieClip;
		private var continuer:MovieClip;
		private var clips:Vector.<MovieClip>;
		
		public function Lose() {
			text = this.getChildByName("_text") as MovieClip;
			continuer = this.getChildByName("_continuer") as MovieClip;
			
			clips = new Vector.<MovieClip>();
			clips.push(text, continuer);
			
			continuer.addEventListener(MouseEvent.MOUSE_DOWN, continuer_mouseDownHandler);
			continuer.buttonMode = true;
		}
		
		public function animateIn():void {
			TweenClips.from(clips, .5, {y:String(10), alpha:0});
		}
		
		public function animateIn_completeHandler():void {
		}
		
		public function animateOut():void {
		}
		
		public function animateOut_completeHandler():void {
		}
		
		public function reset():void {
		}
		
		private function continuer_mouseDownHandler(event:MouseEvent):void {
			new Nice().play();
			dispatchEvent(new Event(NEXT));
		}
	}
}