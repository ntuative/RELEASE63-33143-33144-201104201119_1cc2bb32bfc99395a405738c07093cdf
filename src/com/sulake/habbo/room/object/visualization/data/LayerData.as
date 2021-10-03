package com.sulake.habbo.room.object.visualization.data
{
   public class LayerData
   {
      
      public static const const_725:String = "";
      
      public static const const_421:int = 0;
      
      public static const const_519:int = 255;
      
      public static const const_868:Boolean = false;
      
      public static const const_623:int = 0;
      
      public static const const_593:int = 0;
      
      public static const const_408:int = 0;
      
      public static const const_1249:int = 1;
      
      public static const const_1100:int = 2;
      
      public static const INK_DARKEN:int = 3;
       
      
      private var var_2237:String = "";
      
      private var var_1939:int = 0;
      
      private var var_2444:int = 255;
      
      private var var_2679:Boolean = false;
      
      private var var_2677:int = 0;
      
      private var var_2680:int = 0;
      
      private var var_2678:Number = 0;
      
      public function LayerData()
      {
         super();
      }
      
      public function set tag(param1:String) : void
      {
         this.var_2237 = param1;
      }
      
      public function get tag() : String
      {
         return this.var_2237;
      }
      
      public function set ink(param1:int) : void
      {
         this.var_1939 = param1;
      }
      
      public function get ink() : int
      {
         return this.var_1939;
      }
      
      public function set alpha(param1:int) : void
      {
         this.var_2444 = param1;
      }
      
      public function get alpha() : int
      {
         return this.var_2444;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         this.var_2679 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return this.var_2679;
      }
      
      public function set xOffset(param1:int) : void
      {
         this.var_2677 = param1;
      }
      
      public function get xOffset() : int
      {
         return this.var_2677;
      }
      
      public function set yOffset(param1:int) : void
      {
         this.var_2680 = param1;
      }
      
      public function get yOffset() : int
      {
         return this.var_2680;
      }
      
      public function set zOffset(param1:Number) : void
      {
         this.var_2678 = param1;
      }
      
      public function get zOffset() : Number
      {
         return this.var_2678;
      }
      
      public function copyValues(param1:LayerData) : void
      {
         if(param1 != null)
         {
            this.tag = param1.tag;
            this.ink = param1.ink;
            this.alpha = param1.alpha;
            this.ignoreMouse = param1.ignoreMouse;
            this.xOffset = param1.xOffset;
            this.yOffset = param1.yOffset;
            this.zOffset = param1.zOffset;
         }
      }
   }
}
