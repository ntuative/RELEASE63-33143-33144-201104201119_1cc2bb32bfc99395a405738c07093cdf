package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_932:String = "RWSDPM_SAVE_PRESET";
       
      
      private var var_2398:int;
      
      private var var_2396:int;
      
      private var _color:uint;
      
      private var var_1297:int;
      
      private var var_2397:Boolean;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_932);
         this.var_2398 = param1;
         this.var_2396 = param2;
         this._color = param3;
         this.var_1297 = param4;
         this.var_2397 = param5;
      }
      
      public function get presetNumber() : int
      {
         return this.var_2398;
      }
      
      public function get effectTypeId() : int
      {
         return this.var_2396;
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function get brightness() : int
      {
         return this.var_1297;
      }
      
      public function get apply() : Boolean
      {
         return this.var_2397;
      }
   }
}
