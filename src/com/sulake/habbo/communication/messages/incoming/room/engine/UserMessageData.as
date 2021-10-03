package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_1084:String = "M";
      
      public static const const_1720:String = "F";
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_166:Number = 0;
      
      private var var_165:Number = 0;
      
      private var var_417:int = 0;
      
      private var _name:String = "";
      
      private var var_2419:int = 0;
      
      private var var_964:String = "";
      
      private var var_654:String = "";
      
      private var var_2425:String = "";
      
      private var var_2421:int;
      
      private var var_2418:int = 0;
      
      private var var_2424:String = "";
      
      private var var_2423:int = 0;
      
      private var var_2422:int = 0;
      
      private var var_2420:String = "";
      
      private var var_182:Boolean = false;
      
      public function UserMessageData(param1:int)
      {
         super();
         this._id = param1;
      }
      
      public function setReadOnly() : void
      {
         this.var_182 = true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function set x(param1:Number) : void
      {
         if(!this.var_182)
         {
            this._x = param1;
         }
      }
      
      public function get y() : Number
      {
         return this.var_166;
      }
      
      public function set y(param1:Number) : void
      {
         if(!this.var_182)
         {
            this.var_166 = param1;
         }
      }
      
      public function get z() : Number
      {
         return this.var_165;
      }
      
      public function set z(param1:Number) : void
      {
         if(!this.var_182)
         {
            this.var_165 = param1;
         }
      }
      
      public function get dir() : int
      {
         return this.var_417;
      }
      
      public function set dir(param1:int) : void
      {
         if(!this.var_182)
         {
            this.var_417 = param1;
         }
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         if(!this.var_182)
         {
            this._name = param1;
         }
      }
      
      public function get userType() : int
      {
         return this.var_2419;
      }
      
      public function set userType(param1:int) : void
      {
         if(!this.var_182)
         {
            this.var_2419 = param1;
         }
      }
      
      public function get sex() : String
      {
         return this.var_964;
      }
      
      public function set sex(param1:String) : void
      {
         if(!this.var_182)
         {
            this.var_964 = param1;
         }
      }
      
      public function get figure() : String
      {
         return this.var_654;
      }
      
      public function set figure(param1:String) : void
      {
         if(!this.var_182)
         {
            this.var_654 = param1;
         }
      }
      
      public function get custom() : String
      {
         return this.var_2425;
      }
      
      public function set custom(param1:String) : void
      {
         if(!this.var_182)
         {
            this.var_2425 = param1;
         }
      }
      
      public function get achievementScore() : int
      {
         return this.var_2421;
      }
      
      public function set achievementScore(param1:int) : void
      {
         if(!this.var_182)
         {
            this.var_2421 = param1;
         }
      }
      
      public function get webID() : int
      {
         return this.var_2418;
      }
      
      public function set webID(param1:int) : void
      {
         if(!this.var_182)
         {
            this.var_2418 = param1;
         }
      }
      
      public function get groupID() : String
      {
         return this.var_2424;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!this.var_182)
         {
            this.var_2424 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return this.var_2423;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!this.var_182)
         {
            this.var_2423 = param1;
         }
      }
      
      public function get xp() : int
      {
         return this.var_2422;
      }
      
      public function set xp(param1:int) : void
      {
         if(!this.var_182)
         {
            this.var_2422 = param1;
         }
      }
      
      public function get subType() : String
      {
         return this.var_2420;
      }
      
      public function set subType(param1:String) : void
      {
         if(!this.var_182)
         {
            this.var_2420 = param1;
         }
      }
   }
}
