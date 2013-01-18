//
//  Assignee.h
//  projectManager
//
//  Created by Denny Kwon on 1/17/13.
//  Copyright (c) 2013 Paul Kim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Task.h"

@interface Assignee : NSObject
@property (retain, nonatomic) NSString *assigneeName;
@property (retain, nonatomic) NSMutableArray *taskList;

@end
