package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenCatalogMessage extends RoomWidgetMessage
   {
      
      public static const const_364:String = "RWGOI_MESSAGE_OPEN_CATALOG";
      
      public static const const_1232:String = "RWOCM_CLUB_MAIN";
      
      public static const const_1104:String = "RWOCM_PIXELS";
      
      public static const const_1070:String = "RWOCM_CREDITS";
       
      
      private var var_2402:String = "";
      
      public function RoomWidgetOpenCatalogMessage(param1:String)
      {
         super(const_364);
         this.var_2402 = param1;
      }
      
      public function get pageKey() : String
      {
         return this.var_2402;
      }
   }
}
