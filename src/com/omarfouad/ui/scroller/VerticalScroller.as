/*Copyright (c) 2011 Omar Fouad

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE. 
*/

package com.omarfouad.ui.scroller {
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	/**
	 * @eventType com.omarfouad.scroller.ScrollBarEvent.SCROLL_START
	 */ 
	[Event(name="scrollStart", type="com.omarfouad.ui.scroller.VerticalScrollerEvent")]
	
	/** 
	 * @eventType com.omarfouad.scroller.ScrollerEvent.SCROLL_STOP
	 */ 
	[Event(name="scrollStop", type="com.omarfouad.ui.scroller.VerticalScrollerEvent")]
	
	
	public class VerticalScroller extends Sprite {
		
		private var conatinerMask:Sprite;
		private var thumb:Sprite;
		private var track:Sprite;
		private var container:Sprite;
		
		private var percentage:Number;
		private var yMin:int;
		private var yMax:int;
		private var yOffset:Number;
		private var contentStartY:Number;
		private var mainStage:DisplayObject;
		
		/**
		 * The thumb Sprite y coordinate.
		 */		
		public function get thumbPosition():Number 
		{
			return thumb.y;
		}
		
		public function set thumbPosition(value:Number):void 
		{
			thumb.y = value;
		}
		
		/**
		 * Vertically Scrolls a Sprite using the passed thumb, mask, and track Sprites.
		 * 
		 * @param stage The reference to the Stage.
		 * @param mask The Sprite wich will maske the container Sprite.
		 * @param thumb The button that, when dragged down and up, scrolls the container. 
		 * @param track The thumb track.
		 * @param container The Sprite that is scrolled when dragging the thumb Sprite.
		 * 
		 */
		public function VerticalScroller(stage:DisplayObject, mask:Sprite, thumb:Sprite, track:Sprite, container:Sprite) 
		{
			this.conatinerMask = mask;
			this.thumb = thumb;
			this.container = container;
			this.track = track;
			this.mainStage = stage;
			
			initialize();
		}
		
		/**
		 * Updates the position of the container Sprite. 
		 */		
		public function positionContent():void 
		{
			if(thumb.y <= yMin) thumb.y = yMin;
			if(thumb.y >= yMax) thumb.y = yMax;
			
			updateThumbHeight();
			checkContentLength();
			
			var scrollPercent:Number = thumb.y / yMax;
			var position:Number = (-scrollPercent * (container.height - conatinerMask.height));
			
			if(container.y !== Math.floor(position)) 
			{
				dispatchEvent(new VerticalScrollerEvent(VerticalScrollerEvent.SCROLL_START));
			}else{
				dispatchEvent(new VerticalScrollerEvent(VerticalScrollerEvent.SCROLL_STOP));
			}
			container.y = Math.floor(position);
		}
		
		/**
		 * Moves the thumb Sprite to the top of the track and scrolls the container to the top.
		 */		
		public function reset():void 
		{
			thumb.y = 0;
			positionContent();
		}
		
		/**
		 * Shows/Hides the thumb Sprite based on the container height. 
		 */		
		public function checkContentLength():void 
		{
			if (container.height > conatinerMask.height) 
			{
				thumb.visible = true;
			}else{
				thumb.visible = false; 
				reset();
			}
		}
		
		/**
		 * @private
		 */		
		private function initialize():void 
		{
			yMin = 0;
			yMax = track.height - thumb.height;
			contentStartY = container.y;
			updateThumbHeight();
			
			thumb.addEventListener(MouseEvent.MOUSE_DOWN, onDown);
			mainStage.addEventListener(MouseEvent.MOUSE_WHEEL, onScroll);
		}
		
		/**
		 * @private
		 */		
		private function onDown(e:MouseEvent):void {
			yOffset = mainStage.mouseY - thumb.y;
			mainStage.addEventListener(MouseEvent.MOUSE_MOVE, onMove);
			mainStage.addEventListener(MouseEvent.MOUSE_UP, release);
		}
		
		/**
		 * @private
		 */		
		private function onScroll(e:MouseEvent):void 
		{
			if(thumb.visible) 
			{
				if(e.delta > 0 ) thumb.y -= 10;
				if(e.delta < 0 ) thumb.y += 10;
				positionContent();
			}
		}
		
		/**
		 * @private
		 */		
		private function onMove(e:MouseEvent):void 
		{
			thumb.y = mainStage.mouseY - yOffset;
			positionContent();
		}
		
		/**
		 * @private
		 */		
		private function release(e:MouseEvent):void 
		{
			mainStage.removeEventListener(MouseEvent.MOUSE_MOVE, onMove);
			mainStage.removeEventListener(MouseEvent.MOUSE_UP, release);
		}
		
		/**
		 * @private
		 */		
		private function updateThumbHeight():void 
		{
			if (container.height > conatinerMask.height) 
			{
				thumb.height = track.height - (container.height - conatinerMask.height);
				yMin = 0;
				yMax = track.height - thumb.height;
				if(thumb.height < 50) thumb.height = 50;
			}
		}
		
		
		
	}
}