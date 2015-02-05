package com.lunajones.roulette.view
{
	import com.lunajones.roulette.view.BetView;
	import com.lunajones.roulette.view.event.ChipEvent;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class BetViewMediator extends Mediator
	{
		[Inject]
		public var view:BetView;
		
		//bug記錄:需要在Chip10用２個影格,他才能變辯識MovieClip
		[Embed(source='../../../../source/roulette_asset.swf', symbol='Chip5')]
		private var Chip5:Class;
		
		[Embed(source='../../../../source/roulette_asset.swf', symbol='Chip10')]
		private var Chip10:Class;
		
		[Embed(source='../../../../source/roulette_asset.swf', symbol='Chip20')]
		private var Chip20:Class;
		
		[Embed(source='../../../../source/roulette_asset.swf', symbol='Chip50')]
		private var Chip50:Class;
		
		[Embed(source='../../../../source/roulette_asset.swf', symbol='Chip100')]
		private var Chip100:Class;
		
		private var dragMc:MovieClip;
		
		public function BetViewMediator()
		{
			super();	
		}
		
		override public function onRegister():void{
			view.main();
			//trace()
			var ary:Array = getChildrenOf(view.zones);
			for(var i:int=0 ;i<ary.length;i++ ){
				trace(ary[i].name)
			}
			//trace(ary);
			eventMap.mapListener(eventDispatcher,ChipEvent.DRAG_MOVE,ondragmove);
			eventMap.mapListener(eventDispatcher,ChipEvent.CHOOSE_CHIP,onchoosechip);
		}
		
		private function onchoosechip(e:ChipEvent):void{
			
			var mc:MovieClip;
			switch(e.data){
				case "chip_5":
						mc= new Chip5() as MovieClip;
					break;
				case "chip_10":
						mc= new Chip10() as MovieClip;
					break;
				case "chip_20":
						mc= new Chip20() as MovieClip;
					break;
				case "chip_50":
						mc= new Chip50() as MovieClip;
					break;
				case "chip_100":
						mc= new Chip100() as MovieClip;
					break;
			}
			dragMc = mc;
			mc.scaleX = 0.5;
			mc.scaleY = 0.5;
			mc.x = view.mouseX;
			mc.y = view.mouseY;
			view.addChild(mc);
			//trace(mc);
		}
		
		private function getChildrenOf(target:DisplayObjectContainer):Array
		{
			var children:Array = [];
			
			for (var i:uint = 0; i < target.numChildren; i++)
				children.push(target.getChildAt(i));
			
			return children;
		}
		
		private function ondragmove(e:ChipEvent):void{
			dragMc.x = view.mouseX;
			dragMc.y = view.mouseY;
			for (var i:uint = 0; i < view.zones.numChildren; i++){
				var mc:MovieClip = view.zones.getChildAt(i) as MovieClip;
				var r:Rectangle = new Rectangle(mc.x+20,mc.y,mc.width,mc.height);
				if(r.contains(view.mouseX,view.mouseY)){
					mc.visible = true;
				}else{
					mc.visible = false;
				}
			}
		}
	}
}