package com.lunajones.roulette.view
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	[Embed('../../../../source/roulette_asset.swf', symbol='Amount')]
	public class AmountView extends Sprite
	{
		
		
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