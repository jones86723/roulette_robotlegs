package com.lunajones.roulette
{
	import org.robotlegs.base.ContextEvent;
	import com.lunajones.roulette.view.BetView;
	import com.lunajones.roulette.view.BetViewMediator;
	import flash.display.DisplayObjectContainer;
	import org.robotlegs.mvcs.Context;
	
	public class RouletteContext extends Context
	{
		public function RouletteContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true)
		{
			super(contextView, autoStartup);
		}
		
		public override function startup():void{
			mediatorMap.mapView(BetView,BetViewMediator);
			
			contextView.addChild(new BetView());
			
			dispatchEvent(new ContextEvent(ContextEvent.STARTUP));
			
		}
	}
}