package com.sulake.habbo.catalog.club
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.catalog.purse.Purse;
   import com.sulake.habbo.catalog.viewer.ICatalogPage;
   import com.sulake.habbo.catalog.viewer.IProductContainer;
   import com.sulake.habbo.catalog.viewer.Offer;
   
   public class ClubBuyOfferData implements IPurchasableOffer
   {
       
      
      private var _offerId:int;
      
      private var var_1740:String;
      
      private var var_1739:int;
      
      private var var_2312:Boolean;
      
      private var var_2306:Boolean;
      
      private var var_2309:int;
      
      private var var_2311:int;
      
      private var var_380:ICatalogPage;
      
      private var var_2307:int;
      
      private var var_2313:int;
      
      private var var_2310:int;
      
      private var var_1421:String;
      
      private var var_2308:Boolean = false;
      
      public function ClubBuyOfferData(param1:int, param2:String, param3:int, param4:Boolean, param5:Boolean, param6:int, param7:int, param8:int, param9:int, param10:int)
      {
         super();
         this._offerId = param1;
         this.var_1740 = param2;
         this.var_1739 = param3;
         this.var_2312 = param4;
         this.var_2306 = param5;
         this.var_2309 = param6;
         this.var_2311 = param7;
         this.var_2307 = param8;
         this.var_2313 = param9;
         this.var_2310 = param10;
      }
      
      public function dispose() : void
      {
      }
      
      public function get extraParameter() : String
      {
         return this.var_1421;
      }
      
      public function set extraParameter(param1:String) : void
      {
         this.var_1421 = param1;
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get productCode() : String
      {
         return this.var_1740;
      }
      
      public function get price() : int
      {
         return this.var_1739;
      }
      
      public function get upgrade() : Boolean
      {
         return this.var_2312;
      }
      
      public function get vip() : Boolean
      {
         return this.var_2306;
      }
      
      public function get periods() : int
      {
         return this.var_2309;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return this.var_2311;
      }
      
      public function get year() : int
      {
         return this.var_2307;
      }
      
      public function get month() : int
      {
         return this.var_2313;
      }
      
      public function get day() : int
      {
         return this.var_2310;
      }
      
      public function get priceInActivityPoints() : int
      {
         return 0;
      }
      
      public function get activityPointType() : int
      {
         return Purse.const_212;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1739;
      }
      
      public function get page() : ICatalogPage
      {
         return this.var_380;
      }
      
      public function get priceType() : String
      {
         return Offer.const_677;
      }
      
      public function get productContainer() : IProductContainer
      {
         return null;
      }
      
      public function get localizationId() : String
      {
         return this.var_1740;
      }
      
      public function set page(param1:ICatalogPage) : void
      {
         this.var_380 = param1;
      }
      
      public function get upgradeHcPeriodToVip() : Boolean
      {
         return this.var_2308;
      }
      
      public function set upgradeHcPeriodToVip(param1:Boolean) : void
      {
         this.var_2308 = param1;
      }
   }
}
