package com.lunajones.roulette.view
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	[Embed('../../../../source/roulette_asset.swf', symbol='Bet')]
	public class BetView extends Sprite
	{
		
		
		public function BetView()
		{
			super();
		}
		
		public function main():void{
			this.x = 0;
			this.y = 267;
			
		}
	}
}