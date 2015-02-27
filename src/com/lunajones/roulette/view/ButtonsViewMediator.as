package com.lunajones.roulette.view
{
	import com.lunajones.roulette.model.GameModel;
	import com.lunajones.roulette.model.event.GameEvent;
	import com.lunajones.roulette.view.ButtonsView;
	import com.lunajones.roulette.view.event.ChipEvent;
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
			//eventMap.mapListener(view.doubleBtn,MouseEvent.CLICK,onclickdouble);
			//eventMap.mapListener(view.clearBtn,MouseEvent.CLICK,onclickclear);
			//eventMap.mapListener(view.backBtn,MouseEvent.CLICK,onclickback);
			//eventMap.mapListener(view.againBtn,MouseEvent.CLICK,onclickagain);
			//eventMap.mapListener(view.startBtn,MouseEvent.CLICK,onclickstart);
			eventMap.mapListener(eventDispatcher,ChipEvent.CHOOSE_BET,onchoosebet);
			//eventMap.mapListener(eventDispatcher,GameEvent.GET_RESULT,ongetresult);
			eventMap.mapListener(eventDispatcher,GameEvent.CLEAR_ALL,onclearall);
		}
		
		private function onclearall(e:GameEvent):void{
			view.againBtn.alpha =1;
			view.backBtn.alpha =0.5;
			view.doubleBtn.alpha =0.5;
			view.clearBtn.alpha =0.5;
			view.startBtn.alpha =0.5;
			eventMap.mapListener(view.againBtn,MouseEvent.CLICK,onclickagain);
			eventMap.unmapListener(view.startBtn,MouseEvent.CLICK,onclickstart);
			eventMap.unmapListener(view.clearBtn,MouseEvent.CLICK,onclickclear);
			eventMap.unmapListener(view.backBtn,MouseEvent.CLICK,onclickback);
			eventMap.unmapListener(view.doubleBtn,MouseEvent.CLICK,onclickdouble);
		}
		
		/*private function ongetresult(e:GameEvent):void{
			view.againBtn.alpha =1;
			eventMap.mapListener(view.againBtn,MouseEvent.CLICK,onclickagain);
		}*/
		
		private function onchoosebet(e:ChipEvent):void{
			view.startBtn.alpha =1;
			view.againBtn.alpha =0.5;
			view.backBtn.alpha =1;
			view.doubleBtn.alpha =1;
			view.clearBtn.alpha =1;
			eventMap.mapListener(view.startBtn,MouseEvent.CLICK,onclickstart);
			eventMap.unmapListener(view.againBtn,MouseEvent.CLICK,onclickagain);
			eventMap.mapListener(view.backBtn,MouseEvent.CLICK,onclickback);
			eventMap.mapListener(view.doubleBtn,MouseEvent.CLICK,onclickdouble);
			eventMap.mapListener(view.clearBtn,MouseEvent.CLICK,onclickclear);
		}
		
		private function onclickdouble(e:MouseEvent):void{
			model.doubleWager();
			
		}
		
		private function onclickclear(e:MouseEvent):void{
			model.clearWager();
			view.againBtn.alpha =1;
			eventMap.mapListener(view.againBtn,MouseEvent.CLICK,onclickagain);
		}
		
		private function onclickback(e:MouseEvent):void{
			model.parentWager();
		}
		
		private function onclickagain(e:MouseEvent):void{
			model.againWager();
			//view.againBtn.alpha =0.5;
			dispatch(new ChipEvent(ChipEvent.CHOOSE_BET,null));
			//eventMap.unmapListener(view.againBtn,MouseEvent.CLICK,onclickagain);
		}
		
		private function onclickstart(e:MouseEvent):void{
			view.againBtn.alpha =0.5;
			view.backBtn.alpha =0.5;
			view.doubleBtn.alpha =0.5;
			view.clearBtn.alpha =0.5;
			view.startBtn.alpha =0.5;
			eventMap.unmapListener(view.againBtn,MouseEvent.CLICK,onclickagain);
			eventMap.unmapListener(view.startBtn,MouseEvent.CLICK,onclickstart);
			eventMap.unmapListener(view.clearBtn,MouseEvent.CLICK,onclickclear);
			eventMap.unmapListener(view.backBtn,MouseEvent.CLICK,onclickback);
			eventMap.unmapListener(view.doubleBtn,MouseEvent.CLICK,onclickdouble);
			dispatch(new RouletteEvent(RouletteEvent.START_RUN,null));
		}
	}
}