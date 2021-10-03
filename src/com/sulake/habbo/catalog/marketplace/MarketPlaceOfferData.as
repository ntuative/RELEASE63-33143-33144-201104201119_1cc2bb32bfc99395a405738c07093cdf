package com.sulake.habbo.catalog.marketplace
{
   import flash.display.BitmapData;
   
   public class MarketPlaceOfferData implements IMarketPlaceOfferData
   {
       
      
      private var _offerId:int;
      
      private var _furniId:int;
      
      private var var_2195:int;
      
      private var var_2122:String;
      
      private var var_1739:int;
      
      private var var_2194:int;
      
      private var var_2430:int;
      
      private var var_401:int;
      
      private var var_2193:int = -1;
      
      private var var_1793:int;
      
      private var var_49:BitmapData;
      
      public function MarketPlaceOfferData(param1:int, param2:int, param3:int, param4:String, param5:int, param6:int, param7:int, param8:int = -1)
      {
         super();
         this._offerId = param1;
         this._furniId = param2;
         this.var_2195 = param3;
         this.var_2122 = param4;
         this.var_1739 = param5;
         this.var_401 = param6;
         this.var_2194 = param7;
         this.var_1793 = param8;
      }
      
      public function dispose() : void
      {
         if(this.var_49)
         {
            this.var_49.dispose();
            this.var_49 = null;
         }
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get furniId() : int
      {
         return this._furniId;
      }
      
      public function get furniType() : int
      {
         return this.var_2195;
      }
      
      public function get stuffData() : String
      {
         return this.var_2122;
      }
      
      public function get price() : int
      {
         return this.var_1739;
      }
      
      public function get averagePrice() : int
      {
         return this.var_2194;
      }
      
      public function get image() : BitmapData
      {
         return this.var_49;
      }
      
      public function set image(param1:BitmapData) : void
      {
         if(this.var_49 != null)
         {
            this.var_49.dispose();
         }
         this.var_49 = param1;
      }
      
      public function set imageCallback(param1:int) : void
      {
         this.var_2430 = param1;
      }
      
      public function get imageCallback() : int
      {
         return this.var_2430;
      }
      
      public function get status() : int
      {
         return this.var_401;
      }
      
      public function get timeLeftMinutes() : int
      {
         return this.var_2193;
      }
      
      public function set timeLeftMinutes(param1:int) : void
      {
         this.var_2193 = param1;
      }
      
      public function set price(param1:int) : void
      {
         this.var_1739 = param1;
      }
      
      public function set offerId(param1:int) : void
      {
         this._offerId = param1;
      }
      
      public function get offerCount() : int
      {
         return this.var_1793;
      }
      
      public function set offerCount(param1:int) : void
      {
         this.var_1793 = param1;
      }
   }
}
