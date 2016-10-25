Phunware Analytics SDK for iOS
================

Version 3.0.0

This is Phunware's iOS SDK for the Analytics module. Visit http://maas.phunware.com/ for more details and to sign up.


Requirements
------------

- PWCore v3.0.0 or greater
- iOS 7.0 or greater
- Xcode 6 or greater



Getting Started
---------------

- [Download PWAnalytics](https://github.com/phunware/maas-analytics-ios-sdk/archive/master.zip) and run the included sample app.
- Continue reading below for installation and integration instructions.
- Be sure to read the [documentation](http://phunware.github.io/maas-analytics-ios-sdk/) for additional details.



Installation
------------

The following frameworks are required:
````
PWCore.framework
````

PWAnalytics has a dependency on PWCore.framework, which is available here: https://github.com/phunware/maas-core-ios-sdk

It's recommended that you add the MaaS frameworks to the 'Vendor/Phunware' directory. This directory should contain PWCore.framework and PWAnalytics.framework, as well as any other MaaS frameworks that you are using.



Documentation
------------

Documentation is included in the Documents folder in the repository as both HTML and as a .docset. You can also find the latest documentation here: http://phunware.github.io/maas-analytics-ios-sdk/



Integration
-----------

You'll need to import the PWAnalytics.framework wherever you'd like to add analytic events. You may want to include it in your Prefix.pch.

````objective-c
#import <PWAnalytics/PWAnalytics.h>
````

Inside your application delegate, initialize PWCore in the application:didFinishLaunchingWithOptions: method. For more detailed PWCore installation instructions, please see: https://github.com/phunware/maas-core-ios-sdk#installation.

````objective-c
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // These values can be found for your application in the MaaS portal:
    [PWCore setApplicationID:@"APPLICATION_ID"
    			   setAccessKey:@"ACCESS_KEY"
                  signatureKey:@"SIGNATURE_KEY"
                 encryptionKey:@"ENCRYPT_KEY"]; // Currently unused. You can place any NSString value here.
    ...
}
````

### Adding Events

To add events with PWAnalytics:
````objective-c
- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	
	[PWAnalytics addEvent:@"Featured Page View"];
	...
}
````

### Timed Events

PWAnalytics supports timed analytics:
````objective-c
- (void)startLevel:(PWGameLevel *)level
{	
	// Start a timed event like so:
	[PWAnalytics startTimedEvent:@"My Awesome Game - Level 1"];
	...
}

- (void)endLevel:(PWGameLevel *)level
{	
	// And end a timed event like so:
	[PWAnalytics endTimedEvent:@"My Awesome Game - Level 1"];
	...
}
````

### Event Parameters

PWAnalytics allows you to paramaterize your all of your events with up to 10 key / value pairs. *All parameter keys and values must be alphanumeric strings.*

````objective-c
- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	
	[PWAnalytics addEvent:@"Featured Page View" withParamaters:@{@"gender" : @"male"}];
	
	[PWAnalytics addEvent:@"My Awesome Game - Level 1" withParameters:@{@"difficulty" : @"easy"}];
	
	// Keep in mind that calling endTimedEvent:withParameters will replace any parameters that you specified in startTimedEvent:withParameters.
	[PWAnalytics endTimedEvent:@"My Awesome Game - Level 1" withParameters:@{@"difficulty" : @"easy", @"attempts" : @"5"}];
	...
}
````
