package com.sulake.habbo.widget.messages
{
   public class RoomWidgetSelectEffectMessage extends RoomWidgetMessage
   {
      
      public static const const_948:String = "RWCM_MESSAGE_SELECT_EFFECT";
      
      public static const const_849:String = "RWCM_MESSAGE_UNSELECT_EFFECT";
      
      public static const const_941:String = "RWCM_MESSAGE_UNSELECT_ALL_EFFECTS";
       
      
      private var var_732:int;
      
      public function RoomWidgetSelectEffectMessage(param1:String, param2:int = -1)
      {
         super(param1);
         this.var_732 = param2;
      }
      
      public function get effectType() : int
      {
         return this.var_732;
      }
   }
}
