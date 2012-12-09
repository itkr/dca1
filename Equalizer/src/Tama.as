package 
{

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.ui.Keyboard;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.display.Loader;
	import flash.display.MovieClip;

	public class Tama extends MovieClip
	{
		private const SPEED_ADJUSTMENT:Number = 5;//スピード調整
		private const ALPHA_ADJUSTMENT:Number = 0.04;//アルファ調整

		private var _otodama:MovieClip;
		private var toX:Number;
		private var toY:Number;
		private var _x:int;
		private var _y:int;
		private var _color:int;
		private var _size:Number;

		/**
		 * コンストラクタ：値・イベント・グラフィックのセット
		 * @param startX 図形の横軸のスタート位置
		 * @param startY 図形の縦軸のスタート位置
		 * @param size 図形のサイズ
		 * @param color 図形の色
		 */
		public function Tama(tama:MovieClip, startX:int=0, startY:int=0, size:int=10, color:int=0xFFCC00)
		{
			this._otodama = tama;
			this._otodama.width = size;
			this._otodama.height = size;
			this._otodama.x = startX - _otodama.width / 2;
			this._otodama.y = startY - _otodama.height / 2;
			this.addChild(_otodama);
			toX = Math.random() - Math.random();
			toY = Math.random() - Math.random();
			toX = toX * SPEED_ADJUSTMENT;
			toY = toY * SPEED_ADJUSTMENT;
			this._x = startX - _otodama.width / 2;
			this._y = startY - _otodama.height / 2;
			this._color = color;
			this._size = size;
			addEventListener(Event.ENTER_FRAME, drawing);
		}

		/**
		 * 毎フレームごとに図形変化の処理をする
		 * @param e イベント
		 */
		private function drawing(e:Event):void
		{
			_x +=  toX;
			_y +=  toY;
			_otodama.x = _x;
			_otodama.y = _y;
			_otodama.alpha = _otodama.alpha - ALPHA_ADJUSTMENT;
			if (_otodama.alpha <= 0)
			{
				clearThis();
			}
		}

		/**
		 * 余分なオブジェクトとかを削除するよ
		 */
		private function clearThis():void
		{
			removeEventListener(Event.ENTER_FRAME, drawing);
			this.removeChild(_otodama);
			_otodama = null;
			parent.removeChild(this);
		}

		//////////////////////////////////////////////////////
		//
		// accsesser
		//
		//////////////////////////////////////////////////////

		/**
		 * @param color
		 */
		public function set color(color:int):void
		{
			this._color = color;
		}

		/**
		 * @return color
		 */
		public function get color():int
		{
			return _color;
		}

		/**
		 * @param size
		 */
		public function set size(size:Number):void
		{
			this._size = size;
		}

		/**
		 * @return size
		 */
		public function get size():Number
		{
			return _size;
		}

	}

}