MaaSAnalytics iOS SDK
================

Version 1.0.0

This is the iOS SDK for the MaaS Analytics module. Visit http://maas.phunware.com/ for more details and to sign up.



Getting Started
---------------

- [Download MaaSAnalytics](https://github.com/phunware/maas-analytics-ios-sdk/archive/master.zip) and run the included sample app.
- Continue reading below for installation and integration instructions.
- Be sure to read the [documentation](http://phunware.github.io/maas-analytics-ios-sdk/) for additional details.



Installation
------------

The following frameworks are required:
````
MaaSCore.framework
````

MaaSAnalytics has a dependency on MaaSCore.framework which is available here: https://github.com/phunware/maas-core-ios-sdk

It's recommended that you add the MaaS framesworks to the 'Vendor/Phunware' directory. This directory should contain MaaSCore.framework and MaaSAlerts.framework  as well as any other MaaS frameworks that you are using.



Documentation
------------

Documentation is included in the Documents folder in the repository as both HTML and .docset. You can also find the latest documentation here: http://phunware.github.io/maas-analytics-ios-sdk/.



Integration
-----------

For wherever you'd like to add analytic events you'll eed to import the MaaSAnalytics.framework. You may want to include it in your Prefix.pch.

````objective-c
#import <MaaSAnalytics/MaaSAnalytics.h>
````

Inside your application delegate you will need to initialize MaaSCore in the application:didFinishLaunchingWithOptions: method. For more detailed MaaSCore installation instructions please see https://github.com/phunware/maas-core-ios-sdk#installation.

````objective-c
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // These values can be found for your application in MaaS Portal
    [MaaSCore setApplicationID:@"APPLICATION_ID"
    			   setAccessKey:@"ACCESS_KEY"
                  signatureKey:@"SIGNATURE_KEY"
                 encryptionKey:@"ENCRYPT_KEY"]; // Currently unused. You can place anything NSString value here
    ...
}
````

Apple has three primary methods for handling remote notifications. You will need to implement these in your application delegate, forwarding the results to MaaSAlerts:

````objective-c
- (void)application:(UIApplication *)app didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)devToken
{
    [MaaSAlerts didRegisterForRemoteNotificationsWithDeviceToken:devToken];
    ...
}

- (void)application:(UIApplication *)app didFailToRegisterForRemoteNotificationsWithError:(NSError *)err
{
    [MaaSAlerts didFailToRegisterForRemoteNotificationsWithError:err];
    ...
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    [MaaSAlerts didReceiveRemoteNotification:userInfo];
    ...
}
````

For a complete example, see https://github.com/phunware/maas-alerts-ios-sdk/Sample


Subscription Groups
-------------------
MaaS Portal provides the ability to setup subscribtion groups for which more filtered alerts and notifications can be received. There are two MaaSAlerts SDK methods the facilitate this, *getSubscriptionGroupsWithSuccess:failure:* and *subscribeToGroupsWithIDs:success:failure:*.

````objective-c
// Fetch an array of of the available subscriptions
[MaaSAlerts getSubscriptionGroupsWithSuccess:^(NSArray *groups) {
        // Display the available subscription groups to the user
        // The groups array will contain dictionary objects the conform to the following structure: {@"id" : @"SUBCRIPTION_GROUP_ID", @"name" : @"SUBSCRIPTION_GROUP_NAME"}
    } failure:^(NSError *error) {
		// Handle error
    }];
    
    
// To update the subscription groups you would make the following call
NSArray *subscribedGroups = @[@"SUBSCRIPTION_GROUP_ID", ...];
[MaaSAlerts subscribeToGroupsWithIDs:subscribedGroups success:^{
        // Handle success
edGroups    } failure:^(NSError *error) {
        // Handle error
    }];
}
````

Optional
--------

Fetching extra information associated with a push notification using MaaSAlerts is easy using *getExtraInformationForPushID:success:failure:* 

````objective-c
[MaaSAlerts getExtraInformationForPushID:@"PUSH_ID" success:^(NSDictionary *extraInformation) {
        // Process the extra information
    } failure:^(NSError *error) {
        // Handle error
    }];
````


Requirements
------------

- MaaSCore v1.0.0 or greater.
- iOS 5.0 or greater
- Xcode 4.4 or greater
