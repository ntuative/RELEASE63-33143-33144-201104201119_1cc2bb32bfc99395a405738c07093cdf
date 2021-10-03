package com.sulake.habbo.communication.messages.incoming.inventory.achievements
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AchievementData
   {
       
      
      private var _type:int;
      
      private var var_1491:int;
      
      private var var_308:String;
      
      private var var_2552:int;
      
      private var var_2197:int;
      
      private var var_1890:int;
      
      private var var_2551:int;
      
      public function AchievementData(param1:IMessageDataWrapper)
      {
         super();
         this._type = param1.readInteger();
         this.var_1491 = param1.readInteger();
         this.var_308 = param1.readString();
         this.var_2552 = param1.readInteger();
         this.var_2197 = param1.readInteger();
         this.var_1890 = param1.readInteger();
         this.var_2551 = param1.readInteger();
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get badgeId() : String
      {
         return this.var_308;
      }
      
      public function get level() : int
      {
         return this.var_1491;
      }
      
      public function get scoreLimit() : int
      {
         return this.var_2552;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2197;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_1890;
      }
      
      public function get currentPoints() : int
      {
         return this.var_2551;
      }
   }
}
