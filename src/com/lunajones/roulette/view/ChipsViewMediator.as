package com.lunajones.roulette.view
{
	import com.lunajones.roulette.model.GameModel;
	import com.lunajones.roulette.view.ChipsView;
	import com.lunajones.roulette.view.event.ChipEvent;
	
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
			eventMap.mapListener(contextView, MouseEvent.MOUSE_UP, onmouseupchip);
			eventMap.mapListener(contextView, MouseEvent.MOUSE_UP, onmouseupchip);
			eventMap.mapListener(contextView, MouseEvent.MOUSE_UP, onmouseupchip);
			eventMap.mapListener(contextView, MouseEvent.MOUSE_UP, onmouseupchip);
			eventMap.mapListener(contextView, MouseEvent.MOUSE_UP, onmouseupchip);
			
		}
		
		private function onmousedownchip(e:MouseEvent):void{
			//e.target.startDrag(); 
			dispatch(new ChipEvent(ChipEvent.CHOOSE_CHIP,e.target.name));
			eventMap.mapListener(contextView, MouseEvent.MOUSE_MOVE, onmousemovechip);
		}
		
		private function onmouseupchip(e:MouseEvent):void{
			eventMap.unmapListener(contextView, MouseEvent.MOUSE_MOVE, onmousemovechip);
			//e.target.stopDrag();
			model.addWager(10);
		}
		
		private function onmousemovechip(e:MouseEvent):void{
			dispatch(new ChipEvent(ChipEvent.DRAG_MOVE,null));
		}
		
		
	}
}