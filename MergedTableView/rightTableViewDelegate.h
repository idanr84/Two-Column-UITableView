//
//  rightTableViewDelegate.h
//  MergedTableView
//
//  Created by Idan Ratzabi on 01/09/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "scrollingDelegate.h"

@interface rightTableViewDelegate : NSObject<UITableViewDelegate>

@property(nonatomic,weak) id <scrollingDelegate> del;

@end
