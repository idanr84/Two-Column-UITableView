//
//  rightTableViewDataSource.m
//  MergedTableView
//
//  Created by Idan Ratzabi on 31/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "rightTableViewDataSource.h"
#import "StorageManager.h"
#import "Event.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation rightTableViewDataSource

        
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSUInteger eventCount; 
    
    if (section == 0)
    {
        eventCount = [[StorageManager sharedInstance] popularCount];
    }
    else if (section == 1) {
        eventCount = [[StorageManager sharedInstance] othersCount];
    }
    
    if (section == 0)
        eventCount =  eventCount/2;
    else if (section == 1)
        eventCount = eventCount/2 +1;    
    
    return eventCount;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString* CellIdentifier = @"EventCell";
    
        
    // This empty cell is needed so we can scroll all the way on the right table view as well
    NSInteger sectionsAmount = [tableView numberOfSections];
    NSInteger rowsAmount = [tableView numberOfRowsInSection:[indexPath section]];
    if ([indexPath section] == sectionsAmount - 1 && [indexPath row] == rowsAmount - 1) {
        
        UITableViewCell* lastEmptyCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"whatever"];
        
        lastEmptyCell.backgroundColor = [UIColor colorWithRed:85.0/255.0 green:85.0/255.0 blue:85.0/255.0 alpha:1];        
        
        return lastEmptyCell;
    }

    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (nil == cell) {
        
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:self options:nil];
        cell = [topLevelObjects objectAtIndex:0];
        cell.selectionStyle =  UITableViewCellSelectionStyleNone;        
    }
    
    Event* event = nil;
    
    if (indexPath.section == 0)
    {
        event = [[StorageManager sharedInstance] getPopularEventAtIndex:(indexPath.row*2) + 1];
    }
    else if (indexPath.section == 1)
    {
        event = [[StorageManager sharedInstance] getOtherEventAtIndex:(indexPath.row*2) + 1];
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
    
    
    return cell;
}


@end
