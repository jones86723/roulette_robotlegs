package com.lunajones.roulette.view
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	[Embed('../../../../source/roulette_asset.swf', symbol='Bet')]
	public class BetView extends Sprite
	{
		//設定原本flash命名好的元配名稱匹配
		public var zones:MovieClip;
		public var bets:MovieClip;
		
		
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
		
		public function removeAllBet():void{
			var num:int = this.bets.numChildren;
			for (var i:uint = 0; i < num; i++)
			{
				//trace(i);
				//if(this.getChildAt(i)!=zones){
					this.bets.removeChildAt(0);
				//}
			}	
		}
	}
}