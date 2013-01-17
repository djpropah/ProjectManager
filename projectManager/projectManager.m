//
//  projectManager.m
//  projectManager
//
//  Created by Paul Kim on 1/15/13.
//  Copyright (c) 2013 Paul Kim. All rights reserved.
//

#import "projectManager.h"

@implementation projectManager
@synthesize manager = _manager;
@synthesize assignees = _assignees;
@synthesize tasks = _tasks;

-(void) dealloc{
    self.manager = nil;
    self.assignees = nil;
    self.tasks = nil;
    [super dealloc];
}



@end
