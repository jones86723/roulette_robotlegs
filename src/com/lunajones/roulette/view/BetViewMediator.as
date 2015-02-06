package com.lunajones.roulette.view
{
	import com.lunajones.roulette.model.GameModel;
	import com.lunajones.roulette.model.event.GameEvent;
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
		
		
		[Inject]
		public var gameModel:GameModel;
		
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
		private var chooseClass:Class;
		
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
			eventMap.mapListener(eventDispatcher,ChipEvent.CHOOSE_BET,onchoosebet);
			
			eventMap.mapListener(eventDispatcher,GameEvent.CHANGE,onchange);
		}
		private function onchange(e:GameEvent):void{
			view.removeAllBet()
			var wagerhistory:Array = gameModel.wagerHistory;
			var choosechip:int = gameModel.chooseChip;
			for(var i:int = 0; i<wagerhistory.length;i++){
				var mc:MovieClip= new chooseClass() as MovieClip;
				var bet:MovieClip = view.zones.getChildByName(wagerhistory[i].bet) as MovieClip;
				mc.x = bet.x;
				mc.y = bet.y;
				mc.scaleX = 0.5;
				mc.scaleY = 0.5;
				view.bets.addChild(mc);
			}
			gameModel.chooseBetZone = "";
		}
		private function onchoosechip(e:ChipEvent):void{
			
			var mc:MovieClip;
			switch(e.data){
				case "chip_5":
						//mc= new Chip5() as MovieClip;
						chooseClass = Chip5; 
						gameModel.chooseChip = 5;
					break;
				case "chip_10":
						//mc= new Chip10() as MovieClip;
						gameModel.chooseChip = 10;
						chooseClass = Chip10; 
					break;
				case "chip_20":
						//mc= new Chip20() as MovieClip;
						gameModel.chooseChip = 20;
						chooseClass = Chip20; 
					break;
				case "chip_50":
						//mc= new Chip50() as MovieClip;
						gameModel.chooseChip = 50;
						chooseClass = Chip50; 
					break;
				case "chip_100":
						//mc= new Chip100() as MovieClip;
						gameModel.chooseChip = 100;
						chooseClass = Chip100; 
					break;
			}
			mc= new chooseClass() as MovieClip;
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
		
		private function onchoosebet(e:ChipEvent):void{
		
			//var mc:MovieClip = view.zones.getChildByName(gameModel.chooseBetZone) as MovieClip;
			view.removeChild(dragMc);
			
			
		}
		
		private function ondragmove(e:ChipEvent):void{
			dragMc.x = view.mouseX;
			dragMc.y = view.mouseY;
			var isChoose:Boolean = false;
			for (var i:uint = 0; i < view.zones.numChildren; i++){
				var betMc:MovieClip = view.zones.getChildAt(i) as MovieClip;
				if(dragMc.hitTestObject(betMc) && !isChoose){
					isChoose = true;
					betMc.visible = true;
					gameModel.chooseBetZone = betMc.name;
					
				}else{
					betMc.visible = false;
				}
			}
			if(!isChoose)gameModel.chooseBetZone = "";
		}
	}
}