package com.lunajones.roulette.view
{
	import flash.display.MovieClip;
//	import flash.display.Sprite;
	import flash.text.TextField;
	 
	
	//public static const BULLET_CHECK:Class;
	
	[Embed('../../../../source/bet.swf', symbol='Bet')]
	public class BetView extends MovieClip
	{
		
		//[Embed('../../../../source/bet.swf', symbol='Bet')]
		//private var QQ:Class;
		
		public function BetView()
		{
			super();
		}
		
		public function main():void{
			this.x = 10;
			this.y = 300;
			
			
			//var qqq:Sprite = new QQ() as Sprite;
			//addChild(qqq);
			
			
			//initializeView();
		}
	}
}