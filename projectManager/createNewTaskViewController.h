//
//  createNewTaskViewController.h
//  projectManager
//
//  Created by Paul Kim on 1/15/13.
//  Copyright (c) 2013 Paul Kim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "task.h"

@interface createNewTaskViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate>

@property (retain, nonatomic) task *currTask; //current task to be created
@property (retain, nonatomic) UIDatePicker *datePicker;


@end
