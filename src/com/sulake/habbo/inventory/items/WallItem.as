package com.sulake.habbo.inventory.items
{
   public class WallItem implements IItem
   {
       
      
      protected var _id:int;
      
      protected var _type:int;
      
      protected var _ref:int;
      
      protected var _category:int;
      
      protected var var_1540:Number;
      
      protected var var_2122:String;
      
      protected var var_2899:Boolean;
      
      protected var var_2900:Boolean;
      
      protected var var_2688:Boolean;
      
      protected var var_2659:Boolean;
      
      protected var var_1023:Boolean;
      
      public function WallItem(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:Boolean, param7:Boolean, param8:Boolean, param9:String, param10:Number)
      {
         super();
         this._id = param1;
         this._type = param2;
         this._ref = param3;
         this._category = param4;
         this.var_2688 = param5;
         this.var_2900 = param6;
         this.var_2899 = param7;
         this.var_2659 = param8;
         this.var_2122 = param9;
         this.var_1540 = param10;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get ref() : int
      {
         return this._ref;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get extra() : Number
      {
         return this.var_1540;
      }
      
      public function get stuffData() : String
      {
         return this.var_2122;
      }
      
      public function set stuffData(param1:String) : void
      {
         this.var_2122 = param1;
      }
      
      public function get recyclable() : Boolean
      {
         return this.var_2899;
      }
      
      public function get tradeable() : Boolean
      {
         return this.var_2900;
      }
      
      public function get groupable() : Boolean
      {
         return this.var_2688;
      }
      
      public function get sellable() : Boolean
      {
         return this.var_2659;
      }
      
      public function get locked() : Boolean
      {
         return this.var_1023;
      }
      
      public function set locked(param1:Boolean) : void
      {
         this.var_1023 = param1;
      }
   }
}
