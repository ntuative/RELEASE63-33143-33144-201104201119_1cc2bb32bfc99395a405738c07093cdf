package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer implements IPurchasableOffer
   {
      
      public static const const_1638:String = "pricing_model_unknown";
      
      public static const const_365:String = "pricing_model_single";
      
      public static const const_399:String = "pricing_model_multi";
      
      public static const const_573:String = "pricing_model_bundle";
      
      public static const const_1539:String = "price_type_none";
      
      public static const const_677:String = "price_type_credits";
      
      public static const const_1120:String = "price_type_activitypoints";
      
      public static const const_1080:String = "price_type_credits_and_activitypoints";
       
      
      private var var_777:String;
      
      private var var_1199:String;
      
      private var _offerId:int;
      
      private var var_1852:String;
      
      private var var_1200:int;
      
      private var var_1198:int;
      
      private var var_1851:int;
      
      private var var_380:ICatalogPage;
      
      private var var_643:IProductContainer;
      
      private var var_2559:int;
      
      public function Offer(param1:int, param2:String, param3:int, param4:int, param5:int, param6:Array, param7:ICatalogPage)
      {
         super();
         this._offerId = param1;
         this.var_1852 = param2;
         this.var_1200 = param3;
         this.var_1198 = param4;
         this.var_1851 = param5;
         this.var_380 = param7;
         this.analyzePricingModel(param6);
         this.analyzePriceType();
         this.createProductContainer(param6);
      }
      
      public function get page() : ICatalogPage
      {
         return this.var_380;
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get localizationId() : String
      {
         return this.var_1852;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1200;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1198;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1851;
      }
      
      public function get productContainer() : IProductContainer
      {
         return this.var_643;
      }
      
      public function get pricingModel() : String
      {
         return this.var_777;
      }
      
      public function get priceType() : String
      {
         return this.var_1199;
      }
      
      public function get previewCallbackId() : int
      {
         return this.var_2559;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         this.var_2559 = param1;
      }
      
      public function dispose() : void
      {
         this._offerId = 0;
         this.var_1852 = "";
         this.var_1200 = 0;
         this.var_1198 = 0;
         this.var_1851 = 0;
         this.var_380 = null;
         if(this.var_643 != null)
         {
            this.var_643.dispose();
            this.var_643 = null;
         }
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(this.var_777)
         {
            case const_365:
               this.var_643 = new SingleProductContainer(this,param1);
               break;
            case const_399:
               this.var_643 = new MultiProductContainer(this,param1);
               break;
            case const_573:
               this.var_643 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + this.var_777);
         }
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               this.var_777 = const_365;
            }
            else
            {
               this.var_777 = const_399;
            }
         }
         else if(param1.length > 1)
         {
            this.var_777 = const_573;
         }
         else
         {
            this.var_777 = const_1638;
         }
      }
      
      private function analyzePriceType() : void
      {
         if(this.var_1200 > 0 && this.var_1198 > 0)
         {
            this.var_1199 = const_1080;
         }
         else if(this.var_1200 > 0)
         {
            this.var_1199 = const_677;
         }
         else if(this.var_1198 > 0)
         {
            this.var_1199 = const_1120;
         }
         else
         {
            this.var_1199 = const_1539;
         }
      }
      
      public function clone() : Offer
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc1_:Array = new Array();
         var _loc2_:IProductData = this.var_380.viewer.catalog.getProductData(this.localizationId);
         for each(_loc3_ in this.var_643.products)
         {
            _loc4_ = this.var_380.viewer.catalog.getFurnitureData(_loc3_.productClassId,_loc3_.productType);
            _loc5_ = new Product(_loc3_.productType,_loc3_.productClassId,_loc3_.extraParam,_loc3_.productCount,_loc3_.expiration,_loc2_,_loc4_);
            _loc1_.push(_loc5_);
         }
         return new Offer(this.offerId,this.localizationId,this.priceInCredits,this.priceInActivityPoints,this.activityPointType,_loc1_,this.page);
      }
   }
}
