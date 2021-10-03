package com.sulake.habbo.room.object.visualization.room
{
   public class RoomPlaneRectangleMask
   {
       
      
      private var var_2728:Number = 0.0;
      
      private var var_2727:Number = 0.0;
      
      private var var_2838:Number = 0.0;
      
      private var var_2837:Number = 0.0;
      
      public function RoomPlaneRectangleMask(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         this.var_2728 = param1;
         this.var_2727 = param2;
         this.var_2838 = param3;
         this.var_2837 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return this.var_2728;
      }
      
      public function get rightSideLoc() : Number
      {
         return this.var_2727;
      }
      
      public function get leftSideLength() : Number
      {
         return this.var_2838;
      }
      
      public function get rightSideLength() : Number
      {
         return this.var_2837;
      }
   }
}
