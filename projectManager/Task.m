//
//  task.m
//  projectManager
//
//  Created by Paul Kim on 1/15/13.
//  Copyright (c) 2013 Paul Kim. All rights reserved.
//

#import "Task.h"

@implementation Task


@synthesize name = _name;
@synthesize startDate = _startDate;
@synthesize endDate =_endDate;
@synthesize notes = _notes;


-(void) dealloc{
    self.name = nil;
    self.startDate = nil;
    self.endDate = nil;
    
    [super dealloc];
}

@end
