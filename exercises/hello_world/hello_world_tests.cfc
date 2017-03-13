component displayName="Hello World Tests" extends="testbox.system.BaseSpec" {

   
   function beforeTests(){
      HWObj = createObject("helloWorld");
   }

   function testHello() {
      $assert.isTrue(HWObj.sayHello("Hello World"));
   }
   
   function afterTests(){}

}
