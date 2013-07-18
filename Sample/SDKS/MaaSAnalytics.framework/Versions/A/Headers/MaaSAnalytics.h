//
//  MaaSAnalytics.h
//  MaaSAnalytics
//
//  Copyright (c) 2013 Phunware. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MaaSCore/MaaSCore.h>

/**
 `MaaSAnalytics` enables easy implementation of application workflow analytics. MaaSAnalytics supports standard analytics events, timed events, and event parameters.
 */

@interface MaaSAnalytics : NSObject

///-----------------------
/// @name Event Methods
///-----------------------

/**
 Add an event to the analytics queue. Analytics will only be sent once a threshold has been reached, a new session is created, or the events are manually flushed.
 @param eventName Name of the event.
 */
+ (void)addEvent:(NSString *)eventName;

/**
 Add an event to the analytics queue. Analytics will only be sent once a threshold has been reached, a new session is created, or the events are manually flushed. Parameters must follow these rules:
  - Keys and values must be `NSString` objects
  - There may be no more than 10 parameters. Extra parameters will be ignored
  - Each key or value that is longer than 256 characters will be truncated
 @param eventName Name of the event.
 @param parameters `NSString` key/value parameters. For example, `@{@"key" : @"value"}`.
 */
+ (void)addEvent:(NSString *)eventName withParameters:(NSDictionary *)parameters;

/**
 Start a timed event. Calling `startTimedEvent:` with the same `eventName`  prior to `endTimedEvent:` will overwrite the previous start time.
 @param eventName Name of the event to start.
 */
+ (void)startTimedEvent:(NSString *)eventName;

/**
 Start a timed event with the specified parameters. Calling `startTimedEvent:` with the same `eventName`  prior to `endTimedEvent:` will overwrite the previous start time. Parameters must follow these rules:
 - Keys and values must be `NSString` objects
 - There may be no more than 10 parameters. Extra parameters will be ignored
 - Each key or value that is longer than 256 characters will be truncated
 @param eventName Name of the event to start.
 @param parameters `NSString` key/value parameters. For example, `@{@"key" : @"value"}`.
 */
+ (void)startTimedEvent:(NSString *)eventName withParameters:(NSDictionary *)parameters;

/**
 Pause a timed event with the specified `eventName`. If an event is ended while still in a paused state then the paused time will be used as the end time. If an event is already paused then this method will do nothing.
 @param eventName The name of the event to pause.
 */
+ (void)pauseTimedEvent:(NSString *)eventName;

/**
 Resume a timed event with the specified `eventName`. If an event is ended while still in a paused state then the paused time will be used as the end time. If an event is already paused then this method will do nothing. 
 @param eventName The name of the event to resume.
 */
+ (void)resumeTimedEvent:(NSString *)eventName;

/**
 End a timed event with the specified `eventName`. The event will be ignored if the event duration is less than 1 second. This method will do nothing if the event name cannot be found.
 @param eventName The name of the event to end.
 */
+ (void)endTimedEvent:(NSString *)eventName;

/**
 End a timed event with the specified `eventName`. The event will be ignored if the event duration is less than 1 second. This method will do nothing if the event name cannot be found. Parameters must follow these rules:
 - Keys and values must be `NSString` objects
 - There may be no more than 10 parameters. Extra parameters will be ignored
 - Each key or value that is longer than 256 characters will be truncated
 @param eventName The name of the event to end.
 @param parameters `NSString` key/value parameters. For example, `@{@"key" : @"value"}`.
 */
+ (void)endTimedEvent:(NSString *)eventName withParameters:(NSDictionary *)parameters;


///--------------------
/// @name Other Methods
///--------------------

/**
 Returns 'MaaSAnalytics'.
 */
+ (NSString *)serviceName;

@end
