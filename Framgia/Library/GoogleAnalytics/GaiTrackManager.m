
//
//  GaiTrackManager.m
//  Framgia
//
//  Created by Minh Tien on 1/19/17.
//  Copyright (c) 2015 Minh Tien. All rights reserved.
//

#import "GaiTrackManager.h"
#import "GAI.h"
#import "GAITrackedViewController.h"
#import "GAIDictionaryBuilder.h"
#import "GAIFields.h"
#define GOOGLE_ANALYTICS_ID @""

@implementation GaiTrackManager

+ (GaiTrackManager *)sharedTracker{
    static GaiTrackManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[GaiTrackManager alloc] init];
    });
    return sharedManager;
}

-(id)getTracker{
    return [[GAI sharedInstance] defaultTracker];
}

-(void)initializeTheTracker{
    // Optional: automatically send uncaught exceptions to Google Analytics.
    [GAI sharedInstance].trackUncaughtExceptions = YES;
    // Optional: set Google Analytics dispatch interval to e.g. 20 seconds.
    [GAI sharedInstance].dispatchInterval = 20;
    
    // Optional: set Logger to VERBOSE for debug information.
    [[[GAI sharedInstance] logger] setLogLevel:kGAILogLevelVerbose];
    
    // Get a new tracker.
    id newTracker = [[GAI sharedInstance]trackerWithTrackingId:GOOGLE_ANALYTICS_ID];
    // Set the new tracker as the default tracker, globally.
    [GAI sharedInstance].defaultTracker = newTracker;
}

- (void) trackEventWithView:(NSString*) fromView withAction:(NSString*) action withLabel:(NSString*) label
{
    id tracker = [[GAI sharedInstance] defaultTracker];
    
    if (!fromView || [fromView isEqualToString:@""]) { fromView = @"fromView"; }
    if (!action || [action isEqualToString:@""]) { action = @"Click"; }
    if (!label || [label isEqualToString:@""]) { label = @"Label"; }
    
    NSNumber *value = [NSNumber numberWithInteger:1];
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:fromView
                                                          action:action
                                                           label:label
                                                           value:value] build]];
}




@end
