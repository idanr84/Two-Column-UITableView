//
//  leftTableViewDelegate.m
//  MergedTableView
//
//  Created by Idan Ratzabi on 01/09/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "leftTableViewDelegate.h"
#import "StorageManager.h"
#import "Event.h"

@implementation leftTableViewDelegate

@synthesize del;

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [del didScrolled:scrollView];
}


// I'm using a footer with background color only for separation, and only between the two sections
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section   // custom view for footer. 
{
    if (section == 0)
    {
        CGRect rect = CGRectMake(0, 0, 160, 42);
        
        UIView* spaceHeader = [[UIView alloc] initWithFrame:rect];        
        
        
        spaceHeader.backgroundColor = [UIColor colorWithRed:85.0/255.0 green:85.0/255.0 blue:85.0/255.0 alpha:1];        
        
        return spaceHeader;        
    }
    else {
        return nil;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 42;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 168;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Event* selectedEvent = nil;
    
    if (indexPath.section == 0)
    {
        selectedEvent = [[StorageManager sharedInstance] getPopularEventAtIndex:(indexPath.row*2)];
    }
    else if (indexPath.section == 1)
    {
        selectedEvent = [[StorageManager sharedInstance] getOtherEventAtIndex:(indexPath.row*2)];
    }
        
    
    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Bizzabo Event" message:selectedEvent.name delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    [alertView show];
}



@end
