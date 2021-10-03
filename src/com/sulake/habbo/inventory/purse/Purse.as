package com.sulake.habbo.inventory.purse
{
   public class Purse
   {
       
      
      private var var_1902:int = 0;
      
      private var var_1901:int = 0;
      
      private var var_2520:int = 0;
      
      private var var_2519:Boolean = false;
      
      private var var_2340:Boolean = false;
      
      public function Purse()
      {
         super();
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_1902 = Math.max(0,param1);
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_1901 = Math.max(0,param1);
      }
      
      public function set clubPastPeriods(param1:int) : void
      {
         this.var_2520 = Math.max(0,param1);
      }
      
      public function set clubHasEverBeenMember(param1:Boolean) : void
      {
         this.var_2519 = param1;
      }
      
      public function set method_1(param1:Boolean) : void
      {
         this.var_2340 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_1902;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_1901;
      }
      
      public function get clubPastPeriods() : int
      {
         return this.var_2520;
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return this.var_2519;
      }
      
      public function get method_1() : Boolean
      {
         return this.var_2340;
      }
   }
}
