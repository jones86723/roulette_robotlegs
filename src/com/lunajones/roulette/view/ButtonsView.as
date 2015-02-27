package com.lunajones.roulette.view
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	[Embed('../../../../source/roulette_asset.swf', symbol='Buttons')]
	public class ButtonsView extends Sprite
	{
		
		public var startBtn:MovieClip;
		public var againBtn:MovieClip;
		public var doubleBtn:MovieClip;
		public var backBtn:MovieClip;
		public var clearBtn:MovieClip;
		
		public function ButtonsView()
		{
			super();
		}
		
		public function main():void{
			this.x = 611;
			this.y = 672;
			backBtn.alpha=0.5;
			doubleBtn.alpha=0.5;
			clearBtn.alpha=0.5;
			startBtn.alpha=0.5;
			againBtn.alpha = 0.5;
		}
	}
}