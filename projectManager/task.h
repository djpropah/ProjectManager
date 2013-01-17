//
//  task.h
//  projectManager
//
//  Created by Paul Kim on 1/15/13.
//  Copyright (c) 2013 Paul Kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface task : NSObject

@property (copy, nonatomic) NSString *name;
@property (retain, nonatomic) NSDate *startDate;
@property (retain, nonatomic) NSDate *endDate;
@property (retain, nonatomic) NSMutableArray *assignees;



@end
