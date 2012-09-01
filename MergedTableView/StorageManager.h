//
//  StorageManager.h
//  MergedTableView
//
//  Created by Idan Ratzabi on 01/09/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Event.h"

@interface StorageManager : NSObject
{
    NSMutableArray* events;
    NSMutableArray* popular;
    NSMutableArray* others;
}

+ (StorageManager*)sharedInstance;
-(Event*) getEventAtIndex:(NSInteger)index;
-(Event*) getPopularEventAtIndex:(NSInteger)index;
-(Event*) getOtherEventAtIndex:(NSInteger)index;
-(NSUInteger) eventCount;
-(NSUInteger) popularCount;
-(NSUInteger) othersCount;
-(void) loadEventsFromJson:(NSString*)json doneBlock:(void ( ^ )(void))block;

@end
