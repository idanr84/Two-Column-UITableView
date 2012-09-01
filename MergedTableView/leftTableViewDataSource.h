//
//  leftTableViewDataSource.h
//  MergedTableView
//
//  Created by Idan Ratzabi on 31/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface leftTableViewDataSource : NSObject<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) NSMutableArray* events;

@end
