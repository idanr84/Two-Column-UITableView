//
//  rightTableViewDelegate.m
//  MergedTableView
//
//  Created by Idan Ratzabi on 01/09/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "rightTableViewDelegate.h"
#import "StorageManager.h"
#import "Event.h"


@implementation rightTableViewDelegate

@synthesize del;

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [del didScrolled:scrollView];
}

+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize
{
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();    
    UIGraphicsEndImageContext();
    return newImage;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    // Some random numbers I choose that look alright (the provided images seem to have wrong sizes)
    CGRect rect = CGRectMake(-50, 0, 210, 33);
    
    UIView* eventHeader = [[UIView alloc] initWithFrame:rect];        
        
    UIImageView* backgroundImg = [[UIImageView alloc] initWithFrame:rect];

    backgroundImg.image = [[self class] imageWithImage:[UIImage imageNamed:@"section_header"] scaledToSize:rect.size];
    
    
    CGRect tmp = rect;
    tmp.size.height += 20;
    backgroundImg.frame = tmp;

    
    [eventHeader addSubview:backgroundImg];
        
    UILabel* lbl = [[UILabel alloc] initWithFrame:CGRectZero];
            
    lbl.frame = rect;
    
    lbl.backgroundColor = [UIColor clearColor];    
    lbl.textAlignment = UITextAlignmentCenter;
    
    [eventHeader addSubview:lbl];
    
    if (section == 0)
    {
        lbl.text = @"Popular";
    }
    else if (section == 1) {
        lbl.text = @"Others";
    }
    
    return eventHeader;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 33;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 168;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Event* selectedEvent;
    
    if (indexPath.section == 0)
    {
        selectedEvent = [[StorageManager sharedInstance] getPopularEventAtIndex:(indexPath.row*2) + 1];
    }
    else if (indexPath.section == 1)
    {
        selectedEvent = [[StorageManager sharedInstance] getOtherEventAtIndex:(indexPath.row*2) + 1];
    }

    
    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Bizzabo Event" message:selectedEvent.name delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    [alertView show];
}


@end
