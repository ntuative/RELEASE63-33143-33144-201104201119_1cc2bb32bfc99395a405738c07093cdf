package com.sulake.habbo.toolbar
{
   public class MenuSettingsItem
   {
       
      
      private var var_2175:String;
      
      private var var_2172:Array;
      
      private var var_2173:Boolean;
      
      public function MenuSettingsItem(param1:String, param2:Array = null, param3:Boolean = false)
      {
         super();
         this.var_2175 = param1;
         this.var_2172 = param2;
         this.var_2173 = param3;
      }
      
      public function get menuId() : String
      {
         return this.var_2175;
      }
      
      public function get yieldList() : Array
      {
         return this.var_2172;
      }
      
      public function get lockToIcon() : Boolean
      {
         return this.var_2173;
      }
   }
}
