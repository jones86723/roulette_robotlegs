package com.lunajones.roulette.view
{
	import Box2D.Collision.*;
	import Box2D.Collision.Shapes.*;
	import Box2D.Common.Math.*;
	import Box2D.Dynamics.*;
	import Box2D.Dynamics.Joints.*;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	[Embed('../../../../source/roulette_asset.swf', symbol='Roulette')]
	public class RouletteView extends Sprite
	{
		
		public var ball:MovieClip;
		
		private var world:b2World=new b2World(new b2Vec2(0,50),true);
		private var worldScale:Number=30;
		private var planetVector:Vector.<b2Body>=new Vector.<b2Body>();
		private var debrisVector:Vector.<b2Body>=new Vector.<b2Body>();
		//var orbitCanvas:Sprite=new Sprite();
		private var ctime:int = 0;
		private var linebody:b2Body;
		
		public function RouletteView()
		{
			super();
		}
		
		public function main():void{
			this.x = 227;
			this.y = -336;
			
			debugDraw();
			addPlanet(296,298,87);
			addEventListener(Event.ENTER_FRAME,update);
			stage.addEventListener(MouseEvent.CLICK,createDebris);
			
		}
		
		private function createDebris(e:MouseEvent):void {
			addBall();
		}
		private function addPlanet(pX:Number,pY:Number,r:Number):void {
			for(var i:int=0;i<=37;i++){
				var polygonShape:b2PolygonShape=new b2PolygonShape();
				polygonShape.SetAsBox(5/worldScale/2,10/worldScale/2);
				var fixtureDef:b2FixtureDef = new b2FixtureDef();
				fixtureDef.density=0;
				fixtureDef.friction=15;
				fixtureDef.restitution=0;//彈力
				fixtureDef.shape=polygonShape;
				var bodyDef:b2BodyDef = new b2BodyDef();
				//bodyDef.type=b2Body.b2_dynamicBody;
				bodyDef.position.Set(i*800/37/worldScale,750/worldScale);
				var box:b2Body=world.CreateBody(bodyDef);
				//debrisVector.push(box);
				box.CreateFixture(fixtureDef);
			}
			var fixtureCircleDef:b2FixtureDef = new b2FixtureDef();
			var lineDef:b2PolygonShape = new b2PolygonShape();
			var vec1:b2Vec2 =new b2Vec2(0,400/worldScale);
			var vec2:b2Vec2 =new b2Vec2(800/worldScale,400/worldScale);
			lineDef.SetAsEdge(vec1,vec2);
			fixtureCircleDef.shape = lineDef;
			fixtureCircleDef.friction=0;
			fixtureCircleDef.density=5;
			fixtureCircleDef.restitution=0;//彈力
			var bodyDef2:b2BodyDef=new b2BodyDef();
			linebody=world.CreateBody(bodyDef2);
			linebody.CreateFixture(fixtureCircleDef);
		}
		private function addBall():void {
			ctime = 0;
			var circleShape:b2CircleShape=new b2CircleShape(11/worldScale);
			//polygonShape.SetAsBox(w/worldScale/2,h/worldScale/2);
			var fixtureDef:b2FixtureDef = new b2FixtureDef();
			fixtureDef.density=0;
			fixtureDef.friction=0;
			fixtureDef.restitution=0;//彈力
			fixtureDef.shape=circleShape;
			var bodyDef:b2BodyDef = new b2BodyDef();
			bodyDef.type=b2Body.b2_dynamicBody;
			bodyDef.position.Set(mouseX/worldScale,mouseY/worldScale);
			var box:b2Body=world.CreateBody(bodyDef);
			debrisVector.push(box);
			box.CreateFixture(fixtureDef);	
			box.ApplyImpulse(new b2Vec2(15000,0),box.GetWorldCenter());
		}
		private function debugDraw():void {
			var debugDraw:b2DebugDraw = new b2DebugDraw();
			var debugSprite:Sprite = new Sprite();
			addChild(debugSprite);
			debugDraw.SetSprite(debugSprite);
			debugDraw.SetDrawScale(worldScale);
			debugDraw.SetFlags(b2DebugDraw.e_shapeBit|b2DebugDraw.e_jointBit);
			debugDraw.SetFillAlpha(0.5);
			world.SetDebugDraw(debugDraw);
		}
		private function update(e:Event):void {
			world.Step(1/30, 50, 50);
			
			world.ClearForces();
			for (var i:int=0; i<debrisVector.length; i++) {//小球
				var p:b2Vec2= debrisVector[i].GetPosition();				 
				if(p.x>800/worldScale){
					ctime++
					debrisVector[i].SetPosition(new b2Vec2(0,p.y))
				}else if(p.x<0){
					debrisVector[i].SetPosition(new b2Vec2(800/worldScale,p.y))
				}
				
				if(ctime>4){
					linebody.SetPosition(new b2Vec2(0,350/worldScale))
				}
				var r:Number = 110*(750-p.y*worldScale)/350
				ball.x = 295+(r+130)*Math.cos(-Math.PI*2*p.x*worldScale/800 );
				ball.y = 298+(r+130)*Math.sin(-Math.PI*2*p.x*worldScale/800 );
			}
			
			world.DrawDebugData();
		}
	}
}