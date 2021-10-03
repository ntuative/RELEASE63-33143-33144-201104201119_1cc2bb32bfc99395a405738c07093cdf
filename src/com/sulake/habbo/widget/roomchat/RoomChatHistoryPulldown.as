package com.sulake.habbo.widget.roomchat
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.enum.WindowType;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class RoomChatHistoryPulldown
   {
      
      public static const const_996:int = 3;
      
      public static const const_570:int = 2;
      
      public static const const_403:int = 1;
      
      public static const const_282:int = 0;
      
      public static const const_87:int = 39;
      
      private static const const_1049:int = 150;
      
      private static const const_1050:int = 250;
       
      
      private var _widget:RoomChatWidget;
      
      private var _windowManager:IHabboWindowManager;
      
      private var _window:IWindowContainer;
      
      private var var_78:IBitmapWrapperWindow;
      
      private var var_44:IWindowContainer;
      
      private var _region:IRegionWindow;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_2861:int = 0;
      
      private var _state:int = -1;
      
      private var var_2862:BitmapData;
      
      private var var_2062:BitmapData;
      
      private var var_2859:BitmapData;
      
      private var var_2061:BitmapData;
      
      private var var_2063:BitmapData;
      
      private var var_2860:BitmapData;
      
      private var var_2863:BitmapData;
      
      private var var_2864:int = 30;
      
      public function RoomChatHistoryPulldown(param1:RoomChatWidget, param2:IHabboWindowManager, param3:IWindowContainer, param4:IAssetLibrary)
      {
         super();
         this._widget = param1;
         this._windowManager = param2;
         this._assetLibrary = param4;
         this.var_44 = param3;
         this.var_2862 = (this._assetLibrary.getAssetByName("chat_grapbar_bg") as BitmapDataAsset).content as BitmapData;
         this.var_2062 = (this._assetLibrary.getAssetByName("chat_grapbar_grip") as BitmapDataAsset).content as BitmapData;
         this.var_2859 = (this._assetLibrary.getAssetByName("chat_grapbar_handle") as BitmapDataAsset).content as BitmapData;
         this.var_2061 = (this._assetLibrary.getAssetByName("chat_grapbar_x") as BitmapDataAsset).content as BitmapData;
         this.var_2063 = (this._assetLibrary.getAssetByName("chat_grapbar_x_hi") as BitmapDataAsset).content as BitmapData;
         this.var_2860 = (this._assetLibrary.getAssetByName("chat_grapbar_x_pr") as BitmapDataAsset).content as BitmapData;
         this.var_2863 = (this._assetLibrary.getAssetByName("chat_history_bg") as BitmapDataAsset).content as BitmapData;
         this.var_78 = this._windowManager.createWindow("chat_history_bg","",HabboWindowType.const_343,HabboWindowStyle.const_30,HabboWindowParam.const_61,new Rectangle(0,0,param3.width,param3.height - const_87),null,0,0) as IBitmapWrapperWindow;
         this.var_44.addChild(this.var_78);
         this._window = this._windowManager.createWindow("chat_pulldown","",HabboWindowType.const_69,HabboWindowStyle.const_30,0 | 0,new Rectangle(0,this.var_44.height - const_87,param3.width,const_87),null,0) as IWindowContainer;
         this.var_44.addChild(this._window);
         this._region = this._windowManager.createWindow("REGIONchat_pulldown","",WindowType.const_579,HabboWindowStyle.const_44,0 | 0 | 0 | 0,new Rectangle(0,0,param3.width,param3.height - const_87),null,0) as IRegionWindow;
         if(this._region != null)
         {
            this._region.background = true;
            this._region.mouseThreshold = 0;
            this._region.addEventListener(WindowMouseEvent.const_42,this.onPulldownMouseDown);
            this.var_44.addChild(this._region);
            this._region.toolTipCaption = "${chat.history.drag.tooltip}";
            this._region.toolTipDelay = 250;
         }
         var _loc5_:XmlAsset = param4.getAssetByName("chat_history_pulldown") as XmlAsset;
         this._window.buildFromXML(_loc5_.content as XML);
         this._window.addEventListener(WindowMouseEvent.const_42,this.onPulldownMouseDown);
         var _loc6_:IBitmapWrapperWindow = this._window.findChildByName("GrapBarX") as IBitmapWrapperWindow;
         if(_loc6_ != null)
         {
            _loc6_.mouseThreshold = 0;
            _loc6_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onCloseButtonClicked);
            _loc6_.addEventListener(WindowMouseEvent.const_52,this.onCloseButtonMouseUp);
            _loc6_.addEventListener(WindowMouseEvent.const_42,this.onCloseButtonMouseDown);
            _loc6_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,this.onCloseButtonMouseOver);
            _loc6_.addEventListener(WindowMouseEvent.const_25,this.onCloseButtonMouseOut);
         }
         this._window.background = true;
         this._window.color = 0;
         this._window.mouseThreshold = 0;
         this.state = const_282;
         this.buildWindowGraphics();
      }
      
      public function dispose() : void
      {
         if(this._region != null)
         {
            this._region.dispose();
            this._region = null;
         }
         if(this._window != null)
         {
            this._window.dispose();
            this._window = null;
         }
         if(this.var_78 != null)
         {
            this.var_78.dispose();
            this.var_78 = null;
         }
      }
      
      public function update(param1:uint) : void
      {
         switch(this.state)
         {
            case const_570:
               this.var_78.blend += param1 / const_1050;
               this._window.blend += param1 / const_1050;
               if(this._window.blend >= 1)
               {
                  this.state = const_403;
               }
               break;
            case const_996:
               this.var_78.blend -= param1 / const_1049;
               this._window.blend -= param1 / const_1049;
               if(this._window.blend <= 0)
               {
                  this.state = const_282;
               }
         }
      }
      
      public function set state(param1:int) : void
      {
         if(param1 == this._state)
         {
            return;
         }
         switch(param1)
         {
            case const_403:
               if(this._state == const_282)
               {
                  this.state = const_570;
               }
               else
               {
                  if(this._window == null || this.var_78 == null)
                  {
                     return;
                  }
                  this._window.visible = true;
                  this.var_78.visible = true;
                  this._region.visible = true;
                  this._state = param1;
               }
               break;
            case const_282:
               if(this._window == null || this.var_78 == null)
               {
                  return;
               }
               this._window.visible = false;
               this.var_78.visible = false;
               this._region.visible = false;
               this._state = param1;
               break;
            case const_570:
               if(this._window == null || this.var_78 == null)
               {
                  return;
               }
               this._window.blend = 0;
               this.var_78.blend = 0;
               this._window.visible = true;
               this.var_78.visible = true;
               this._state = param1;
               break;
            case const_996:
               if(this._window == null || this.var_78 == null)
               {
                  return;
               }
               this._window.blend = 1;
               this.var_78.blend = 1;
               this._state = param1;
               break;
         }
      }
      
      public function get state() : int
      {
         return this._state;
      }
      
      public function containerResized(param1:Rectangle) : void
      {
         if(this._window != null)
         {
            this._window.x = 0;
            this._window.y = this.var_44.height - const_87;
            this._window.width = this.var_44.width;
         }
         if(this._region != null)
         {
            this._region.x = 0;
            this._region.y = this.var_44.height - const_87;
            this._region.width = this.var_44.width - this.var_2864;
         }
         if(this.var_78 != null)
         {
            this.var_78.rectangle = this.var_44.rectangle;
            this.var_78.height -= const_87;
         }
         this.buildWindowGraphics();
      }
      
      private function buildWindowGraphics() : void
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         if(this._window == null)
         {
            return;
         }
         if(this.var_2861 == this._window.width)
         {
            return;
         }
         this.var_2861 = this._window.width;
         var _loc1_:IBitmapWrapperWindow = this._window.findChildByName("grapBarBg") as IBitmapWrapperWindow;
         var _loc2_:IBitmapWrapperWindow = this._window.findChildByName("GrapBarX") as IBitmapWrapperWindow;
         var _loc3_:IBitmapWrapperWindow = this._window.findChildByName("grapBarGripL") as IBitmapWrapperWindow;
         var _loc4_:IBitmapWrapperWindow = this._window.findChildByName("grapBarGripR") as IBitmapWrapperWindow;
         var _loc5_:IBitmapWrapperWindow = this._window.findChildByName("grapBarHandle") as IBitmapWrapperWindow;
         if(_loc2_ != null && _loc5_ != null)
         {
            _loc5_.bitmap = this.var_2859;
            _loc5_.disposesBitmap = false;
            _loc2_.bitmap = this.var_2061;
            _loc2_.disposesBitmap = false;
            this.var_2864 = this._window.width - _loc2_.x;
         }
         _loc3_.width = _loc5_.x - 5;
         _loc3_.x = 0;
         _loc4_.x = _loc5_.x + _loc5_.width + 5;
         _loc4_.width = _loc2_.x - 5 - _loc4_.x;
         if(_loc3_.width < 0)
         {
            _loc3_.width = 0;
         }
         if(_loc4_.width < 0)
         {
            _loc4_.width = 0;
         }
         if(_loc1_ != null && _loc3_ != null && _loc4_ != null)
         {
            if(_loc1_.width > 0 && _loc1_.height > 0)
            {
               _loc7_ = new BitmapData(_loc1_.width,_loc1_.height);
               this.tileBitmapHorz(this.var_2862,_loc7_);
               _loc1_.disposesBitmap = true;
               _loc1_.bitmap = _loc7_;
            }
            if(_loc3_.width > 0 && _loc3_.height > 0)
            {
               _loc8_ = new BitmapData(_loc3_.width,_loc3_.height);
               this.tileBitmapHorz(this.var_2062,_loc8_);
               _loc3_.disposesBitmap = true;
               _loc3_.bitmap = _loc8_;
            }
            if(_loc4_.width > 0 && _loc4_.height > 0)
            {
               _loc9_ = new BitmapData(_loc4_.width,_loc4_.height);
               this.tileBitmapHorz(this.var_2062,_loc9_);
               _loc4_.disposesBitmap = true;
               _loc4_.bitmap = _loc9_;
            }
         }
         if(this.var_78 == null)
         {
            return;
         }
         this.var_78.bitmap = this.var_2863;
         this.var_78.disposesBitmap = false;
      }
      
      private function tileBitmapHorz(param1:BitmapData, param2:BitmapData) : void
      {
         var _loc3_:int = param2.width / param1.width;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_ + 1)
         {
            param2.copyPixels(param1,param1.rect,new Point(_loc4_ * param1.width,0));
            _loc4_++;
         }
      }
      
      private function onPulldownMouseDown(param1:WindowMouseEvent) : void
      {
         if(this._widget != null)
         {
            this._widget.onPulldownMouseDown(param1);
         }
      }
      
      private function onCloseButtonClicked(param1:WindowMouseEvent) : void
      {
         if(this._widget != null)
         {
            this._widget.onPulldownCloseButtonClicked(param1);
         }
      }
      
      private function onCloseButtonMouseOver(param1:WindowMouseEvent) : void
      {
         if(this._window == null)
         {
            return;
         }
         if(!this._window.visible)
         {
            return;
         }
         var _loc2_:IBitmapWrapperWindow = this._window.findChildByName("GrapBarX") as IBitmapWrapperWindow;
         if(_loc2_ != null)
         {
            _loc2_.disposesBitmap = false;
            _loc2_.bitmap = this.var_2063;
         }
      }
      
      private function onCloseButtonMouseOut(param1:WindowMouseEvent) : void
      {
         if(this._window == null)
         {
            return;
         }
         if(!this._window.visible)
         {
            return;
         }
         var _loc2_:IBitmapWrapperWindow = this._window.findChildByName("GrapBarX") as IBitmapWrapperWindow;
         if(_loc2_ != null)
         {
            _loc2_.disposesBitmap = false;
            _loc2_.bitmap = this.var_2061;
         }
      }
      
      private function onCloseButtonMouseDown(param1:WindowMouseEvent) : void
      {
         if(this._window == null)
         {
            return;
         }
         if(!this._window.visible)
         {
            return;
         }
         var _loc2_:IBitmapWrapperWindow = this._window.findChildByName("GrapBarX") as IBitmapWrapperWindow;
         if(_loc2_ != null)
         {
            _loc2_.disposesBitmap = false;
            _loc2_.bitmap = this.var_2860;
         }
      }
      
      private function onCloseButtonMouseUp(param1:WindowMouseEvent) : void
      {
         if(this._window == null)
         {
            return;
         }
         if(!this._window.visible)
         {
            return;
         }
         var _loc2_:IBitmapWrapperWindow = this._window.findChildByName("GrapBarX") as IBitmapWrapperWindow;
         if(_loc2_ != null)
         {
            _loc2_.disposesBitmap = false;
            _loc2_.bitmap = this.var_2063;
         }
      }
   }
}
