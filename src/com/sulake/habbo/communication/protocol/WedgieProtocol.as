package com.sulake.habbo.communication.protocol
{
   import com.sulake.core.communication.protocol.IProtocol;
   import com.sulake.core.communication.protocol.IProtocolDecoder;
   import com.sulake.core.communication.protocol.IProtocolEncoder;
   import flash.utils.ByteArray;
   
   public class WedgieProtocol implements IProtocol
   {
      
      public static const const_1675:uint = 1;
      
      public static const const_1766:uint = 2;
       
      
      private var var_1547:IProtocolEncoder;
      
      private var var_1243:IProtocolDecoder;
      
      public function WedgieProtocol()
      {
         super();
         this.var_1547 = new WedgieEncoder();
         this.var_1243 = new WedgieDecoder();
      }
      
      public function dispose() : void
      {
         this.var_1547.dispose();
         this.var_1243.dispose();
         this.var_1547 = null;
         this.var_1243 = null;
      }
      
      public function get encoder() : IProtocolEncoder
      {
         return this.var_1547;
      }
      
      public function get decoder() : IProtocolDecoder
      {
         return this.var_1243;
      }
      
      public function getMessages(param1:ByteArray, param2:Array) : uint
      {
         var _loc5_:* = 0;
         var _loc6_:int = 0;
         param1.position = 0;
         var _loc3_:uint = param1.position;
         var _loc4_:ByteArray = new ByteArray();
         while(param1.bytesAvailable)
         {
            _loc5_ = uint(param1.readUnsignedByte());
            if(_loc5_ == const_1675)
            {
               _loc4_.position = 0;
               _loc6_ = this.var_1243.getID(_loc4_);
               param2.push([_loc6_,_loc4_]);
               _loc4_ = new ByteArray();
               _loc3_ = param1.position;
            }
            else
            {
               _loc4_.writeByte(_loc5_);
            }
         }
         return _loc3_;
      }
   }
}
