package com.sulake.habbo.communication.messages.parser.sound
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class NowPlayingMessageParser implements IMessageParser
   {
       
      
      private var var_2014:int;
      
      private var _currentPosition:int;
      
      private var var_2013:int;
      
      private var var_2016:int;
      
      private var var_2015:int;
      
      public function NowPlayingMessageParser()
      {
         super();
      }
      
      public function get currentSongId() : int
      {
         return this.var_2014;
      }
      
      public function get currentPosition() : int
      {
         return this._currentPosition;
      }
      
      public function get nextSongId() : int
      {
         return this.var_2013;
      }
      
      public function get nextPosition() : int
      {
         return this.var_2016;
      }
      
      public function get syncCount() : int
      {
         return this.var_2015;
      }
      
      public function flush() : Boolean
      {
         this.var_2014 = -1;
         this._currentPosition = -1;
         this.var_2013 = -1;
         this.var_2016 = -1;
         this.var_2015 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2014 = param1.readInteger();
         this._currentPosition = param1.readInteger();
         this.var_2013 = param1.readInteger();
         this.var_2016 = param1.readInteger();
         this.var_2015 = param1.readInteger();
         return true;
      }
   }
}
