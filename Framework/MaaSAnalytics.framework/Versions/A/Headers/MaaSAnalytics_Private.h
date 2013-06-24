//
//  MaaSAnalytics_Private.h
//  MaaSAnalytics
//
//  Created by Illya Busigin on 6/21/13.
//  Copyright (c) 2013 Phunware Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PWAnalyticEvent.h"


@interface MaaSAnalytics ()

+ (MaaSAnalytics *)_sharedInstance;

- (void)addEventToCache:(PWAnalyticEvent *)analyticsEvent;
- (void)flushEventCacheIfNecessary;
- (void)flushEventCache;
- (NSMutableArray *)fetchEventCache;

@end
