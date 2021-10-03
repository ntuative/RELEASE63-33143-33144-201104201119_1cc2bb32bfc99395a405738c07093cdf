package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.utils.ErrorReportStorage;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_1031:BigInteger;
      
      private var var_2597:BigInteger;
      
      private var var_1948:BigInteger;
      
      private var var_2709:BigInteger;
      
      private var var_1528:BigInteger;
      
      private var var_1949:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         this.var_1528 = param1;
         this.var_1949 = param2;
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         ErrorReportStorage.addDebugData("DiffieHellman","Prime: " + this.var_1528.toString() + ",generator: " + this.var_1949.toString() + ",secret: " + param1);
         this.var_1031 = new BigInteger();
         this.var_1031.fromRadix(param1,param2);
         this.var_2597 = this.var_1949.modPow(this.var_1031,this.var_1528);
         return true;
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         this.var_1948 = new BigInteger();
         this.var_1948.fromRadix(param1,param2);
         this.var_2709 = this.var_1948.modPow(this.var_1031,this.var_1528);
         return this.getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return this.var_2597.toRadix(param1);
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return this.var_2709.toRadix(param1);
      }
   }
}
