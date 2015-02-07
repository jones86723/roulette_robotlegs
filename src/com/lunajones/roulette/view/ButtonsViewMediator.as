package com.lunajones.roulette.view
{
	import com.lunajones.roulette.model.GameModel;
	import com.lunajones.roulette.view.ButtonsView;
	import com.lunajones.roulette.view.event.RouletteEvent;
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class ButtonsViewMediator extends Mediator
	{
		[Inject]
		public var view:ButtonsView;
		
		[Inject]
		public var model:GameModel;
		
		public function ButtonsViewMediator()
		{
			super();	
		}
		
		override public function onRegister():void{
			view.main();
			eventMap.mapListener(view.doubleBtn,MouseEvent.CLICK,onclickdouble);
			eventMap.mapListener(view.clearBtn,MouseEvent.CLICK,onclickclear);
			eventMap.mapListener(view.backBtn,MouseEvent.CLICK,onclickback);
			eventMap.mapListener(view.startBtn,MouseEvent.CLICK,onclickstart);
			
		}
		
		private function onclickdouble(e:MouseEvent):void{
			model.doubleWager();
		}
		
		private function onclickclear(e:MouseEvent):void{
			model.clearWager();
		}
		
		private function onclickback(e:MouseEvent):void{
			model.parentWager();
		}
		
		private function onclickstart(e:MouseEvent):void{
			dispatch(new RouletteEvent(RouletteEvent.START_RUN));
		}
	}
}