//
//  projectManagerAppDelegate.h
//  projectManager
//
//  Created by Paul Kim on 1/15/13.
//  Copyright (c) 2013 Paul Kim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "menurViewController.h"
#import "HomeViewController.h"


@interface projectManagerAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (retain, nonatomic) UINavigationController *navController;

@property (retain, nonatomic) HomeViewController *home;
@end
