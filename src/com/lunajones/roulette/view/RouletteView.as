package com.lunajones.roulette.view
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	[Embed('../../../../source/roulette_asset.swf', symbol='Roulette')]
	public class RouletteView extends Sprite
	{
		
		
		public function RouletteView()
		{
			super();
		}
		
		public function main():void{
			this.x = 227;
			this.y = -336;
			
		}
	}
}