//
//  StorageManager.m
//  MergedTableView
//
//  Created by Idan Ratzabi on 01/09/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "StorageManager.h"
#import "Event.h"

@implementation StorageManager

+ (StorageManager*)sharedInstance
{
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

-(id) init
{
    if (self = [super init])
    {
        events = [[NSMutableArray alloc] init];
        popular = [[NSMutableArray alloc] init];
        others = [[NSMutableArray alloc] init];
    }
    
    return self;
}

-(Event*) getEventAtIndex:(NSInteger)index
{
    return [events objectAtIndex:index];
}
-(Event*) getPopularEventAtIndex:(NSInteger)index
{
    return [popular objectAtIndex:index];
}
-(Event*) getOtherEventAtIndex:(NSInteger)index
{
    return [others objectAtIndex:index];
}

-(NSUInteger) eventCount
{
    return [events count];
}
-(NSUInteger) popularCount
{
    return [popular count];
}
-(NSUInteger) othersCount
{
    return [others count];
}

-(void) loadEventsFromJson:(NSString*)json doneBlock:(void ( ^ )(void))block
{
        
    dispatch_async(    dispatch_get_global_queue(
                                                 DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),
                   
                ^{
                    NSError* err;
                    
                    NSDictionary *JSON = 
                    [NSJSONSerialization JSONObjectWithData: [json dataUsingEncoding:NSUTF8StringEncoding] 
                                                    options: kNilOptions 
                                                      error: &err];
                    
                    NSDictionary* eventsDic = [JSON objectForKey:@"events"];
                    
                    NSArray* popularDic = [eventsDic objectForKey:@"popular"];                                                        
                    
                    for (NSDictionary* eve in popularDic)
                    {
                        Event* event = [[Event alloc]init];
                        event.name = [eve objectForKey:@"name"];
                        event.headerLogoUrl = [eve objectForKey:@"header-logo-url"];
                        
                        [events addObject:event];
                        [popular addObject:event];
                    }
                    
                    NSArray* otherDic = [eventsDic objectForKey:@"others"];
                    
                    for (NSDictionary* eve in otherDic)
                    {
                        Event* event = [[Event alloc]init];
                        event.name = [eve objectForKey:@"name"];
                        event.headerLogoUrl = [eve objectForKey:@"header-logo-url"];
                        
                        [events addObject:event];
                        [others addObject:event];
                    }                    
                    
                   block();

    });
    
        
}

@end
