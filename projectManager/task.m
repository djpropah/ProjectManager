//
//  task.m
//  projectManager
//
//  Created by Paul Kim on 1/15/13.
//  Copyright (c) 2013 Paul Kim. All rights reserved.
//

#import "task.h"

@implementation task


@synthesize name = _name;
@synthesize startDate = _startDate;
@synthesize endDate =_endDate;
@synthesize assignees = _assignees;


-(void) dealloc{
    self.name = nil;
    self.startDate = nil;
    self.endDate = nil;
    self.assignees = nil;
    [super dealloc];
}

@end
