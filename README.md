MaaS Analytics SDK for iOS
================

Version 1.2.4

This is Phunware's iOS SDK for the Analytics module. Visit http://maas.phunware.com/ for more details and to sign up.


Requirements
------------

- MaaS Core v1.3.0 or greater
- iOS 6.0 or greater
- Xcode 6 or greater



Getting Started
---------------

- [Download MaaS Analytics](https://github.com/phunware/maas-analytics-ios-sdk/archive/master.zip) and run the included sample app.
- Continue reading below for installation and integration instructions.
- Be sure to read the [documentation](http://phunware.github.io/maas-analytics-ios-sdk/) for additional details.



Installation
------------

The following frameworks are required:
````
MaaSCore.framework
````

MaaS Analytics has a dependency on MaaSCore.framework, which is available here: https://github.com/phunware/maas-core-ios-sdk

It's recommended that you add the MaaS frameworks to the 'Vendor/Phunware' directory. This directory should contain MaaSCore.framework and MaaSAnalytics.framework, as well as any other MaaS frameworks that you are using.



Documentation
------------

Documentation is included in the Documents folder in the repository as both HTML and as a .docset. You can also find the latest documentation here: http://phunware.github.io/maas-analytics-ios-sdk/



Integration
-----------

You'll need to import the MaaSAnalytics.framework wherever you'd like to add analytic events. You may want to include it in your Prefix.pch.

````objective-c
#import <MaaSAnalytics/MaaSAnalytics.h>
````

Inside your application delegate, initialize MaaSCore in the application:didFinishLaunchingWithOptions: method. For more detailed MaaSCore installation instructions, please see: https://github.com/phunware/maas-core-ios-sdk#installation.

````objective-c
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // These values can be found for your application in the MaaS portal:
    [MaaSCore setApplicationID:@"APPLICATION_ID"
    			   setAccessKey:@"ACCESS_KEY"
                  signatureKey:@"SIGNATURE_KEY"
                 encryptionKey:@"ENCRYPT_KEY"]; // Currently unused. You can place any NSString value here.
    ...
}
````

### Adding Events

To add events with MaaS Analytics:
````objective-c
- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	
	[MaaSAnalytics addEvent:@"Featured Page View"];
	...
}
````

### Timed Events

MaaS Analytics supports timed analytics:
````objective-c
- (void)startLevel:(PWGameLevel *)level
{	
	// Start a timed event like so:
	[MaaSAnalytics startTimedEvent:@"My Awesome Game - Level 1"];
	...
}

- (void)endLevel:(PWGameLevel *)level
{	
	// And end a timed event like so:
	[MaaSAnalytics endTimedEvent:@"My Awesome Game - Level 1"];
	...
}
````

### Event Parameters

MaaS Analytics allows you to paramaterize your all of your events with up to 10 key / value pairs. *All parameter keys and values must be alphanumeric strings.*

````objective-c
- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	
	[MaaSAnalytics addEvent:@"Featured Page View" withParamaters:@{@"gender" : @"male"}];
	
	[MaaSAnalytics addEvent:@"My Awesome Game - Level 1" withParameters:@{@"difficulty" : @"easy"}];
	
	// Keep in mind that calling endTimedEvent:withParameters will replace any parameters that you specified in startTimedEvent:withParameters.
	[MaaSAnalytics endTimedEvent:@"My Awesome Game - Level 1" withParameters:@{@"difficulty" : @"easy", @"attempts" : @"5"}];
	...
}
````
