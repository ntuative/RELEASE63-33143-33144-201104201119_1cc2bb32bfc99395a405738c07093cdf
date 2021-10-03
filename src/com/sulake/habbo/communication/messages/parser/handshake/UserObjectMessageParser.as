package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_654:String;
      
      private var var_964:String;
      
      private var var_2287:String;
      
      private var var_1702:String;
      
      private var var_2283:int;
      
      private var var_2284:String;
      
      private var var_2282:int;
      
      private var var_2285:int;
      
      private var var_2286:int;
      
      private var _respectLeft:int;
      
      private var var_733:int;
      
      private var var_2272:int;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this.var_654 = param1.readString();
         this.var_964 = param1.readString();
         this.var_2287 = param1.readString();
         this.var_1702 = param1.readString();
         this.var_2283 = param1.readInteger();
         this.var_2284 = param1.readString();
         this.var_2282 = param1.readInteger();
         this.var_2285 = param1.readInteger();
         this.var_2286 = param1.readInteger();
         this._respectLeft = param1.readInteger();
         this.var_733 = param1.readInteger();
         this.var_2272 = param1.readInteger();
         return true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get figure() : String
      {
         return this.var_654;
      }
      
      public function get sex() : String
      {
         return this.var_964;
      }
      
      public function get customData() : String
      {
         return this.var_2287;
      }
      
      public function get realName() : String
      {
         return this.var_1702;
      }
      
      public function get tickets() : int
      {
         return this.var_2283;
      }
      
      public function get poolFigure() : String
      {
         return this.var_2284;
      }
      
      public function get photoFilm() : int
      {
         return this.var_2282;
      }
      
      public function get directMail() : int
      {
         return this.var_2285;
      }
      
      public function get respectTotal() : int
      {
         return this.var_2286;
      }
      
      public function get respectLeft() : int
      {
         return this._respectLeft;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_733;
      }
      
      public function get identityId() : int
      {
         return this.var_2272;
      }
   }
}
