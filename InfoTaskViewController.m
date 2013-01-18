//
//  InfoTaskViewController.m
//  projectManager
//
//  Created by Paul Kim on 1/17/13.
//  Copyright (c) 2013 Paul Kim. All rights reserved.
//

#import "InfoTaskViewController.h"
#import "Project.h"
#import "Assignee.h"
#import "Task.h"




@interface InfoTaskViewController ()
@property (retain, nonatomic) Project *testProject;
@end

@implementation InfoTaskViewController
@synthesize theTableView = _theTableView;


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

    }
    return self;
}

-(void) loadView{
    
    CGRect frame = [UIScreen mainScreen].applicationFrame;
    
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = [UIColor orangeColor];
    frame.origin.y=0;
    
    self.theTableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    self.theTableView.dataSource = self;
    self.theTableView.delegate = self;
    [view addSubview:self.theTableView];
    
    view.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    self.theTableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    
    self.view = view;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    Assignee *sectionAssignee = [self.testProject.assignees objectAtIndex:section];
    
    NSLog (@"section titles:%@", sectionAssignee.assigneeName);
    return sectionAssignee.assigneeName;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
        Assignee *currAssignee = [self.testProject.assignees objectAtIndex:section];
    
    return currAssignee.taskList.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.testProject.assignees.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellID = @"ID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
   
    if(cell ==nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    cell.textLabel.text = [NSString stringWithFormat:@"row %d", indexPath.row];
    
    return cell;
}

@end
