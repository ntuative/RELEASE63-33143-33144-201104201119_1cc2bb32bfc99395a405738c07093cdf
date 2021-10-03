package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceItemStatsParser implements IMessageParser
   {
       
      
      private var var_2194:int;
      
      private var var_2610:int;
      
      private var var_2608:int;
      
      private var _dayOffsets:Array;
      
      private var var_1881:Array;
      
      private var var_1882:Array;
      
      private var var_2609:int;
      
      private var var_2611:int;
      
      public function MarketplaceItemStatsParser()
      {
         super();
      }
      
      public function get averagePrice() : int
      {
         return this.var_2194;
      }
      
      public function get offerCount() : int
      {
         return this.var_2610;
      }
      
      public function get historyLength() : int
      {
         return this.var_2608;
      }
      
      public function get dayOffsets() : Array
      {
         return this._dayOffsets;
      }
      
      public function get averagePrices() : Array
      {
         return this.var_1881;
      }
      
      public function get soldAmounts() : Array
      {
         return this.var_1882;
      }
      
      public function get furniTypeId() : int
      {
         return this.var_2609;
      }
      
      public function get furniCategoryId() : int
      {
         return this.var_2611;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2194 = param1.readInteger();
         this.var_2610 = param1.readInteger();
         this.var_2608 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         this._dayOffsets = [];
         this.var_1881 = [];
         this.var_1882 = [];
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this._dayOffsets.push(param1.readInteger());
            this.var_1881.push(param1.readInteger());
            this.var_1882.push(param1.readInteger());
            _loc3_++;
         }
         this.var_2611 = param1.readInteger();
         this.var_2609 = param1.readInteger();
         return true;
      }
   }
}
