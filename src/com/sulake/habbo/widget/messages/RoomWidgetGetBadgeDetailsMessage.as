package com.sulake.habbo.widget.messages
{
   public class RoomWidgetGetBadgeDetailsMessage extends RoomWidgetMessage
   {
      
      public static const const_740:String = "RWGOI_MESSAGE_GET_BADGE_DETAILS";
       
      
      private var var_1467:int = 0;
      
      public function RoomWidgetGetBadgeDetailsMessage(param1:int)
      {
         super(const_740);
         this.var_1467 = param1;
      }
      
      public function get groupId() : int
      {
         return this.var_1467;
      }
   }
}
