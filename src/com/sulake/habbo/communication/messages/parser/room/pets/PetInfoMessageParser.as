package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1750:int;
      
      private var _name:String;
      
      private var var_1491:int;
      
      private var var_2871:int;
      
      private var var_2221:int;
      
      private var _energy:int;
      
      private var _nutrition:int;
      
      private var var_654:String;
      
      private var var_2872:int;
      
      private var var_2874:int;
      
      private var var_2873:int;
      
      private var var_2141:int;
      
      private var var_2409:int;
      
      private var _ownerName:String;
      
      private var var_527:int;
      
      public function PetInfoMessageParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_1750;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get level() : int
      {
         return this.var_1491;
      }
      
      public function get maxLevel() : int
      {
         return this.var_2871;
      }
      
      public function get experience() : int
      {
         return this.var_2221;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get figure() : String
      {
         return this.var_654;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return this.var_2872;
      }
      
      public function get maxEnergy() : int
      {
         return this.var_2874;
      }
      
      public function get maxNutrition() : int
      {
         return this.var_2873;
      }
      
      public function get respect() : int
      {
         return this.var_2141;
      }
      
      public function get ownerId() : int
      {
         return this.var_2409;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get age() : int
      {
         return this.var_527;
      }
      
      public function flush() : Boolean
      {
         this.var_1750 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_1750 = param1.readInteger();
         this._name = param1.readString();
         this.var_1491 = param1.readInteger();
         this.var_2871 = param1.readInteger();
         this.var_2221 = param1.readInteger();
         this.var_2872 = param1.readInteger();
         this._energy = param1.readInteger();
         this.var_2874 = param1.readInteger();
         this._nutrition = param1.readInteger();
         this.var_2873 = param1.readInteger();
         this.var_654 = param1.readString();
         this.var_2141 = param1.readInteger();
         this.var_2409 = param1.readInteger();
         this.var_527 = param1.readInteger();
         this._ownerName = param1.readString();
         return true;
      }
   }
}
