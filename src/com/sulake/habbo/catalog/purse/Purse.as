package com.sulake.habbo.catalog.purse
{
   import flash.utils.Dictionary;
   
   public class Purse implements IPurse
   {
      
      public static const const_212:int = 0;
       
      
      private var var_2065:int = 0;
      
      private var var_1500:Dictionary;
      
      private var var_1902:int = 0;
      
      private var var_1901:int = 0;
      
      private var var_2340:Boolean = false;
      
      private var var_2337:int = 0;
      
      private var var_2334:int = 0;
      
      public function Purse()
      {
         this.var_1500 = new Dictionary();
         super();
      }
      
      public function get credits() : int
      {
         return this.var_2065;
      }
      
      public function set credits(param1:int) : void
      {
         this.var_2065 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_1902;
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_1902 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_1901;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_1901 = param1;
      }
      
      public function get hasClubLeft() : Boolean
      {
         return this.var_1902 > 0 || this.var_1901 > 0;
      }
      
      public function get method_1() : Boolean
      {
         return this.var_2340;
      }
      
      public function set method_1(param1:Boolean) : void
      {
         this.var_2340 = param1;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2337;
      }
      
      public function set pastClubDays(param1:int) : void
      {
         this.var_2337 = param1;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2334;
      }
      
      public function set pastVipDays(param1:int) : void
      {
         this.var_2334 = param1;
      }
      
      public function get activityPoints() : Dictionary
      {
         return this.var_1500;
      }
      
      public function set activityPoints(param1:Dictionary) : void
      {
         this.var_1500 = param1;
      }
      
      public function getActivityPointsForType(param1:int) : int
      {
         return this.var_1500[param1];
      }
   }
}
