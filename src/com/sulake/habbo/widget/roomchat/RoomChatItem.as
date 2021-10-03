package com.sulake.habbo.widget.roomchat
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.ILabelWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.widget.events.RoomWidgetChatUpdateEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.text.TextFormat;
   
   public class RoomChatItem
   {
      
      private static const const_976:Number = 18;
      
      private static const const_641:int = 6;
      
      private static const const_1308:int = 6;
      
      private static const const_978:int = 35;
      
      private static const const_450:String = "name";
      
      private static const const_977:String = "message";
      
      private static const const_1309:String = "pointer";
      
      private static const const_5:String = "background";
      
      private static var var_1097:IRegionWindow;
      
      private static var var_1365:IRegionWindow;
      
      private static var var_1366:IRegionWindow;
      
      private static var var_1364:IRegionWindow;
       
      
      private var _widget:RoomChatWidget;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_62:IHabboLocalizationManager;
      
      private var _window:IRegionWindow;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var _id:String;
      
      private var _siteUrl:String;
      
      private var var_2181:int = 0;
      
      private var var_2183:int = -1;
      
      private var var_1363:int;
      
      private var var_1096:int;
      
      private var var_891:String;
      
      private var _message:String;
      
      private var var_337:Array;
      
      private var var_717:Array;
      
      private var var_1786:int;
      
      private var var_1634:Number;
      
      private var var_243:BitmapData;
      
      private var var_2182:uint;
      
      private var _roomId:int;
      
      private var _roomCategory:int;
      
      private var _senderCategory:int;
      
      private var var_244:Number = 0;
      
      private var var_1633:Boolean = false;
      
      private var var_718:Number = 0;
      
      private var _x:Number = 0;
      
      private var var_166:Number = 0;
      
      private var var_582:String;
      
      public function RoomChatItem(param1:RoomChatWidget, param2:IHabboWindowManager, param3:IAssetLibrary, param4:String, param5:IHabboLocalizationManager, param6:String)
      {
         this.var_891 = new String();
         this._message = new String();
         super();
         this._widget = param1;
         this._windowManager = param2;
         this._assetLibrary = param3;
         this._id = param4;
         this.var_62 = param5;
         this._siteUrl = param6;
         this.var_582 = this._widget.config.getKey("new.chat.bubbles.enabled") == "1" ? "" : "_old";
         if(!var_1366 || !var_1365 || !var_1364 || !var_1097)
         {
            var_1366 = this.buildBubbleWindow("bubble_speak");
            var_1365 = this.buildBubbleWindow("bubble_shout");
            var_1364 = this.buildBubbleWindow("bubble_whisper");
            var_1097 = this.buildBubbleWindow("bubble_whisper");
         }
      }
      
      private function buildBubbleWindow(param1:String) : IRegionWindow
      {
         var _loc2_:IRegionWindow = this._windowManager.buildFromXML(this._assetLibrary.getAssetByName(param1 + this.var_582).content as XML,1) as IRegionWindow;
         _loc2_.tags.push("roomchat_bubble");
         _loc2_.x = 0;
         _loc2_.y = 0;
         _loc2_.width = 0;
         _loc2_.background = true;
         _loc2_.mouseThreshold = 0;
         _loc2_.setParamFlag(WindowParam.WINDOW_PARAM_FORCE_CLIPPING,true);
         return _loc2_;
      }
      
      public function dispose() : void
      {
         if(this._window != null)
         {
            this._window.dispose();
            this._window = null;
            this._widget = null;
            this._windowManager = null;
            this.var_62 = null;
            this.var_243 = null;
         }
      }
      
      public function define(param1:RoomWidgetChatUpdateEvent) : void
      {
         this.var_1363 = param1.chatType;
         this.var_1096 = param1.userId;
         this.var_891 = param1.userName;
         this._senderCategory = param1.userCategory;
         this._message = param1.text;
         this.var_337 = param1.links;
         this.var_1634 = param1.userX;
         this.var_243 = param1.userImage;
         this.var_2182 = param1.userColor;
         this._roomId = param1.roomId;
         this._roomCategory = param1.roomCategory;
         this.renderView();
      }
      
      public function get view() : IWindowContainer
      {
         return this._window;
      }
      
      public function get screenLevel() : int
      {
         return this.var_2183;
      }
      
      public function get timeStamp() : int
      {
         return this.var_1786;
      }
      
      public function get senderX() : Number
      {
         return this.var_1634;
      }
      
      public function set senderX(param1:Number) : void
      {
         this.var_1634 = param1;
      }
      
      public function get width() : Number
      {
         return this.var_244;
      }
      
      public function get height() : Number
      {
         return const_976;
      }
      
      public function get message() : String
      {
         return this._message;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function get y() : Number
      {
         return this.var_166;
      }
      
      public function get aboveLevels() : int
      {
         return this.var_2181;
      }
      
      public function set aboveLevels(param1:int) : void
      {
         this.var_2181 = param1;
      }
      
      public function set screenLevel(param1:int) : void
      {
         this.var_2183 = param1;
      }
      
      public function set timeStamp(param1:int) : void
      {
         this.var_1786 = param1;
      }
      
      public function set x(param1:Number) : void
      {
         this._x = param1;
         if(this._window != null)
         {
            this._window.x = param1;
         }
      }
      
      public function set y(param1:Number) : void
      {
         this.var_166 = param1;
         if(this._window != null)
         {
            this._window.y = param1 - this.var_718;
         }
      }
      
      public function hidePointer() : void
      {
         if(this._window)
         {
            this._window.findChildByName("pointer").visible = false;
         }
      }
      
      public function setPointerOffset(param1:Number) : void
      {
         if(!this._window || this._window.disposed)
         {
            return;
         }
         var _loc2_:IBitmapWrapperWindow = this._window.findChildByName("pointer") as IBitmapWrapperWindow;
         var _loc3_:IBitmapWrapperWindow = this._window.findChildByName("middle") as IBitmapWrapperWindow;
         if(_loc3_ == null || _loc2_ == null)
         {
            return;
         }
         _loc2_.visible = true;
         param1 += this._window.width / 2;
         param1 = Math.min(param1,_loc3_.rectangle.right - _loc2_.width);
         param1 = Math.max(param1,_loc3_.rectangle.left);
         _loc2_.x = param1;
      }
      
      public function checkOverlap(param1:Number, param2:Number, param3:Number, param4:Number) : Boolean
      {
         var _loc5_:Rectangle = new Rectangle(this._x,this.var_166,this.width,const_976);
         var _loc6_:Rectangle = new Rectangle(param1,param2,param3,param4);
         return _loc5_.intersects(_loc6_);
      }
      
      public function hideView() : void
      {
         if(this._window)
         {
            this._window.dispose();
         }
         this._window = null;
         this.var_1633 = false;
      }
      
      public function renderView() : void
      {
         var messageWidth:int = 0;
         var x1:int = 0;
         var y1:int = 0;
         var userIconWindow:IBitmapWrapperWindow = null;
         var i:int = 0;
         var lastLinkEndPos:int = 0;
         var linkFormat:TextFormat = null;
         var filteredLink:String = null;
         var placeHolder:String = null;
         var placeholderPos:int = 0;
         var linkPos:Array = null;
         if(this.var_1633)
         {
            return;
         }
         this.var_1633 = true;
         if(this._window)
         {
            return;
         }
         var isRespect:Boolean = false;
         switch(this.var_1363)
         {
            case RoomWidgetChatUpdateEvent.const_107:
               this._window = var_1366.clone() as IRegionWindow;
               break;
            case RoomWidgetChatUpdateEvent.const_122:
               this._window = var_1364.clone() as IRegionWindow;
               break;
            case RoomWidgetChatUpdateEvent.const_104:
               this._window = var_1365.clone() as IRegionWindow;
               break;
            case RoomWidgetChatUpdateEvent.const_348:
               this._window = var_1097.clone() as IRegionWindow;
               isRespect = true;
               break;
            case RoomWidgetChatUpdateEvent.const_300:
               this._window = var_1097.clone() as IRegionWindow;
               isRespect = true;
         }
         var background:IBitmapWrapperWindow = this._window.findChildByName(const_5) as IBitmapWrapperWindow;
         var nameWindow:ILabelWindow = this._window.findChildByName(const_450) as ILabelWindow;
         var textWindow:ITextWindow = this._window.findChildByName(const_977) as ITextWindow;
         var pointerWindow:IBitmapWrapperWindow = this._window.findChildByName(const_1309) as IBitmapWrapperWindow;
         var pointerBitmapData:BitmapData = this._assetLibrary.getAssetByName("chat_bubble_pointer" + this.var_582).content as BitmapData;
         var totalHeight:Number = this._window.height;
         var topOffset:int = 0;
         if(this.var_243 != null)
         {
            topOffset = Math.max(0,(this.var_243.height - background.height) / 2);
            totalHeight = Math.max(totalHeight,this.var_243.height);
         }
         this.var_244 = 0;
         this._window.x = this._x;
         this._window.y = this.var_166;
         this._window.width = 0;
         this._window.height = totalHeight;
         this.enableTooltip();
         this.addEventListeners(this._window);
         if(this.var_243 && !isRespect)
         {
            x1 = 14 - this.var_243.width / 2;
            y1 = Math.max(0,(background.height - this.var_243.height) / 2);
            userIconWindow = this._window.findChildByName("user_image") as IBitmapWrapperWindow;
            if(userIconWindow)
            {
               userIconWindow.width = this.var_243.width;
               userIconWindow.height = this.var_243.height;
               userIconWindow.bitmap = this.var_243;
               userIconWindow.disposesBitmap = false;
               userIconWindow.x = x1;
               userIconWindow.y = y1;
               this.var_718 = Math.max(0,(this.var_243.height - background.height) / 2);
               this.var_244 += userIconWindow.x + this.var_243.width;
            }
         }
         if(nameWindow != null)
         {
            if(!isRespect)
            {
               nameWindow.text = this.var_891 + ": ";
               nameWindow.y += this.var_718;
               nameWindow.width = nameWindow.textWidth + const_641;
            }
            else
            {
               nameWindow.text = "";
               nameWindow.width = 0;
            }
            this.var_244 += nameWindow.width;
         }
         if(this.var_1363 == RoomWidgetChatUpdateEvent.const_348)
         {
            textWindow.text = this.var_62.registerParameter("widgets.chatbubble.respect","username",this.var_891);
            this.var_244 = const_978;
         }
         else if(this.var_1363 == RoomWidgetChatUpdateEvent.const_300)
         {
            textWindow.text = this.var_62.registerParameter("widget.chatbubble.petrespect","petname",this.var_891);
            this.var_244 = const_978;
         }
         else if(this.var_337 == null)
         {
            textWindow.text = this.message;
         }
         else
         {
            this.var_717 = new Array();
            lastLinkEndPos = -1;
            i = 0;
            while(i < this.var_337.length)
            {
               filteredLink = this.var_337[i][1];
               placeHolder = "{" + i + "}";
               placeholderPos = this._message.indexOf(placeHolder);
               lastLinkEndPos = placeholderPos + filteredLink.length;
               this.var_717.push([placeholderPos,lastLinkEndPos]);
               this._message = this._message.replace(placeHolder,filteredLink);
               i++;
            }
            textWindow.text = this.message;
            textWindow.immediateClickMode = true;
            textWindow.setParamFlag(WindowParam.const_33,false);
            textWindow.setParamFlag(WindowParam.WINDOW_PARAM_FORCE_CLIPPING,true);
            linkFormat = textWindow.getTextFormat();
            linkFormat.color = 5923473;
            linkFormat.underline = true;
            i = 0;
            while(i < this.var_717.length)
            {
               linkPos = this.var_717[i];
               try
               {
                  textWindow.setTextFormat(linkFormat,linkPos[0],linkPos[1]);
               }
               catch(e:RangeError)
               {
                  Logger.log("Chat message links were malformed. Could not set TextFormat");
               }
               i++;
            }
         }
         if(textWindow.visible)
         {
            textWindow.x = this.var_244;
            if(nameWindow != null)
            {
               textWindow.x = nameWindow.x + nameWindow.width;
               if(nameWindow.width > const_641)
               {
                  textWindow.x -= const_641 - 1;
               }
            }
            textWindow.y += this.var_718;
            messageWidth = textWindow.textWidth;
            textWindow.width = messageWidth + const_1308;
            this.var_244 += textWindow.width;
         }
         if(pointerWindow != null && pointerWindow.visible)
         {
            pointerWindow.bitmap = pointerBitmapData;
            pointerWindow.disposesBitmap = false;
            pointerWindow.x = this.var_244 / 2;
            pointerWindow.y += this.var_718;
         }
         var bitmap:BitmapData = this.buildBubbleImage(nameWindow.width + textWindow.width,background.height,this.var_2182,isRespect);
         this._window.width = bitmap.width;
         this._window.y -= this.var_718;
         this.var_244 = this._window.width;
         background.bitmap = bitmap;
         background.y = this.var_718;
      }
      
      private function buildBubbleImage(param1:int, param2:int, param3:uint, param4:Boolean) : BitmapData
      {
         var _loc13_:* = null;
         var _loc14_:* = 0;
         var _loc15_:* = 0;
         var _loc16_:* = 0;
         var _loc5_:BitmapData = this._assetLibrary.getAssetByName("chat_bubble_left" + this.var_582).content as BitmapData;
         var _loc6_:BitmapData = this._assetLibrary.getAssetByName("chat_bubble_middle" + this.var_582).content as BitmapData;
         var _loc7_:BitmapData = this._assetLibrary.getAssetByName("chat_bubble_left_color" + this.var_582).content as BitmapData;
         var _loc8_:BitmapData = this._assetLibrary.getAssetByName("chat_bubble_right" + this.var_582).content as BitmapData;
         var _loc9_:int = 0;
         var _loc10_:Point = new Point();
         var _loc11_:BitmapData = new BitmapData(_loc5_.width + param1 + _loc8_.width,param2,true,16711935);
         _loc9_ += _loc5_.width;
         _loc11_.copyPixels(_loc5_,_loc5_.rect,_loc10_);
         if(param4)
         {
            _loc13_ = this._assetLibrary.getAssetByName("chat_bubble_left_gen" + this.var_582).content as BitmapData;
            _loc11_.copyPixels(_loc13_,_loc13_.rect,_loc10_,null,null,true);
         }
         else
         {
            _loc14_ = 232;
            _loc15_ = 177;
            _loc16_ = 55;
            if(param3 != 0)
            {
               _loc14_ = uint(param3 >> 16 & 255);
               _loc15_ = uint(param3 >> 8 & 255);
               _loc16_ = uint(param3 >> 0 & 255);
            }
            _loc11_.draw(_loc7_,null,new ColorTransform(_loc14_ / 255,_loc15_ / 255,_loc16_ / 255),BlendMode.DARKEN);
         }
         var _loc12_:Matrix = new Matrix();
         _loc12_.scale(param1 / _loc6_.width,1);
         _loc12_.translate(_loc9_,0);
         _loc11_.draw(_loc6_,_loc12_);
         _loc9_ += param1;
         _loc10_.x = _loc9_;
         _loc11_.copyPixels(_loc8_,_loc8_.rect,_loc10_);
         _loc9_ += _loc8_.width;
         return _loc11_;
      }
      
      public function enableTooltip() : void
      {
         if(this._window != null)
         {
            this._window.toolTipCaption = "${chat.history.drag.tooltip}";
            this._window.toolTipDelay = 500;
         }
      }
      
      public function disableTooltip() : void
      {
         if(this._window != null)
         {
            this._window.toolTipCaption = "";
         }
      }
      
      private function addEventListeners(param1:IWindowContainer) : void
      {
         param1.setParamFlag(HabboWindowParam.const_38,true);
         param1.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onBubbleMouseClick);
         param1.addEventListener(WindowMouseEvent.const_42,this.onBubbleMouseDown);
         param1.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,this.onBubbleMouseOver);
         param1.addEventListener(WindowMouseEvent.const_25,this.onBubbleMouseOut);
         param1.addEventListener(WindowMouseEvent.const_52,this.onBubbleMouseUp);
      }
      
      private function testMessageLinkMouseClick(param1:int, param2:int) : Boolean
      {
         var _loc5_:int = 0;
         var _loc3_:ITextWindow = this._window.getChildByName(const_977) as ITextWindow;
         var _loc4_:int = _loc3_.getCharIndexAtPoint(param1 - _loc3_.x,param2 - _loc3_.y);
         if(_loc4_ > -1)
         {
            _loc5_ = 0;
            while(_loc5_ < this.var_717.length)
            {
               if(_loc4_ >= this.var_717[_loc5_][0] && _loc4_ <= this.var_717[_loc5_][1])
               {
                  if(this.var_337[_loc5_][2] == 0)
                  {
                     HabboWebTools.openExternalLinkWarning(this.var_337[_loc5_][0]);
                  }
                  else if(this.var_337[_loc5_][2] == 1)
                  {
                     HabboWebTools.openWebPage(this._siteUrl + this.var_337[_loc5_][0],"habboMain");
                  }
                  else
                  {
                     HabboWebTools.openWebPage(this._siteUrl + this.var_337[_loc5_][0]);
                  }
                  return true;
               }
               _loc5_++;
            }
         }
         return false;
      }
      
      private function onBubbleMouseClick(param1:WindowMouseEvent) : void
      {
         if(this.var_337 && this.var_337.length > 0)
         {
            if(this.testMessageLinkMouseClick(param1.localX,param1.localY))
            {
               return;
            }
         }
         this._widget.onItemMouseClick(this.var_1096,this.var_891,this._senderCategory,this._roomId,this._roomCategory,param1);
      }
      
      private function onBubbleMouseDown(param1:WindowMouseEvent) : void
      {
         this._widget.onItemMouseDown(this.var_1096,this._senderCategory,this._roomId,this._roomCategory,param1);
      }
      
      private function onBubbleMouseOver(param1:WindowMouseEvent) : void
      {
         this._widget.onItemMouseOver(this.var_1096,this._senderCategory,this._roomId,this._roomCategory,param1);
      }
      
      private function onBubbleMouseOut(param1:WindowMouseEvent) : void
      {
         this._widget.onItemMouseOut(this.var_1096,this._senderCategory,this._roomId,this._roomCategory,param1);
      }
      
      private function onBubbleMouseUp(param1:WindowMouseEvent) : void
      {
         this._widget.mouseUp();
      }
   }
}
