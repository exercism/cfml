component displayName="Leap Tests" extends="testbox.system.BaseSpec" {

   // executes before all tests
   function beforeTests(){
      leapObj = createObject("leap");
   }

   function testLeapYear() {
      $assert.isTrue(leapObj.isLeapYear(1996));
   }

   function testNonLeapYear() {
      $assert.isFalse(leapObj.isLeapYear(1997));
   }

   function testNonLeapEvenYear() {
      $assert.isFalse(leapObj.isLeapYear(1998));
   }

   function testCentury() {
      $assert.isFalse(leapObj.isLeapYear(1900));
   }

   function testfourthCentury() {
      $assert.isTrue(leapObj.isLeapYear(2400));
   }

   function testY2K() {
      $assert.isTrue(leapObj.isLeapYear(2000));
   }

   // executes after all tests
   function afterTests(){}

}