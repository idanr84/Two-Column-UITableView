//
//  scrollingDelegate.h
//  MergedTableView
//
//  Created by Idan Ratzabi on 01/09/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol scrollingDelegate <NSObject>

-(void) didScrolled:(UIScrollView*)table;

@end
