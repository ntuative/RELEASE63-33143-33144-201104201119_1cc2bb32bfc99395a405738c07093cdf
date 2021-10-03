package com.sulake.core.runtime.events
{
   public class ErrorEvent extends WarningEvent
   {
       
      
      protected var var_2904:Boolean;
      
      protected var var_2059:String;
      
      public function ErrorEvent(param1:String, param2:String, param3:Boolean, param4:String = null)
      {
         this.var_2904 = param3;
         this.var_2059 = param4;
         super(param1,param2);
      }
      
      public function get critical() : Boolean
      {
         return this.var_2904;
      }
      
      public function get method_13() : String
      {
         return this.var_2059;
      }
   }
}
