package com.lunajones.roulette.view
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.text.TextField;
	
	[Embed('../../../../source/roulette_asset.swf', symbol='Wager')]
	public class WagerView extends Sprite
	{
		
		public var txt:TextField;
		
		public function WagerView()
		{
			super();
		}
		
		public function main():void{
			this.x = 693;
			this.y = 217;
			
		}
	}
}