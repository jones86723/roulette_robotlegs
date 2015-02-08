package com.lunajones.roulette.view
{
	import com.lunajones.roulette.model.GameModel;
	import com.lunajones.roulette.model.event.GameEvent;
	import com.lunajones.roulette.view.ChipsView;
	import com.lunajones.roulette.view.event.ChipEvent;
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	import org.robotlegs.mvcs.Mediator;
	
	
	public class ChipsViewMediator extends Mediator
	{
		[Inject]
		public var view:ChipsView;
		
		[Inject]
		public var model:GameModel;
			
		public function ChipsViewMediator()
		{
			super();
		}
		
		override public function onRegister():void{
			view.main();
			eventMap.mapListener(view.chip_5, MouseEvent.MOUSE_DOWN, onmousedownchip);
			eventMap.mapListener(view.chip_10, MouseEvent.MOUSE_DOWN, onmousedownchip);
			eventMap.mapListener(view.chip_20, MouseEvent.MOUSE_DOWN, onmousedownchip);
			eventMap.mapListener(view.chip_50, MouseEvent.MOUSE_DOWN, onmousedownchip);
			eventMap.mapListener(view.chip_100, MouseEvent.MOUSE_DOWN, onmousedownchip);
			
			eventMap.mapListener(eventDispatcher,GameEvent.CHANGE,onchange);
			eventMap.mapListener(eventDispatcher,GameEvent.GET_RESULT,ongetresult);
		}
		
		private function onchange(e:GameEvent):void{
			if(model.chooseChip==0){
				enabledChip();
			}	
		}
		
		private function ongetresult(e:GameEvent):void{
			enabledChip();
		}
		
		private function onmousedownchip(e:MouseEvent):void{
			dispatch(new ChipEvent(ChipEvent.CHOOSE_CHIP,e.target.name));
			eventMap.mapListener(contextView, MouseEvent.MOUSE_MOVE, onmousemovechip);
			eventMap.mapListener(contextView, MouseEvent.MOUSE_UP, onmouseupchip);
		}
		
		private function onmouseupchip(e:MouseEvent):void{
			if(model.chooseChip && model.chooseBetZone){
				eventMap.unmapListener(contextView, MouseEvent.MOUSE_MOVE, onmousemovechip);
				dispatch(new ChipEvent(ChipEvent.CHOOSE_BET,null));
				model.addWager();
				setOnly();
				
			}
		}
		
		private function onmousemovechip(e:MouseEvent):void{
			dispatch(new ChipEvent(ChipEvent.DRAG_MOVE,null));
		}
		
		//設定成唯一選擇的籌碼
		private function setOnly():void{
			for(var i:uint=0 ; i<view.numChildren;i++){
				var chip:MovieClip = view.getChildAt(i) as MovieClip;
				if(view.getChildAt(i) != view.getChildByName("chip_"+model.chooseChip)){
					eventMap.unmapListener(chip, MouseEvent.MOUSE_DOWN, onmousedownchip);
					chip.alpha = 0.5;
				}
			}
		}
		
		private function enabledChip():void{
			for(var i:uint=0 ; i<view.numChildren;i++){
				var chip:MovieClip = view.getChildAt(i) as MovieClip;
				eventMap.mapListener(chip, MouseEvent.MOUSE_DOWN, onmousedownchip);
				chip.alpha = 1;
			}
		}
		
		
	}
}