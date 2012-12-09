package {
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	import flash.utils.ByteArray;
	import flash.media.SoundMixer;

	public class Equalizer{
		
		private const SOUND_VALUES_LENGTH = 256;
		private var sound:Sound = new Sound();
		private var channel:SoundChannel;

		/**
		 *  コンストラクタ：ファイルのセット
		 * @param soundFileURL サウンドのファイル名
		 */
		public function Equalizer(soundFileURL:String){
			sound.load(new URLRequest(soundFileURL));
		}

		/**
		 *  現在のフレームでなっている音の情報を配列で取得
		 * イコライザとして使うには毎フレームごとに呼び出す必要がある
		 * @return soundValues 音の情報の配列(Float)が入ってる
		 */
		public function getSoundValues():Array{
			var bytes:ByteArray = new ByteArray();
			var soundValues:Array= new Array();
			SoundMixer.computeSpectrum(bytes,true,0);
			for (var i=0; i < SOUND_VALUES_LENGTH; i++){
				soundValues.push(bytes.readFloat());
			}
			return soundValues;
		}

		/**
		 * サウンドを再生する
		 */
		public function playSound():void{
			if (channel){
				channel.stop();
			}
			if (sound){
				//？
				channel = sound.play(0,99999);
			}
		}
		
		/**
		 * サウンドを停止する
		 */
		public function stopSound():void{
			if (channel){
				channel.stop();
			}
		}
	}

}