package com.sulake.habbo.widget.events
{
   public class RoomWidgetCreditFurniUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_839:String = "RWCFUE_CREDIT_FURNI_UPDATE";
       
      
      private var var_369:int;
      
      private var var_2624:Number;
      
      public function RoomWidgetCreditFurniUpdateEvent(param1:String, param2:int, param3:Number, param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param4,param5);
         this.var_2624 = param3;
         this.var_369 = param2;
      }
      
      public function get creditValue() : Number
      {
         return this.var_2624;
      }
      
      public function get objectId() : int
      {
         return this.var_369;
      }
   }
}
