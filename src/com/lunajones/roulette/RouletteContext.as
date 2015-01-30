package com.lunajones.roulette
{
	import org.robotlegs.base.ContextEvent;
	
	import com.lunajones.roulette.model.WagerModel;
	
	import com.lunajones.roulette.view.AmountView;
	import com.lunajones.roulette.view.AmountViewMediator;
	import com.lunajones.roulette.view.BetView;
	import com.lunajones.roulette.view.BetViewMediator;
	import com.lunajones.roulette.view.ButtonsView;
	import com.lunajones.roulette.view.ButtonsViewMediator;
	import com.lunajones.roulette.view.ChipsView;
	import com.lunajones.roulette.view.ChipsViewMediator;
	import com.lunajones.roulette.view.HistoryView;
	import com.lunajones.roulette.view.HistoryViewMediator;
	import com.lunajones.roulette.view.WagerView;
	import com.lunajones.roulette.view.WagerViewMediator;
	import com.lunajones.roulette.view.RouletteView;
	import com.lunajones.roulette.view.RouletteViewMediator;
	import flash.display.DisplayObjectContainer;
	import org.robotlegs.mvcs.Context;
	
	public class RouletteContext extends Context
	{
		public function RouletteContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true)
		{
			super(contextView, autoStartup);
		}
		
		public override function startup():void{
			
			injector.mapSingleton(WagerModel);
			
			mediatorMap.mapView(AmountView,AmountViewMediator);
			mediatorMap.mapView(BetView,BetViewMediator);
			mediatorMap.mapView(ButtonsView,ButtonsViewMediator);
			mediatorMap.mapView(ChipsView,ChipsViewMediator);
			mediatorMap.mapView(HistoryView,HistoryViewMediator);
			mediatorMap.mapView(WagerView,WagerViewMediator);
			mediatorMap.mapView(RouletteView,RouletteViewMediator);
			
			contextView.addChild(new AmountView());
			contextView.addChild(new BetView());
			contextView.addChild(new ButtonsView());
			contextView.addChild(new ChipsView());
			contextView.addChild(new HistoryView());
			contextView.addChild(new WagerView());
			contextView.addChild(new RouletteView());
			
			dispatchEvent(new ContextEvent(ContextEvent.STARTUP));
			
		}
	}
}