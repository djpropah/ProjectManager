//
//  InfoTaskViewController.h
//  projectManager
//
//  Created by Paul Kim on 1/17/13.
//  Copyright (c) 2013 Paul Kim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InfoTaskViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (retain, nonatomic) UITableView *theTableView;

@end
