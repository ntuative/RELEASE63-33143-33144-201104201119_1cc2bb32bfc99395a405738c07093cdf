package com.sulake.habbo.session
{
   public class PetInfo implements IPetInfo
   {
       
      
      private var var_1750:int;
      
      private var var_1491:int;
      
      private var var_2410:int;
      
      private var var_2221:int;
      
      private var var_2408:int;
      
      private var _energy:int;
      
      private var var_2413:int;
      
      private var _nutrition:int;
      
      private var var_2406:int;
      
      private var var_2409:int;
      
      private var _ownerName:String;
      
      private var var_2141:int;
      
      private var var_527:int;
      
      public function PetInfo()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_1750;
      }
      
      public function get level() : int
      {
         return this.var_1491;
      }
      
      public function get levelMax() : int
      {
         return this.var_2410;
      }
      
      public function get experience() : int
      {
         return this.var_2221;
      }
      
      public function get experienceMax() : int
      {
         return this.var_2408;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get energyMax() : int
      {
         return this.var_2413;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get nutritionMax() : int
      {
         return this.var_2406;
      }
      
      public function get ownerId() : int
      {
         return this.var_2409;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get respect() : int
      {
         return this.var_2141;
      }
      
      public function get age() : int
      {
         return this.var_527;
      }
      
      public function set petId(param1:int) : void
      {
         this.var_1750 = param1;
      }
      
      public function set level(param1:int) : void
      {
         this.var_1491 = param1;
      }
      
      public function set levelMax(param1:int) : void
      {
         this.var_2410 = param1;
      }
      
      public function set experience(param1:int) : void
      {
         this.var_2221 = param1;
      }
      
      public function set experienceMax(param1:int) : void
      {
         this.var_2408 = param1;
      }
      
      public function set energy(param1:int) : void
      {
         this._energy = param1;
      }
      
      public function set energyMax(param1:int) : void
      {
         this.var_2413 = param1;
      }
      
      public function set nutrition(param1:int) : void
      {
         this._nutrition = param1;
      }
      
      public function set nutritionMax(param1:int) : void
      {
         this.var_2406 = param1;
      }
      
      public function set ownerId(param1:int) : void
      {
         this.var_2409 = param1;
      }
      
      public function set ownerName(param1:String) : void
      {
         this._ownerName = param1;
      }
      
      public function set respect(param1:int) : void
      {
         this.var_2141 = param1;
      }
      
      public function set age(param1:int) : void
      {
         this.var_527 = param1;
      }
   }
}
