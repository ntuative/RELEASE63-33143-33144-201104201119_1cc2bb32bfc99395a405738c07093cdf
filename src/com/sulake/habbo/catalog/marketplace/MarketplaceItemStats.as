package com.sulake.habbo.catalog.marketplace
{
   public class MarketplaceItemStats
   {
       
      
      private var var_2194:int;
      
      private var var_2610:int;
      
      private var var_2608:int;
      
      private var _dayOffsets:Array;
      
      private var var_1881:Array;
      
      private var var_1882:Array;
      
      private var var_2609:int;
      
      private var var_2611:int;
      
      public function MarketplaceItemStats()
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
      
      public function set averagePrice(param1:int) : void
      {
         this.var_2194 = param1;
      }
      
      public function set offerCount(param1:int) : void
      {
         this.var_2610 = param1;
      }
      
      public function set historyLength(param1:int) : void
      {
         this.var_2608 = param1;
      }
      
      public function set dayOffsets(param1:Array) : void
      {
         this._dayOffsets = param1.slice();
      }
      
      public function set averagePrices(param1:Array) : void
      {
         this.var_1881 = param1.slice();
      }
      
      public function set soldAmounts(param1:Array) : void
      {
         this.var_1882 = param1.slice();
      }
      
      public function set furniTypeId(param1:int) : void
      {
         this.var_2609 = param1;
      }
      
      public function set furniCategoryId(param1:int) : void
      {
         this.var_2611 = param1;
      }
   }
}
