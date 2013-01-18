//
//  menurViewController.m
//  projectManager
//
//  Created by Paul Kim on 1/15/13.
//  Copyright (c) 2013 Paul Kim. All rights reserved.
//

#import "menurViewController.h"
#import "planningViewController.h"
#import "InfoTaskViewController.h"


@interface menurViewController ()

@end

@implementation menurViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(IBAction)planningSession:(id)sender{
    planningViewController *planning = [[planningViewController alloc] init];
    [self.navigationController pushViewController:planning animated:YES];
    [planningViewController release];
    
    
    
    NSLog(@"planning session button");
}





-(IBAction)operations:(id)sender
{
    
    InfoTaskViewController *taskController = [[InfoTaskViewController alloc]init];
    
    
    
    [self.navigationController pushViewController:taskController animated:YES];
    
    [InfoTaskViewController release];
    NSLog(@"operations session");
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
    [_planningSession release];
    [_operations release];
    [super dealloc];
}
@end
