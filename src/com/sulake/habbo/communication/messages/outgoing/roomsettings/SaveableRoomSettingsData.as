package com.sulake.habbo.communication.messages.outgoing.roomsettings
{
   public class SaveableRoomSettingsData
   {
       
      
      private var _roomId:int;
      
      private var _name:String;
      
      private var var_1774:String;
      
      private var var_2524:int;
      
      private var _password:String;
      
      private var var_1591:int;
      
      private var var_2783:int;
      
      private var var_880:Array;
      
      private var var_2785:Array;
      
      private var var_2714:Boolean;
      
      private var var_2782:Boolean;
      
      private var var_2781:Boolean;
      
      private var var_2784:Boolean;
      
      public function SaveableRoomSettingsData()
      {
         super();
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2714;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         this.var_2714 = param1;
      }
      
      public function get allowFoodConsume() : Boolean
      {
         return this.var_2782;
      }
      
      public function set allowFoodConsume(param1:Boolean) : void
      {
         this.var_2782 = param1;
      }
      
      public function get allowWalkThrough() : Boolean
      {
         return this.var_2781;
      }
      
      public function set allowWalkThrough(param1:Boolean) : void
      {
         this.var_2781 = param1;
      }
      
      public function get hideWalls() : Boolean
      {
         return this.var_2784;
      }
      
      public function set hideWalls(param1:Boolean) : void
      {
         this.var_2784 = param1;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function set roomId(param1:int) : void
      {
         this._roomId = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get description() : String
      {
         return this.var_1774;
      }
      
      public function set description(param1:String) : void
      {
         this.var_1774 = param1;
      }
      
      public function get doorMode() : int
      {
         return this.var_2524;
      }
      
      public function set doorMode(param1:int) : void
      {
         this.var_2524 = param1;
      }
      
      public function get password() : String
      {
         return this._password;
      }
      
      public function set password(param1:String) : void
      {
         this._password = param1;
      }
      
      public function get categoryId() : int
      {
         return this.var_1591;
      }
      
      public function set categoryId(param1:int) : void
      {
         this.var_1591 = param1;
      }
      
      public function get maximumVisitors() : int
      {
         return this.var_2783;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         this.var_2783 = param1;
      }
      
      public function get tags() : Array
      {
         return this.var_880;
      }
      
      public function set tags(param1:Array) : void
      {
         this.var_880 = param1;
      }
      
      public function get controllers() : Array
      {
         return this.var_2785;
      }
      
      public function set controllers(param1:Array) : void
      {
         this.var_2785 = param1;
      }
   }
}
