package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageOfferData
   {
       
      
      private var _offerId:int;
      
      private var var_1852:String;
      
      private var var_1200:int;
      
      private var var_1198:int;
      
      private var var_1851:int;
      
      private var var_1310:Array;
      
      public function CatalogPageMessageOfferData(param1:IMessageDataWrapper)
      {
         super();
         this._offerId = param1.readInteger();
         this.var_1852 = param1.readString();
         this.var_1200 = param1.readInteger();
         this.var_1198 = param1.readInteger();
         this.var_1851 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         this.var_1310 = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.var_1310.push(new CatalogPageMessageProductData(param1));
            _loc3_++;
         }
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
      
      public function get products() : Array
      {
         return this.var_1310;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1851;
      }
   }
}
