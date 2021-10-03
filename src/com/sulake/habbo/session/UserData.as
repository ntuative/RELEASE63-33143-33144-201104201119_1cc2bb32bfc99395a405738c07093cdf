package com.sulake.habbo.session
{
   public class UserData implements IUserData
   {
       
      
      private var _id:int = -1;
      
      private var _name:String = "";
      
      private var _type:int = 0;
      
      private var var_964:String = "";
      
      private var var_654:String = "";
      
      private var var_2425:String = "";
      
      private var var_2421:int;
      
      private var var_2418:int = 0;
      
      private var var_2424:String = "";
      
      private var var_2423:int = 0;
      
      private var var_2422:int = 0;
      
      public function UserData(param1:int)
      {
         super();
         this._id = param1;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get achievementScore() : int
      {
         return this.var_2421;
      }
      
      public function set achievementScore(param1:int) : void
      {
         this.var_2421 = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function set type(param1:int) : void
      {
         this._type = param1;
      }
      
      public function get sex() : String
      {
         return this.var_964;
      }
      
      public function set sex(param1:String) : void
      {
         this.var_964 = param1;
      }
      
      public function get figure() : String
      {
         return this.var_654;
      }
      
      public function set figure(param1:String) : void
      {
         this.var_654 = param1;
      }
      
      public function get custom() : String
      {
         return this.var_2425;
      }
      
      public function set custom(param1:String) : void
      {
         this.var_2425 = param1;
      }
      
      public function get webID() : int
      {
         return this.var_2418;
      }
      
      public function set webID(param1:int) : void
      {
         this.var_2418 = param1;
      }
      
      public function get groupID() : String
      {
         return this.var_2424;
      }
      
      public function set groupID(param1:String) : void
      {
         this.var_2424 = param1;
      }
      
      public function get groupStatus() : int
      {
         return this.var_2423;
      }
      
      public function set groupStatus(param1:int) : void
      {
         this.var_2423 = param1;
      }
      
      public function get xp() : int
      {
         return this.var_2422;
      }
      
      public function set xp(param1:int) : void
      {
         this.var_2422 = param1;
      }
   }
}
