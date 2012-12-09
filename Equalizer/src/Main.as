package {
	import flash.display.Sprite;
	import flash.events.Event;
	import fl.motion.easing.Back;
	import flash.display.MovieClip;
	import flash.geom.Point;
	import flash.events.MouseEvent;

	public class Main extends Sprite {
		private static  const SOUND_DIR:String = "../sounds/";
		private static  const SOUND_FILE:String = "tamco08-s.mp3";
		private static  const ACCEPTABLE:Number = 0.8;//音源許容値
		private static  const SIZE_ADJUSTMENT:Number = 50;//サイズ調整

		private static  var equalizer:Equalizer;
		private static  var startPos:Point;

		public function Main() {
			//出現位置
			startPos = new Point(550 / 2,220);//仮
			//背景
			stage.addChild(new BackMC());
			//イコライザ
			equalizer = new Equalizer(SOUND_DIR + SOUND_FILE);
			equalizer.playSound();
			stage.addEventListener(Event.ENTER_FRAME, doEnterFrameAction);
			stage.addEventListener(MouseEvent.CLICK, doMouseClickAction);
		}

		/**
		 * 音にあわせて画像を出現させる
		 * @param e
		 */
		private function doEnterFrameAction(event:Event):void {
			var soundValues = equalizer.getSoundValues();
			for (var i=0; i<soundValues.length; i++) {
				if (soundValues[i] > ACCEPTABLE) {
					var tama = new Tama(new OtodamaMC(), startPos.x,startPos.y,Math.random()*SIZE_ADJUSTMENT);
					tama.blendMode = "screen";
					stage.addChild(tama);
				}
			}
		}

		/**
		* クリックで出現位置を変える
		*/
		private function doMouseClickAction(e:MouseEvent):void {
			startPos.x = stage.mouseX;
			startPos.y = stage.mouseY;
		}

	}
}
