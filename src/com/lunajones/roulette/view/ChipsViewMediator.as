package com.lunajones.roulette.view
{
	import com.lunajones.roulette.model.WagerModel;
	import com.lunajones.roulette.view.ChipsView;
	
	import flash.events.MouseEvent;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class ChipsViewMediator extends Mediator
	{
		[Inject]
		public var view:ChipsView;
		
		[Inject]
		public var model:WagerModel;
		
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
			eventMap.mapListener(view.chip_5, MouseEvent.MOUSE_UP, onmouseupchip);
			eventMap.mapListener(view.chip_10, MouseEvent.MOUSE_UP, onmouseupchip);
			eventMap.mapListener(view.chip_20, MouseEvent.MOUSE_UP, onmouseupchip);
			eventMap.mapListener(view.chip_50, MouseEvent.MOUSE_UP, onmouseupchip);
			eventMap.mapListener(view.chip_100, MouseEvent.MOUSE_UP, onmouseupchip);
		}
		
		private function onmousedownchip(e:MouseEvent):void{
			e.target.startDrag();
		}
		
		private function onmouseupchip(e:MouseEvent):void{
			e.target.stopDrag();
			model.addmoney(10);
		}
	}
}