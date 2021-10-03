package com.sulake.habbo.help
{
   public class WelcomeNotification
   {
       
      
      private var var_2491:String;
      
      private var var_2489:String;
      
      private var var_2490:String;
      
      public function WelcomeNotification(param1:String, param2:String, param3:String)
      {
         super();
         this.var_2491 = param1;
         this.var_2489 = param2;
         this.var_2490 = param3;
      }
      
      public function get targetIconId() : String
      {
         return this.var_2491;
      }
      
      public function get titleLocalizationKey() : String
      {
         return this.var_2489;
      }
      
      public function get descriptionLocalizationKey() : String
      {
         return this.var_2490;
      }
   }
}
