package com.sulake.habbo.toolbar
{
   public class ToolbarIconBouncer
   {
       
      
      private var var_2208:Number;
      
      private var var_2039:Number;
      
      private var var_897:Number;
      
      private var var_418:Number = 0;
      
      public function ToolbarIconBouncer(param1:Number, param2:Number)
      {
         super();
         this.var_2208 = param1;
         this.var_2039 = param2;
      }
      
      public function reset(param1:int) : void
      {
         this.var_897 = param1;
         this.var_418 = 0;
      }
      
      public function update() : void
      {
         this.var_897 += this.var_2039;
         this.var_418 += this.var_897;
         if(this.var_418 > 0)
         {
            this.var_418 = 0;
            this.var_897 = this.var_2208 * -1 * this.var_897;
         }
      }
      
      public function get location() : Number
      {
         return this.var_418;
      }
   }
}
