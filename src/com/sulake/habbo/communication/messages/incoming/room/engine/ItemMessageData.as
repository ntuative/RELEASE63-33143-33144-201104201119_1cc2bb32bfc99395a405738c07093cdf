package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ItemMessageData
   {
       
      
      private var _id:int = 0;
      
      private var var_2747:Boolean = false;
      
      private var var_2746:int = 0;
      
      private var var_2748:int = 0;
      
      private var var_2581:int = 0;
      
      private var var_2577:int = 0;
      
      private var var_166:Number = 0;
      
      private var var_165:Number = 0;
      
      private var var_417:String = "";
      
      private var _type:int = 0;
      
      private var var_2975:String = "";
      
      private var var_1540:int = 0;
      
      private var _state:int = 0;
      
      private var _data:String = "";
      
      private var var_182:Boolean = false;
      
      public function ItemMessageData(param1:int, param2:int, param3:Boolean)
      {
         super();
         this._id = param1;
         this._type = param2;
         this.var_2747 = param3;
      }
      
      public function setReadOnly() : void
      {
         this.var_182 = true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get isOldFormat() : Boolean
      {
         return this.var_2747;
      }
      
      public function get wallX() : Number
      {
         return this.var_2746;
      }
      
      public function set wallX(param1:Number) : void
      {
         if(!this.var_182)
         {
            this.var_2746 = param1;
         }
      }
      
      public function get wallY() : Number
      {
         return this.var_2748;
      }
      
      public function set wallY(param1:Number) : void
      {
         if(!this.var_182)
         {
            this.var_2748 = param1;
         }
      }
      
      public function get localX() : Number
      {
         return this.var_2581;
      }
      
      public function set localX(param1:Number) : void
      {
         if(!this.var_182)
         {
            this.var_2581 = param1;
         }
      }
      
      public function get localY() : Number
      {
         return this.var_2577;
      }
      
      public function set localY(param1:Number) : void
      {
         if(!this.var_182)
         {
            this.var_2577 = param1;
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
      
      public function get dir() : String
      {
         return this.var_417;
      }
      
      public function set dir(param1:String) : void
      {
         if(!this.var_182)
         {
            this.var_417 = param1;
         }
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function set type(param1:int) : void
      {
         if(!this.var_182)
         {
            this._type = param1;
         }
      }
      
      public function get state() : int
      {
         return this._state;
      }
      
      public function set state(param1:int) : void
      {
         if(!this.var_182)
         {
            this._state = param1;
         }
      }
      
      public function get data() : String
      {
         return this._data;
      }
      
      public function set data(param1:String) : void
      {
         if(!this.var_182)
         {
            this._data = param1;
         }
      }
   }
}
