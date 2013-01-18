//
//  menurViewController.h
//  projectManager
//
//  Created by Paul Kim on 1/15/13.
//  Copyright (c) 2013 Paul Kim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Project.h"

@interface menurViewController : UIViewController

@property (retain, nonatomic) Project *currentProject;

@property (retain, nonatomic) IBOutlet UIButton *planningSession;

@property (retain, nonatomic) IBOutlet UIButton *operations;

@end
