package com.sulake.habbo.widget.messages
{
   public class RoomWidgetGetBadgeImageMessage extends RoomWidgetMessage
   {
      
      public static const const_682:String = "RWGOI_MESSAGE_GET_BADGE_IMAGE";
       
      
      private var var_308:String = "";
      
      public function RoomWidgetGetBadgeImageMessage(param1:String)
      {
         super(const_682);
         this.var_308 = param1;
      }
      
      public function get badgeId() : String
      {
         return this.var_308;
      }
   }
}
