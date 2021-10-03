package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChargeInfo
   {
       
      
      private var var_2845:int;
      
      private var var_2847:int;
      
      private var var_1200:int;
      
      private var var_1198:int;
      
      private var var_1851:int;
      
      private var var_2846:int;
      
      public function ChargeInfo(param1:IMessageDataWrapper)
      {
         super();
         this.var_2845 = param1.readInteger();
         this.var_2847 = param1.readInteger();
         this.var_1200 = param1.readInteger();
         this.var_1198 = param1.readInteger();
         this.var_1851 = param1.readInteger();
         this.var_2846 = param1.readInteger();
      }
      
      public function get stuffId() : int
      {
         return this.var_2845;
      }
      
      public function get charges() : int
      {
         return this.var_2847;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1200;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1198;
      }
      
      public function get chargePatchSize() : int
      {
         return this.var_2846;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1851;
      }
   }
}
