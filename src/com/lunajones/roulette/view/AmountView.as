package com.lunajones.roulette.view
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.text.TextField;
	
	[Embed('../../../../source/roulette_asset.swf', symbol='Amount')]
	public class AmountView extends Sprite
	{
		
		public var txt:TextField;
		
		public function AmountView()
		{
			super();
		}
		
		public function main():void{
			this.x = 455;
			this.y = 673;
			
		}
	}
}