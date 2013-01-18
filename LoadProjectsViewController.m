//
//  LoadProjectsViewController.m
//  projectManager
//
//  Created by Paul Kim on 1/18/13.
//  Copyright (c) 2013 Paul Kim. All rights reserved.
//

#import "LoadProjectsViewController.h"
#import "Project.h"
#import "Assignee.h"



@interface LoadProjectsViewController ()
@property (retain, nonatomic) Project *testProject;
@property (retain, nonatomic) Project *testProject2;
@property (retain, nonatomic) NSArray *projectList;
@end

@implementation LoadProjectsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.testProject = [[Project alloc] init];
        
        Assignee *assignee1 = [[Assignee alloc] init];
        assignee1.assigneeName = @"Robert";
        Task *task1 = [[Task alloc] init];
        task1.name = @"task1";
        Task *task2 = [[Task alloc] init];
        task2.name = @"task2";
        assignee1.taskList = [[NSMutableArray alloc] initWithObjects:task1,task2,nil];
        
        
        Assignee *assignee2 = [[Assignee alloc] init];
        assignee2.assigneeName = @"James";
        Task *task3 = [[Task alloc] init];
        task3.name = @"task3";
        Task *task4 = [[Task alloc] init];
        task4.name = @"task4";
        Task *task5 = [[Task alloc] init];
        task4.name = @"task5";
        assignee2.taskList = [[NSMutableArray alloc] initWithObjects:task3,task4,task5, nil];
        
        self.testProject.manager = @"Greg";
        self.testProject.assignees = [[NSArray alloc] initWithObjects:assignee1, assignee2, nil];
        
        
        self.testProject2 = [[Project alloc] init];
        
        Assignee *assignee3 = [[Assignee alloc] init];
        assignee3.assigneeName = @"David";
        Task *task6 = [[Task alloc] init];
        task1.name = @"task6";
        Task *task7 = [[Task alloc] init];
        task2.name = @"task7";
        assignee3.taskList = [[NSMutableArray alloc] initWithObjects:task6,task7,nil];
        
        
        Assignee *assignee4 = [[Assignee alloc] init];
        assignee4.assigneeName = @"Helen";
        Task *task8 = [[Task alloc] init];
        task3.name = @"task8";
        Task *task9 = [[Task alloc] init];
        task4.name = @"task9";
        Task *task10 = [[Task alloc] init];
        task4.name = @"task10";
        
        
        assignee2.taskList = [[NSMutableArray alloc] initWithObjects:task8,task9,task10, nil];
        
        self.testProject2.manager = @"Jennifer";
        self.testProject.assignees = [[NSArray alloc] initWithObjects:assignee3, assignee4, nil];
        
        self.projectList = [[NSArray alloc] initWithObjects:self.testProject, self.testProject2, nil];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGRect frame = [UIScreen mainScreen].applicationFrame;
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = [UIColor purpleColor];
    
    
    UITableView *allProjects = [[UITableView alloc] initWithFrame:frame];
    //[view addSubview:allProjects];
    
    self.view = view;
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
