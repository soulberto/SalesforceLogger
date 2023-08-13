@IsTest
public class LoggerTest {

    class Test extends Logger{}

    @TestSetup
    static void makeData(){
        Logger.isEnabled = false; // Force default value for all tests
    }
    
    @IsTest
    static void disabledByDefault() {
        // false is default value for Logger.isEnabled

        System.assertEquals(false, Logger.isEnabled, 'Logger should be enabled by default');
    }

    @IsTest
    static void enablingOutput() {
        Logger.isEnabled = true; // Enable this for System.debug output

        System.assertEquals(true, Logger.isEnabled, 'Logger has been enabled');
    }

    @IsTest
    static void callUsingStaticMethod() {
        Logger.isEnabled = true; // Enable this for System.debug output

        System.assertEquals('LoggerTest: Static Test', Logger.debug('LoggerTest', LoggingLevel.DEBUG, 'Static Test'), 'Logger call directly using static method');
    }

    @IsTest
    static void callUsingInstanceWithoutArguments() {
        Logger.isEnabled = true; // Enable this for System.debug output

        Test test = new Test();
        System.assertEquals('Test: Instance Test', test.log('Instance Test'), 'Logger call instance without arguments');
    }

    @IsTest
    static void callUsingInstanceWithOneArguments() {
        Logger.isEnabled = true; // Enable this for System.debug output

        Test test = new Test();
        System.assertEquals('Test: Test A', test.log('Test {0}', new List<Object> {'A'}), 'Logger call instance with 1 argument');
    }

    @IsTest
    static void callUsingInstanceWithMultipleArguments() {
        Logger.isEnabled = true; // Enable this for System.debug output

        Test test = new Test();
        System.assertEquals('Test: Test sum => 100 + 200 = 300', test.log('Test sum => {0} + {1} = {2}', new List<Object> {100, 200, 300}), 'Logger call instance with multiple arguments');
    }

}