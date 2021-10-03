package com.sulake.habbo.widget.messages
{
   public class RoomWidgetPetCommandMessage extends RoomWidgetMessage
   {
      
      public static const const_834:String = "RWPCM_REQUEST_PET_COMMANDS";
      
      public static const const_607:String = "RWPCM_PET_COMMAND";
       
      
      private var var_1750:int = 0;
      
      private var var_195:String;
      
      public function RoomWidgetPetCommandMessage(param1:String, param2:int, param3:String = null)
      {
         super(param1);
         this.var_1750 = param2;
         this.var_195 = param3;
      }
      
      public function get petId() : int
      {
         return this.var_1750;
      }
      
      public function get value() : String
      {
         return this.var_195;
      }
   }
}
