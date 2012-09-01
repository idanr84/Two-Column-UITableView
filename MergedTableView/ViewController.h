//
//  ViewController.h
//  MergedTableView
//
//  Created by Idan Ratzabi on 31/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "leftTableViewDataSource.h"
#import "rightTableViewDataSource.h"
#import "leftTableViewDelegate.h"
#import "rightTableViewDelegate.h"
#import "scrollingDelegate.h"

@interface ViewController : UIViewController<UITableViewDelegate,scrollingDelegate>
{
    leftTableViewDataSource* leftDataSource;
    rightTableViewDataSource* rightDataSource;
    leftTableViewDelegate* leftDelegate;
    rightTableViewDelegate* rightDelegate;
    

}
@property (weak, nonatomic) IBOutlet UITableView *leftTableView;
@property (weak, nonatomic) IBOutlet UITableView *rightTableView;

@end
