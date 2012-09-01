//
//  leftTableViewDataSource.m
//  MergedTableView
//
//  Created by Idan Ratzabi on 31/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "leftTableViewDataSource.h"
#import "StorageManager.h"
#import "Event.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation leftTableViewDataSource

@synthesize events;

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSUInteger eventCount=0; 
    
    if (section == 0)
    {
        eventCount = [[StorageManager sharedInstance] popularCount];
    }
    else if (section == 1) {
        eventCount = [[StorageManager sharedInstance] othersCount];
    }
    
    if ((eventCount % 2) == 0)
        return eventCount/2;
    else    
        return eventCount/2 + 1;
        
    return eventCount;
    
}

// using 2 footers
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString* CellIdentifier = @"EventCell";         
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (nil == cell) {
        
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:self options:nil];
        cell = [topLevelObjects objectAtIndex:0];
        cell.selectionStyle =  UITableViewCellSelectionStyleNone;
    }
    
    
    Event* event = nil;
        
    if (indexPath.section == 0)
    {
        event = [[StorageManager sharedInstance] getPopularEventAtIndex:(indexPath.row*2)];
    }
    else if (indexPath.section == 1)
    {
        event = [[StorageManager sharedInstance] getOtherEventAtIndex:(indexPath.row*2)];
    }

    
    UIImageView* eventImage = (UIImageView*) [cell viewWithTag:2];    
    UILabel* name = (UILabel*)[cell viewWithTag:1];
    
    if (event)
    {
        [eventImage setImageWithURL:[NSURL URLWithString:event.headerLogoUrl]
                   placeholderImage:nil];
        name.text = event.name;
        
    }    
    else {
        NSLog(@"no event - error, shouldn't happen!!");
    }
    
    // doing this so the section view footer won't float (I'm using grouped table view as well for that)
    cell.backgroundView=[[UIView alloc] initWithFrame:cell.bounds];
    
    return cell;
}




@end
