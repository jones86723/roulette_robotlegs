package com.lunajones.roulette.view
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	[Embed('../../../../source/roulette_asset.swf', symbol='Chips')]
	public class ChipsView extends Sprite
	{
		//設定原本flash命名好的元配名稱匹配
		public var chip_100:MovieClip;
		public var chip_50:MovieClip;
		public var chip_20:MovieClip;
		public var chip_10:MovieClip;
		public var chip_5:MovieClip;
		
		public function ChipsView()
		{
			super();
		}
		
		public function main():void{
			
			this.x = 19;
			this.y = 685;
			
			var chips:Array =[chip_5,chip_10,chip_20,chip_50,chip_100];
			
			for(var i:int=0;i<5;i++){
				chips[i].buttonMode = true;
			}
		}
		
	}
}