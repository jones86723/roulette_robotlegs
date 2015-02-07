package com.lunajones.roulette.model.event
{
	import flash.events.Event;
	
	public class GameEvent extends Event
	{
		public static const CHANGE:String ="change";
		public static const GET_RESULT:String ="get_result";
		
		
		public function GameEvent(type:String)
		{
			super(type, bubbles, cancelable);
		}
	}
}