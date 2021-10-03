package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDanceMessage extends RoomWidgetMessage
   {
      
      public static const const_919:String = "RWCM_MESSAGE_DANCE";
      
      public static const const_1210:int = 0;
      
      public static const const_1751:Array = [2,3,4];
       
      
      private var var_79:int = 0;
      
      public function RoomWidgetDanceMessage(param1:int)
      {
         super(const_919);
         this.var_79 = param1;
      }
      
      public function get style() : int
      {
         return this.var_79;
      }
   }
}
