package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubOfferData
   {
       
      
      private var _offerId:int;
      
      private var var_1740:String;
      
      private var var_1739:int;
      
      private var var_2312:Boolean;
      
      private var var_2306:Boolean;
      
      private var var_2309:int;
      
      private var var_2311:int;
      
      private var var_2307:int;
      
      private var var_2313:int;
      
      private var var_2310:int;
      
      public function ClubOfferData(param1:IMessageDataWrapper)
      {
         super();
         this._offerId = param1.readInteger();
         this.var_1740 = param1.readString();
         this.var_1739 = param1.readInteger();
         this.var_2312 = param1.readBoolean();
         this.var_2306 = param1.readBoolean();
         this.var_2309 = param1.readInteger();
         this.var_2311 = param1.readInteger();
         this.var_2307 = param1.readInteger();
         this.var_2313 = param1.readInteger();
         this.var_2310 = param1.readInteger();
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
   }
}
