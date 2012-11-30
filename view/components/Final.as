package view.components {
	import com.muizz.IAnimatable;
	import com.muizz.TweenClips;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class Final extends MovieClip implements IAnimatable {
		
		public static const NEXT:String = "next";
		
		private var clips:Vector.<MovieClip>;
		private var continuer:MovieClip;
		private const TOTAL_CLIPS:int = 3;
		
		public function Final() {
			clips = new Vector.<MovieClip>();
			for(var i:int=0; i<TOTAL_CLIPS; i++){
				clips.push(this.getChildByName("clip" + i));
			}
			continuer = this.getChildByName("clip" + (TOTAL_CLIPS-1)) as MovieClip;
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