package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   
   public class WindowEvent
   {
      
      public static const const_1776:String = "WE_DESTROY";
      
      public static const const_352:String = "WE_DESTROYED";
      
      public static const const_1650:String = "WE_OPEN";
      
      public static const const_1519:String = "WE_OPENED";
      
      public static const const_1685:String = "WE_CLOSE";
      
      public static const const_1553:String = "WE_CLOSED";
      
      public static const const_1725:String = "WE_FOCUS";
      
      public static const const_328:String = "WE_FOCUSED";
      
      public static const const_1710:String = "WE_UNFOCUS";
      
      public static const const_1712:String = "WE_UNFOCUSED";
      
      public static const const_1621:String = "WE_ACTIVATE";
      
      public static const const_481:String = "WE_ACTIVATED";
      
      public static const const_1688:String = "WE_DEACTIVATE";
      
      public static const const_571:String = "WE_DEACTIVATED";
      
      public static const const_302:String = "WE_SELECT";
      
      public static const const_57:String = "WE_SELECTED";
      
      public static const const_514:String = "WE_UNSELECT";
      
      public static const const_477:String = "WE_UNSELECTED";
      
      public static const const_1600:String = "WE_LOCK";
      
      public static const const_1778:String = "WE_LOCKED";
      
      public static const const_1646:String = "WE_UNLOCK";
      
      public static const const_1515:String = "WE_UNLOCKED";
      
      public static const const_678:String = "WE_ENABLE";
      
      public static const const_237:String = "WE_ENABLED";
      
      public static const const_830:String = "WE_DISABLE";
      
      public static const const_186:String = "WE_DISABLED";
      
      public static const WINDOW_EVENT_RELOCATE:String = "WE_RELOCATE";
      
      public static const const_276:String = "WE_RELOCATED";
      
      public static const const_1234:String = "WE_RESIZE";
      
      public static const const_40:String = "WE_RESIZED";
      
      public static const const_1594:String = "WE_MINIMIZE";
      
      public static const const_1603:String = "WE_MINIMIZED";
      
      public static const const_1779:String = "WE_MAXIMIZE";
      
      public static const const_1537:String = "WE_MAXIMIZED";
      
      public static const const_1640:String = "WE_RESTORE";
      
      public static const const_1609:String = "WE_RESTORED";
      
      public static const const_453:String = "WE_CHILD_ADDED";
      
      public static const const_419:String = "WE_CHILD_REMOVED";
      
      public static const const_190:String = "WE_CHILD_RELOCATED";
      
      public static const const_146:String = "WE_CHILD_RESIZED";
      
      public static const const_340:String = "WE_CHILD_ACTIVATED";
      
      public static const const_534:String = "WE_PARENT_ADDED";
      
      public static const const_1748:String = "WE_PARENT_REMOVED";
      
      public static const const_1729:String = "WE_PARENT_RELOCATED";
      
      public static const const_691:String = "WE_PARENT_RESIZED";
      
      public static const const_1250:String = "WE_PARENT_ACTIVATED";
      
      public static const const_164:String = "WE_OK";
      
      public static const const_491:String = "WE_CANCEL";
      
      public static const const_101:String = "WE_CHANGE";
      
      public static const const_536:String = "WE_SCROLL";
      
      public static const const_174:String = "";
      
      private static const POOL:Array = [];
       
      
      protected var _type:String;
      
      protected var _window:IWindow;
      
      protected var var_706:IWindow;
      
      protected var var_1080:Boolean;
      
      protected var var_474:Boolean;
      
      protected var var_571:Boolean;
      
      protected var var_705:Array;
      
      public function WindowEvent()
      {
         super();
      }
      
      public static function allocate(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false) : WindowEvent
      {
         var _loc5_:WindowEvent = POOL.length > 0 ? POOL.pop() : new WindowEvent();
         _loc5_._type = param1;
         _loc5_._window = param2;
         _loc5_.var_706 = param3;
         _loc5_.var_474 = param4;
         _loc5_.var_571 = false;
         _loc5_.var_705 = POOL;
         return _loc5_;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get target() : IWindow
      {
         return this._window;
      }
      
      public function get window() : IWindow
      {
         return this._window;
      }
      
      public function get related() : IWindow
      {
         return this.var_706;
      }
      
      public function get cancelable() : Boolean
      {
         return this.var_474;
      }
      
      public function recycle() : void
      {
         if(this.var_571)
         {
            throw new Error("Event already recycled!");
         }
         this.var_706 = null;
         this._window = null;
         this.var_571 = true;
         this.var_1080 = false;
         this.var_705.push(this);
      }
      
      public function clone() : WindowEvent
      {
         return allocate(this._type,this.window,this.related,this.cancelable);
      }
      
      public function preventDefault() : void
      {
         this.preventWindowOperation();
      }
      
      public function isDefaultPrevented() : Boolean
      {
         return this.var_1080;
      }
      
      public function preventWindowOperation() : void
      {
         if(this.cancelable)
         {
            this.var_1080 = true;
            return;
         }
         throw new Error("Attempted to prevent window operation that is not cancelable!");
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return this.var_1080;
      }
      
      public function stopPropagation() : void
      {
         this.var_1080 = true;
      }
      
      public function stopImmediatePropagation() : void
      {
         this.var_1080 = true;
      }
      
      public function toString() : String
      {
         return "WindowEvent { type: " + this._type + " cancelable: " + this.var_474 + " window: " + this._window + " }";
      }
   }
}
