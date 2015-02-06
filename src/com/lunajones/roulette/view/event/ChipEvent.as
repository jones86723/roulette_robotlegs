package com.lunajones.roulette.view.event
{
	import flash.events.Event;
	
	public class ChipEvent extends Event
	{
		
		public static const CHOOSE_CHIP:String = "choose_chip";
		public static const DRAG_MOVE:String ="drag_move";
		public static const CHOOSE_BET:String = "choose_bet";
		public var data: Object;
		
		public function ChipEvent(type:String, data:Object ,bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			
			this.data = data;
		}
	}
}