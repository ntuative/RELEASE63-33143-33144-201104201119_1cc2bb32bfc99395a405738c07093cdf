package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_166:Number = 0;
      
      private var var_165:Number = 0;
      
      private var var_2480:Number = 0;
      
      private var var_2478:Number = 0;
      
      private var var_2479:Number = 0;
      
      private var var_2476:Number = 0;
      
      private var var_417:int = 0;
      
      private var var_2150:int = 0;
      
      private var var_331:Array;
      
      private var var_2477:Boolean = false;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         this.var_331 = [];
         super();
         this._id = param1;
         this._x = param2;
         this.var_166 = param3;
         this.var_165 = param4;
         this.var_2480 = param5;
         this.var_417 = param6;
         this.var_2150 = param7;
         this.var_2478 = param8;
         this.var_2479 = param9;
         this.var_2476 = param10;
         this.var_2477 = param11;
         this.var_331 = param12;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function get y() : Number
      {
         return this.var_166;
      }
      
      public function get z() : Number
      {
         return this.var_165;
      }
      
      public function get localZ() : Number
      {
         return this.var_2480;
      }
      
      public function get targetX() : Number
      {
         return this.var_2478;
      }
      
      public function get targetY() : Number
      {
         return this.var_2479;
      }
      
      public function get targetZ() : Number
      {
         return this.var_2476;
      }
      
      public function get dir() : int
      {
         return this.var_417;
      }
      
      public function get dirHead() : int
      {
         return this.var_2150;
      }
      
      public function get isMoving() : Boolean
      {
         return this.var_2477;
      }
      
      public function get actions() : Array
      {
         return this.var_331.slice();
      }
   }
}
