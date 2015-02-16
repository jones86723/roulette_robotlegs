package com.lunajones.roulette.view.event
{
	import flash.events.Event;
	
	public class RouletteEvent extends Event
	{
		public static const START_RUN:String = "start_run";
		public static const FINISH_RUN:String = "finish_run";
		
		public var data: Object;
		
		public function RouletteEvent(type:String, data:Object ,bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.data = data;
		}
	}
}