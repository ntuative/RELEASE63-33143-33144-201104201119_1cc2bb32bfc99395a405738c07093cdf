package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_65:String = "i";
      
      public static const const_77:String = "s";
      
      public static const const_185:String = "e";
       
      
      private var var_1585:String;
      
      private var var_2856:int;
      
      private var var_1291:String;
      
      private var _productCount:int;
      
      private var var_2051:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1585 = param1.readString();
         this.var_2856 = param1.readInteger();
         this.var_1291 = param1.readString();
         this._productCount = param1.readInteger();
         this.var_2051 = param1.readInteger();
      }
      
      public function get productType() : String
      {
         return this.var_1585;
      }
      
      public function get furniClassId() : int
      {
         return this.var_2856;
      }
      
      public function get extraParam() : String
      {
         return this.var_1291;
      }
      
      public function get productCount() : int
      {
         return this._productCount;
      }
      
      public function get expiration() : int
      {
         return this.var_2051;
      }
   }
}
