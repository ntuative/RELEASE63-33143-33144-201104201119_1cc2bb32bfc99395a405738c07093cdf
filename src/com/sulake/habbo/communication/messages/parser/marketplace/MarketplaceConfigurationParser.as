package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_1511:Boolean;
      
      private var var_2642:int;
      
      private var var_1904:int;
      
      private var var_1905:int;
      
      private var var_2643:int;
      
      private var var_2644:int;
      
      private var var_2641:int;
      
      private var var_2363:int;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get isEnabled() : Boolean
      {
         return this.var_1511;
      }
      
      public function get commission() : int
      {
         return this.var_2642;
      }
      
      public function get tokenBatchPrice() : int
      {
         return this.var_1904;
      }
      
      public function get tokenBatchSize() : int
      {
         return this.var_1905;
      }
      
      public function get offerMinPrice() : int
      {
         return this.var_2644;
      }
      
      public function get offerMaxPrice() : int
      {
         return this.var_2643;
      }
      
      public function get expirationHours() : int
      {
         return this.var_2641;
      }
      
      public function get averagePricePeriod() : int
      {
         return this.var_2363;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1511 = param1.readBoolean();
         this.var_2642 = param1.readInteger();
         this.var_1904 = param1.readInteger();
         this.var_1905 = param1.readInteger();
         this.var_2644 = param1.readInteger();
         this.var_2643 = param1.readInteger();
         this.var_2641 = param1.readInteger();
         this.var_2363 = param1.readInteger();
         return true;
      }
   }
}
