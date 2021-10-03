package com.sulake.habbo.friendbar.view.utils
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import flash.display.BitmapData;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class Icon implements IDisposable
   {
      
      protected static const const_2070:int = 0;
      
      protected static const const_631:int = 1;
      
      protected static const const_1788:int = 2;
      
      protected static const const_1789:int = 3;
      
      protected static const const_123:int = 4;
      
      protected static const const_632:int = 8;
      
      protected static const const_281:int = 18;
      
      protected static const const_1790:int = 18;
       
      
      private var _disposed:Boolean = false;
      
      private var var_1641:Boolean = false;
      
      protected var var_49:BitmapDataAsset;
      
      protected var var_88:IBitmapWrapperWindow;
      
      private var var_1098:uint;
      
      protected var var_209:Timer;
      
      protected var _frame:int = 0;
      
      private var var_584:Point;
      
      protected var var_871:Boolean = false;
      
      protected var var_870:Boolean = false;
      
      public function Icon()
      {
         this.var_1098 = const_631 | const_632;
         this.var_584 = new Point();
         super();
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get disabled() : Boolean
      {
         return this.var_1641;
      }
      
      protected function set image(param1:BitmapDataAsset) : void
      {
         this.var_49 = param1;
         this.redraw();
      }
      
      protected function get image() : BitmapDataAsset
      {
         return this.var_49;
      }
      
      protected function set canvas(param1:IBitmapWrapperWindow) : void
      {
         this.var_88 = param1;
         this.redraw();
      }
      
      protected function get canvas() : IBitmapWrapperWindow
      {
         return this.var_88;
      }
      
      protected function set alignment(param1:uint) : void
      {
         this.var_1098 = param1;
         this.redraw();
      }
      
      protected function get alignment() : uint
      {
         return this.var_1098;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this.toggleTimer(false,0);
            this.image = null;
            this.canvas = null;
            this._disposed = true;
         }
      }
      
      public function notify(param1:Boolean) : void
      {
         this.var_871 = param1;
         if(this.var_871 && this.var_1641)
         {
            this.enable(true);
         }
      }
      
      public function hover(param1:Boolean) : void
      {
         this.var_870 = param1;
      }
      
      public function enable(param1:Boolean) : void
      {
         this.var_1641 = !param1;
      }
      
      protected function redraw() : void
      {
         var _loc1_:* = null;
         if(this.var_88 && !this.var_88.disposed)
         {
            if(!this.var_88.bitmap)
            {
               this.var_88.bitmap = new BitmapData(this.var_88.width,this.var_88.height,true,0);
            }
            else
            {
               this.var_88.bitmap.fillRect(this.var_88.bitmap.rect,0);
            }
            if(this.var_49 && !this.var_49.disposed)
            {
               this.var_584.x = this.var_584.y = 0;
               _loc1_ = this.var_49.content as BitmapData;
               switch(this.var_1098 & const_1789)
               {
                  case const_631:
                     this.var_584.x = this.var_88.bitmap.width / 2 - _loc1_.width / 2;
                     break;
                  case const_1788:
                     this.var_584.x = this.var_88.bitmap.width - _loc1_.width;
               }
               switch(this.var_1098 & const_1790)
               {
                  case const_632:
                     this.var_584.y = this.var_88.bitmap.height / 2 - _loc1_.height / 2;
                     break;
                  case const_281:
                     this.var_584.y = this.var_88.bitmap.height - _loc1_.height;
               }
               this.var_88.bitmap.copyPixels(_loc1_,_loc1_.rect,this.var_584);
               this.var_88.invalidate();
            }
         }
      }
      
      protected function toggleTimer(param1:Boolean, param2:int) : void
      {
         if(param1)
         {
            if(!this.var_209)
            {
               this.var_209 = new Timer(param2,0);
               this.var_209.addEventListener(TimerEvent.TIMER,this.onTimerEvent);
               this.var_209.start();
               this.onTimerEvent(null);
            }
            this.var_209.delay = param2;
         }
         else
         {
            this._frame = 0;
            if(this.var_209)
            {
               this.var_209.reset();
               this.var_209.removeEventListener(TimerEvent.TIMER,this.onTimerEvent);
               this.var_209 = null;
            }
         }
      }
      
      protected function onTimerEvent(param1:TimerEvent) : void
      {
      }
   }
}
