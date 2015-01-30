package com.lunajones.roulette.view
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	[Embed('../../../../source/roulette_asset.swf', symbol='History')]
	public class HistoryView extends Sprite
	{
		
		
		public function HistoryView()
		{
			super();
		}
		
		public function main():void{
			this.x = 35;
			this.y = 13;
			
		}
	}
}