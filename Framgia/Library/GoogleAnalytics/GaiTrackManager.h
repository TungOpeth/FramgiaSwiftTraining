
//
//  GaiTrackManager.h
//  Framgia
//
//  Created by Minh Tien on 1/19/17.
//  Copyright (c) 2015 Minh Tien. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GaiTrackManager : NSObject
+ (GaiTrackManager *)sharedTracker;
-(id)getTracker;
-(void)initializeTheTracker;

- (void) trackEventWithView:(NSString*) fromView withAction:(NSString*) action withLabel:(NSString*) label;


@end
