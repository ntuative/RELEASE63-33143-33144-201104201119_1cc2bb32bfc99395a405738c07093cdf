package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.MouseCursorType;
   import flash.display.DisplayObject;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.ui.Mouse;
   import flash.ui.MouseCursor;
   import flash.utils.Dictionary;
   
   public class MouseCursorControl
   {
      
      private static var _type:uint = MouseCursorType.const_30;
      
      private static var var_142:Stage;
      
      private static var var_310:Boolean = true;
      
      private static var _disposed:Boolean = false;
      
      private static var var_795:Boolean = true;
      
      private static var var_123:DisplayObject;
      
      private static var var_1502:Dictionary = new Dictionary();
       
      
      public function MouseCursorControl(param1:DisplayObject)
      {
         super();
         var_142 = param1.stage;
      }
      
      public static function dispose() : void
      {
         if(!_disposed)
         {
            if(var_123)
            {
               var_142.removeChild(var_123);
               var_142.removeEventListener(Event.MOUSE_LEAVE,onStageMouseLeave);
               var_142.removeEventListener(MouseEvent.MOUSE_MOVE,onStageMouseMove);
               var_142.removeEventListener(MouseEvent.MOUSE_OVER,onStageMouseMove);
               var_142.removeEventListener(MouseEvent.MOUSE_OUT,onStageMouseMove);
            }
            _disposed = true;
         }
      }
      
      public static function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public static function get type() : uint
      {
         return _type;
      }
      
      public static function set type(param1:uint) : void
      {
         if(_type != param1)
         {
            _type = param1;
            var_795 = true;
         }
      }
      
      public static function get visible() : Boolean
      {
         return var_310;
      }
      
      public static function set visible(param1:Boolean) : void
      {
         var_310 = param1;
         if(var_310)
         {
            if(var_123)
            {
               var_123.visible = true;
            }
            else
            {
               Mouse.show();
            }
         }
         else if(var_123)
         {
            var_123.visible = false;
         }
         else
         {
            Mouse.hide();
         }
      }
      
      public static function change() : void
      {
         var _loc1_:* = null;
         if(var_795)
         {
            _loc1_ = var_1502[_type];
            if(_loc1_)
            {
               if(var_123)
               {
                  var_142.removeChild(var_123);
               }
               else
               {
                  var_142.addEventListener(Event.MOUSE_LEAVE,onStageMouseLeave);
                  var_142.addEventListener(MouseEvent.MOUSE_MOVE,onStageMouseMove);
                  var_142.addEventListener(MouseEvent.MOUSE_OVER,onStageMouseMove);
                  var_142.addEventListener(MouseEvent.MOUSE_OUT,onStageMouseMove);
                  Mouse.hide();
               }
               var_123 = _loc1_;
               var_142.addChild(var_123);
            }
            else
            {
               if(var_123)
               {
                  var_142.removeChild(var_123);
                  var_142.removeEventListener(Event.MOUSE_LEAVE,onStageMouseLeave);
                  var_142.removeEventListener(MouseEvent.MOUSE_MOVE,onStageMouseMove);
                  var_142.removeEventListener(MouseEvent.MOUSE_OVER,onStageMouseMove);
                  var_142.removeEventListener(MouseEvent.MOUSE_OUT,onStageMouseMove);
                  var_123 = null;
                  Mouse.show();
               }
               switch(_type)
               {
                  case MouseCursorType.const_30:
                  case MouseCursorType.ARROW:
                     Mouse.cursor = MouseCursor.ARROW;
                     break;
                  case MouseCursorType.const_353:
                     Mouse.cursor = MouseCursor.BUTTON;
                     break;
                  case MouseCursorType.const_1174:
                  case MouseCursorType.const_269:
                  case MouseCursorType.const_1731:
                  case MouseCursorType.const_1592:
                     Mouse.cursor = MouseCursor.HAND;
                     break;
                  case MouseCursorType.NONE:
                     Mouse.cursor = MouseCursor.ARROW;
                     Mouse.hide();
               }
            }
            var_795 = false;
         }
      }
      
      public static function defineCustomCursorType(param1:uint, param2:DisplayObject) : void
      {
         var_1502[param1] = param2;
      }
      
      private static function onStageMouseMove(param1:MouseEvent) : void
      {
         if(var_123)
         {
            var_123.x = param1.stageX - 2;
            var_123.y = param1.stageY;
            if(_type == MouseCursorType.const_30)
            {
               var_310 = false;
               Mouse.show();
            }
            else
            {
               var_310 = true;
               Mouse.hide();
            }
         }
      }
      
      private static function onStageMouseLeave(param1:Event) : void
      {
         if(var_123 && _type != MouseCursorType.const_30)
         {
            Mouse.hide();
            var_310 = false;
         }
      }
   }
}
