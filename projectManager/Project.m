//
//  projectManager.m
//  projectManager
//
//  Created by Paul Kim on 1/15/13.
//  Copyright (c) 2013 Paul Kim. All rights reserved.
//

#import "Project.h"
#import "Task.h"
#import "Assignee.h"

@implementation Project
@synthesize manager = _manager;
@synthesize assignees = _assignees;
@synthesize tasks = _tasks;


-(id)init{
    self = [super init];
  
    if (self) {
        Project *testProject = [[Project alloc] init];
        
        
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
        
        assignee2.taskList = [[NSMutableArray alloc] initWithObjects:task3,task4,nil];
        
        testProject.manager = @"Greg";
        testProject.assignees = [[NSArray alloc] initWithObjects:assignee1, assignee2, nil];
    }
    
    
    return self;
}
-(void) dealloc{
    self.manager = nil;
    self.assignees = nil;
    self.tasks = nil;
    [super dealloc];
}



@end
