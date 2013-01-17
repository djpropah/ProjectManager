//
//  TaskInfoViewController.h
//  projectManager
//
//  Created by Paul Kim on 1/16/13.
//  Copyright (c) 2013 Paul Kim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TaskInfoViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>
@property (retain, nonatomic) UITableView *theTableView;

@end
