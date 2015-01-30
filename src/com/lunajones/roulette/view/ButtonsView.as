package com.lunajones.roulette.view
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	[Embed('../../../../source/roulette_asset.swf', symbol='Buttons')]
	public class ButtonsView extends Sprite
	{
		
		
		public function ButtonsView()
		{
			super();
		}
		
		public function main():void{
			this.x = 611;
			this.y = 672;
			
		}
	}
}