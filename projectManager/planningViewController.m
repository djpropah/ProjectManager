//
//  planningViewController.m
//  projectManager
//
//  Created by Paul Kim on 1/15/13.
//  Copyright (c) 2013 Paul Kim. All rights reserved.
//

#import "planningViewController.h"
#import "createNewTaskViewController.h"
@interface planningViewController ()

@end

@implementation planningViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem *createTask = [[UIBarButtonItem alloc] initWithTitle:@"create" style:UIBarButtonItemStyleBordered target:self action:@selector(createTask:)];
    
    self.navigationItem.rightBarButtonItem = createTask;
    [createTask release];
	
}

-(void) createTask: (UIBarButtonItem *) btn{
    NSLog(@"created task");
    
    createNewTaskViewController *newTask = [[createNewTaskViewController alloc] init];
    [self presentViewController:newTask animated:YES completion:NULL];
    [newTask release];
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
   
}

-(void) loadView{
    CGRect frame = [UIScreen mainScreen].applicationFrame;
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = [UIColor redColor];

  
    
    self.view = view;
    [view release];
}

@end
