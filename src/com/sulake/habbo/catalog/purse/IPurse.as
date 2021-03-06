package com.sulake.habbo.catalog.purse
{
   public interface IPurse
   {
       
      
      function set credits(param1:int) : void;
      
      function set clubDays(param1:int) : void;
      
      function set clubPeriods(param1:int) : void;
      
      function get credits() : int;
      
      function get clubDays() : int;
      
      function get clubPeriods() : int;
      
      function get hasClubLeft() : Boolean;
      
      function get method_1() : Boolean;
      
      function get pastClubDays() : int;
      
      function get pastVipDays() : int;
      
      function getActivityPointsForType(param1:int) : int;
   }
}
