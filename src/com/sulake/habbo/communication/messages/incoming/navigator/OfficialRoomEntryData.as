package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_1129:int = 1;
      
      public static const const_865:int = 2;
      
      public static const const_798:int = 3;
      
      public static const const_1590:int = 4;
       
      
      private var _index:int;
      
      private var var_2452:String;
      
      private var var_2451:String;
      
      private var var_2453:Boolean;
      
      private var var_2454:String;
      
      private var var_1037:String;
      
      private var var_2450:int;
      
      private var var_2455:int;
      
      private var _type:int;
      
      private var var_2237:String;
      
      private var var_945:GuestRoomData;
      
      private var var_944:PublicRoomData;
      
      private var _open:Boolean;
      
      private var _disposed:Boolean;
      
      public function OfficialRoomEntryData(param1:IMessageDataWrapper)
      {
         super();
         this._index = param1.readInteger();
         this.var_2452 = param1.readString();
         this.var_2451 = param1.readString();
         this.var_2453 = param1.readInteger() == 1;
         this.var_2454 = param1.readString();
         this.var_1037 = param1.readString();
         this.var_2450 = param1.readInteger();
         this.var_2455 = param1.readInteger();
         this._type = param1.readInteger();
         if(this._type == const_1129)
         {
            this.var_2237 = param1.readString();
         }
         else if(this._type == const_798)
         {
            this.var_944 = new PublicRoomData(param1);
         }
         else if(this._type == const_865)
         {
            this.var_945 = new GuestRoomData(param1);
         }
         else
         {
            this._open = param1.readBoolean();
         }
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_945 != null)
         {
            this.var_945.dispose();
            this.var_945 = null;
         }
         if(this.var_944 != null)
         {
            this.var_944.dispose();
            this.var_944 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get index() : int
      {
         return this._index;
      }
      
      public function get popupCaption() : String
      {
         return this.var_2452;
      }
      
      public function get popupDesc() : String
      {
         return this.var_2451;
      }
      
      public function get showDetails() : Boolean
      {
         return this.var_2453;
      }
      
      public function get picText() : String
      {
         return this.var_2454;
      }
      
      public function get picRef() : String
      {
         return this.var_1037;
      }
      
      public function get folderId() : int
      {
         return this.var_2450;
      }
      
      public function get tag() : String
      {
         return this.var_2237;
      }
      
      public function get userCount() : int
      {
         return this.var_2455;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return this.var_945;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return this.var_944;
      }
      
      public function get open() : Boolean
      {
         return this._open;
      }
      
      public function toggleOpen() : void
      {
         this._open = !this._open;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_1129)
         {
            return 0;
         }
         if(this.type == const_865)
         {
            return this.var_945.maxUserCount;
         }
         if(this.type == const_798)
         {
            return this.var_944.maxUsers;
         }
         return 0;
      }
   }
}
