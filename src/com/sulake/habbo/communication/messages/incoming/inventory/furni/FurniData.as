package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_2232:int;
      
      private var var_1438:String;
      
      private var _objId:int;
      
      private var var_1995:int;
      
      private var _category:int;
      
      private var var_2122:String;
      
      private var var_2881:Boolean;
      
      private var var_2879:Boolean;
      
      private var var_2880:Boolean;
      
      private var var_2534:Boolean;
      
      private var var_2606:int;
      
      private var var_1540:int;
      
      private var var_1915:String = "";
      
      private var var_1635:int = -1;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int)
      {
         super();
         this.var_2232 = param1;
         this.var_1438 = param2;
         this._objId = param3;
         this.var_1995 = param4;
         this._category = param5;
         this.var_2122 = param6;
         this.var_2881 = param7;
         this.var_2879 = param8;
         this.var_2880 = param9;
         this.var_2534 = param10;
         this.var_2606 = param11;
      }
      
      public function setExtraData(param1:String, param2:int) : void
      {
         this.var_1915 = param1;
         this.var_1540 = param2;
      }
      
      public function get stripId() : int
      {
         return this.var_2232;
      }
      
      public function get itemType() : String
      {
         return this.var_1438;
      }
      
      public function get objId() : int
      {
         return this._objId;
      }
      
      public function get classId() : int
      {
         return this.var_1995;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_2122;
      }
      
      public function get isGroupable() : Boolean
      {
         return this.var_2881;
      }
      
      public function get isRecyclable() : Boolean
      {
         return this.var_2879;
      }
      
      public function get method_2() : Boolean
      {
         return this.var_2880;
      }
      
      public function get isSellable() : Boolean
      {
         return this.var_2534;
      }
      
      public function get expiryTime() : int
      {
         return this.var_2606;
      }
      
      public function get slotId() : String
      {
         return this.var_1915;
      }
      
      public function get songId() : int
      {
         return this.var_1635;
      }
      
      public function get extra() : int
      {
         return this.var_1540;
      }
   }
}
