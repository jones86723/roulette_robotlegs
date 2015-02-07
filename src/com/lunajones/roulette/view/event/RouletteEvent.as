package com.lunajones.roulette.view.event
{
	import flash.events.Event;
	
	public class RouletteEvent extends Event
	{
		public static const START_RUN:String = "start_run";
		public static const FINISH_RUN:String = "finish_run";
		public function RouletteEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}