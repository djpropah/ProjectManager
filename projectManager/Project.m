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
