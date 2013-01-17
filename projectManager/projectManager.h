//
//  projectManager.h
//  projectManager
//
//  Created by Paul Kim on 1/15/13.
//  Copyright (c) 2013 Paul Kim. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface projectManager : NSObject
@property (copy, nonatomic) NSString *manager;
@property (retain, nonatomic) NSArray *assignees;
@property (retain, nonatomic) NSArray *tasks;



@end
