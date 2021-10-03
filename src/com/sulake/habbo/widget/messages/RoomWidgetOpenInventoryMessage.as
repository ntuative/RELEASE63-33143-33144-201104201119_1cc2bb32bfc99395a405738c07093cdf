package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_815:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_1077:String = "inventory_effects";
      
      public static const const_1064:String = "inventory_badges";
      
      public static const const_1580:String = "inventory_clothes";
      
      public static const const_1659:String = "inventory_furniture";
       
      
      private var var_2650:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_815);
         this.var_2650 = param1;
      }
      
      public function get inventoryType() : String
      {
         return this.var_2650;
      }
   }
}
