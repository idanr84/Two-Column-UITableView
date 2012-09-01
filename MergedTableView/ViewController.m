//
//  ViewController.m
//  MergedTableView
//
//  Created by Idan Ratzabi on 31/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "StorageManager.h"

@interface ViewController ()

-(void) loadEvents;

@end

@implementation ViewController
@synthesize leftTableView;
@synthesize rightTableView;

-(id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])
    {
        leftDataSource = [[leftTableViewDataSource alloc] init];
        rightDataSource = [[rightTableViewDataSource alloc] init];
        
        leftDelegate = [[leftTableViewDelegate alloc] init];
        rightDelegate = [[rightTableViewDelegate alloc] init];

    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];    
                
    self.leftTableView.dataSource = leftDataSource;
    self.rightTableView.dataSource = rightDataSource;
    
    
    leftDelegate.del = self;
    rightDelegate.del = self;
    
    self.leftTableView.delegate = leftDelegate;
    self.rightTableView.delegate = rightDelegate;
        
    self.rightTableView.clipsToBounds = NO;
    
    [self loadEvents];
    
}

- (void)viewDidUnload
{
    [self setLeftTableView:nil];
    [self setRightTableView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(void) didScrolled:(UIScrollView*)table
{
    if (table == self.leftTableView)
    {
        rightTableView.contentOffset = leftTableView.contentOffset;     
    }
    else if (table == self.rightTableView) {
        leftTableView.contentOffset = rightTableView.contentOffset;
    }
}


#pragma mark private methods

-(void) loadEvents
{
    NSString *events = @"{\"events\":{\"popular\":[{\"header-logo-url\":\"https:\\/\\/s3.amazonaws.com\\/bizzabo.qa.images\\/events\\/logos\\/SlN8qT27jiyjeyQ.png\",\"name\":\"TLV EXPO overseas properties\"},{\"header-logo-url\":\"https:\\/\\/s3.amazonaws.com\\/bizzabo.qa.images\\/events\\/logos\\/oFbkLZXrQuqPCM5.png\",\"name\":\"Windows Client Usergroup - SCCM2012 & AppV5\"},{\"header-logo-url\":\"https:\\/\\/s3.amazonaws.com\\/bizzabo.qa.images\\/events\\/logos\\/oFbkLZXrQuqPCM5.png\",\"name\":\"Google I\\/OMG\"},{\"header-logo-url\":\"https:\\/\\/s3.amazonaws.com\\/bizzabo.qa.images\\/events\\/logos\\/BTKE4qsUVRJ8Vni.png\",\"name\":\"ZETA Factory Tour: Harriet St. 4-story Behind the Scenes\"},{\"header-logo-url\":\"https:\\/\\/s3.amazonaws.com\\/bizzabo.qa.images\\/events\\/logos\\/kDbUHdxPgad7vAH\",\"name\":\"PRR OSH Forum Special Working Meeting to Develop HazCom 2012 Training\"},{\"header-logo-url\":\"https:\\/\\/s3.amazonaws.com\\/bizzabo.qa.images\\/events\\/logos\\/jRYE7wqnapG7oZY\",\"name\":\"Building Native Mobile Apps Course\"},{\"header-logo-url\":\"https:\\/\\/s3.amazonaws.com\\/bizzabo.qa.images\\/events\\/logos\\/s8PYD9LSSkbwpU0.png\",\"name\":\"WHEN THE UNION VISITS | Best Practices and Legal Implications\"},{\"header-logo-url\":\"https:\\/\\/s3.amazonaws.com\\/bizzabo.qa.images\\/events\\/logos\\/1iz4yrXvIATcsMN.jpg\",\"name\":\"TAP-a-PM Presentation: Project Management for Construction\"},{\"header-logo-url\":\"https:\\/\\/s3.amazonaws.com\\/bizzabo.qa.images\\/events\\/logos\\/Fn5EQ9CV3uW2Azs\",\"name\":\"Titanium Mobile Development Course\"}],\"others\":[{\"header-logo-url\":\"https:\\/\\/s3.amazonaws.com\\/bizzabo.qa.images\\/events\\/logos\\/oFbkLZXrQuqPCM5.png\",\"name\":\"Haifa - Students conference 2012 - Featuring students from all around the world\"},{\"header-logo-url\":\"https:\\/\\/s3.amazonaws.com\\/bizzabo.qa.images\\/events\\/logos\\/tJDdJrE6rlK5Heh.jpg\",\"name\":\"Suggested Israel\"},{\"header-logo-url\":\"https:\\/\\/s3.amazonaws.com\\/bizzabo.qa.images\\/events\\/logos\\/XbYyOW1F0ojVdp5.jpg\",\"name\":\"SSV Focus Group_Jul17_12:00pm\"},{\"header-logo-url\":\"https:\\/\\/s3.amazonaws.com\\/bizzabo.qa.images\\/events\\/logos\\/SlN8qT27jiyjeyQ.png\",\"name\":\"TLV EXPO overseas properties\"},{\"header-logo-url\":\"https:\\/\\/s3.amazonaws.com\\/bizzabo.qa.images\\/events\\/logos\\/c7AocHKEQrmf9uE.jpg\",\"name\":\"SSV Focus Group_Jul17_8:00am\"},{\"header-logo-url\":\"https:\\/\\/s3.amazonaws.com\\/bizzabo.qa.images\\/events\\/logos\\/ZR4gzaSKNuYbRPH.png\",\"name\":\"USGBC-EP + APA-YPG No-Host Happy Hour\"},{\"header-logo-url\":\"https:\\/\\/s3.amazonaws.com\\/bizzabo.qa.images\\/events\\/logos\\/zn51xbVg7jFk9gQ.jpg\",\"name\":\"The Road to a Sale\"},{\"header-logo-url\":\"https:\\/\\/s3.amazonaws.com\\/bizzabo.qa.images\\/events\\/logos\\/H3dq2n0OnOTO571.png\",\"name\":\"Project Management for Auditors Improving audit productivity for GCP, GMP and GLP\"},{\"header-logo-url\":\"https:\\/\\/s3.amazonaws.com\\/bizzabo.qa.images\\/events\\/logos\\/TibsJB4Hz6WAeoo.jpg\",\"name\":\"Organizer Test 07\\/2012\"},{\"header-logo-url\":\"https:\\/\\/s3.amazonaws.com\\/bizzabo.qa.images\\/events\\/logos\\/oQVpISayBQIgSss.jpg\",\"name\":\"Holy Cross Lutheran Church VBS\"},{\"header-logo-url\":\"https:\\/\\/s3.amazonaws.com\\/bizzabo.qa.images\\/events\\/logos\\/ACVgDC68UGH5g40.jpg\",\"name\":\"HTML5 for Beginners\"},{\"header-logo-url\":\"https:\\/\\/s3.amazonaws.com\\/bizzabo.qa.images\\/events\\/logos\\/iP5GCnVRXSmMgYr.jpg\",\"name\":\"Rewire London Unconference\"},{\"header-logo-url\":\"https:\\/\\/s3.amazonaws.com\\/bizzabo.qa.images\\/events\\/logos\\/oFbkLZXrQuqPCM5.png\",\"name\":\"Innovation in Big Data\"},{\"header-logo-url\":\"https:\\/\\/s3.amazonaws.com\\/bizzabo.qa.images\\/events\\/logos\\/tJDdJrE6rlK5Heh.jpg\",\"name\":\"Gluster Developer Summit\"},{\"header-logo-url\":\"https:\\/\\/s3.amazonaws.com\\/bizzabo.qa.images\\/events\\/logos\\/XbYyOW1F0ojVdp5.jpg\",\"name\":\"Home Buying Class - San Francisco\"},{\"header-logo-url\":\"https:\\/\\/s3.amazonaws.com\\/bizzabo.qa.images\\/events\\/logos\\/SlN8qT27jiyjeyQ.png\",\"name\":\"Ignite! Fundraisers\"},{\"header-logo-url\":\"https:\\/\\/s3.amazonaws.com\\/bizzabo.qa.images\\/events\\/logos\\/c7AocHKEQrmf9uE.jpg\",\"name\":\"Barcelona 2012\"},{\"header-logo-url\":\"https:\\/\\/s3.amazonaws.com\\/bizzabo.qa.images\\/events\\/logos\\/ZR4gzaSKNuYbRPH.png\",\"name\":\"Liverpool Tonight\"},{\"header-logo-url\":\"https:\\/\\/s3.amazonaws.com\\/bizzabo.qa.images\\/events\\/logos\\/zn51xbVg7jFk9gQ.jpg\",\"name\":\"LA Lakers alumni\"},{\"header-logo-url\":\"https:\\/\\/s3.amazonaws.com\\/bizzabo.qa.images\\/events\\/logos\\/H3dq2n0OnOTO571.png\",\"name\":\"Paris mobile 2013\"},{\"header-logo-url\":\"https:\\/\\/s3.amazonaws.com\\/bizzabo.qa.images\\/events\\/logos\\/TibsJB4Hz6WAeoo.jpg\",\"name\":\"The London car show\"},{\"header-logo-url\":\"https:\\/\\/s3.amazonaws.com\\/bizzabo.qa.images\\/events\\/logos\\/oQVpISayBQIgSss.jpg\",\"name\":\"TDD Israel\"},{\"header-logo-url\":\"https:\\/\\/s3.amazonaws.com\\/bizzabo.qa.images\\/events\\/logos\\/ACVgDC68UGH5g40.jpg\",\"name\":\"Founders 2012\"},{\"header-logo-url\":\"https:\\/\\/s3.amazonaws.com\\/bizzabo.qa.images\\/events\\/logos\\/iP5GCnVRXSmMgYr.jpg\",\"name\":\"Working moms - USA\"},{\"header-logo-url\":\"https:\\/\\/s3.amazonaws.com\\/bizzabo.qa.images\\/events\\/logos\\/iP5GCnVRXSmMgYr.jpg\",\"name\":\"Rome Mobile show\"},{\"header-logo-url\":\"https:\\/\\/s3.amazonaws.com\\/bizzabo.qa.images\\/events\\/logos\\/iP5GCnVRXSmMgYr.jpg\",\"name\":\"Google - DART for beginners\"}]}}";
    
    [[StorageManager sharedInstance] loadEventsFromJson:events doneBlock:^{
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.leftTableView reloadData];
            [self.rightTableView reloadData];
            
        });
    }];

}
    


@end
