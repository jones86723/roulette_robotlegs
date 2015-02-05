package com.lunajones.roulette.view
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	[Embed('../../../../source/roulette_asset.swf', symbol='Bet')]
	public class BetView extends Sprite
	{
		//設定原本flash命名好的元配名稱匹配
		public var zones:MovieClip;
		
		
		
		public function BetView()
		{
			super();
		}
		
		public function main():void{
			this.x = 0;
			this.y = 267;
			for (var i:uint = 0; i < zones.numChildren; i++)
				zones.getChildAt(i).visible = false;;
			
		}
	}
}