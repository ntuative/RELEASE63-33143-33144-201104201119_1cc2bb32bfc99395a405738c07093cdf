package com.sulake.room.events
{
   public class RoomObjectMouseEvent extends RoomObjectEvent
   {
      
      public static const const_137:String = "ROE_MOUSE_CLICK";
      
      public static const const_1988:String = "ROE_MOUSE_ENTER";
      
      public static const const_502:String = "ROE_MOUSE_MOVE";
      
      public static const const_1862:String = "ROE_MOUSE_LEAVE";
      
      public static const const_1944:String = "ROE_MOUSE_DOUBLE_CLICK";
      
      public static const ROOM_OBJECT_MOUSE_DOWN:String = "ROE_MOUSE_DOWN";
       
      
      private var var_1680:String = "";
      
      private var var_2583:Boolean;
      
      private var var_2580:Boolean;
      
      private var var_2584:Boolean;
      
      private var var_2579:Boolean;
      
      public function RoomObjectMouseEvent(param1:String, param2:String, param3:int, param4:String, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false)
      {
         super(param1,param3,param4,param9,param10);
         this.var_1680 = param2;
         this.var_2583 = param5;
         this.var_2580 = param6;
         this.var_2584 = param7;
         this.var_2579 = param8;
      }
      
      public function get eventId() : String
      {
         return this.var_1680;
      }
      
      public function get altKey() : Boolean
      {
         return this.var_2583;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.var_2580;
      }
      
      public function get shiftKey() : Boolean
      {
         return this.var_2584;
      }
      
      public function get buttonDown() : Boolean
      {
         return this.var_2579;
      }
   }
}
