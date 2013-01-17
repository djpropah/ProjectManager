//
//  HomeViewController.m
//  projectManager
//
//  Created by Paul Kim on 1/15/13.
//  Copyright (c) 2013 Paul Kim. All rights reserved.
//

#import "HomeViewController.h"
#import "menurViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(IBAction)newProj:(id)sender{
    menurViewController *menu = [[menurViewController alloc] init];
    [self.navigationController pushViewController:menu animated:YES];
    [HomeViewController release];
    
    NSLog(@"new proj");
}

-(IBAction)existingProj:(id)sender{
    menurViewController *menu = [[menurViewController alloc] init];
    [self.navigationController pushViewController:menu animated:YES];
    [HomeViewController release];
    
    
    NSLog(@"existing proj");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_newProj release];
    [_existingProj release];
    [super dealloc];
}
@end
