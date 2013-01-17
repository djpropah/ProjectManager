//
//  createNewTaskViewController.m
//  projectManager
//
//  Created by Paul Kim on 1/15/13.
//  Copyright (c) 2013 Paul Kim. All rights reserved.
//

#import "createNewTaskViewController.h"
#import "planningViewController.h"
#import "task.h"

@interface createNewTaskViewController ()
@property (retain, nonatomic) UITextField *taskNameField;
@property (retain, nonatomic) UILabel *lblStartDate;
@property (retain, nonatomic) UILabel *lblEndDate;
@property (retain, nonatomic) UILabel *statusLabel;
@property (retain, nonatomic) UISlider *statusComplete;
@property (retain, nonatomic) UITextView *notes;
@property (nonatomic) BOOL pickingEndDate;

@end

@implementation createNewTaskViewController
@synthesize currTask = _currTask;
@synthesize datePicker = _datePicker;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _currTask = [[task alloc]init];
        self.pickingEndDate = NO;
    }
    return self;
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

-(void) loadView{
    CGRect frame = [UIScreen mainScreen].applicationFrame;
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = [UIColor redColor];
    
    CGFloat padding = 5.0f;
    CGFloat y = padding;
    
  
    
    
    //creating the textfield for the task name
    y+= padding;
    self.taskNameField = [[[UITextField alloc] initWithFrame:CGRectMake(padding, y, view.frame.size.width-20, 30.00)] autorelease];
    self.taskNameField.borderStyle = UITextBorderStyleRoundedRect;
    self.taskNameField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.taskNameField.placeholder = @"Task Name";
    self.taskNameField.delegate = self;  //textFieldShouldReturn is delegate method implemented below
    [view addSubview:self.taskNameField];
    
    
    //label for start date
    y+= self.taskNameField.frame.size.height + padding;
    self.lblStartDate = [[[UILabel alloc] initWithFrame:CGRectMake(padding, y, 150, 20)] autorelease];
    self.lblStartDate.backgroundColor = [UIColor whiteColor];
    [view addSubview:self.lblStartDate];
    
    
    //label for end date
    self.lblEndDate = [[[UILabel alloc] initWithFrame:CGRectMake(padding*2 + self.lblStartDate.frame.size.width, y, 150, 20)] autorelease];
    self.lblEndDate.backgroundColor = [UIColor whiteColor];
    [view addSubview:self.lblEndDate];
    
    //button for locking in the start date buttom
    y += self.lblStartDate.frame.size.height + padding;
    UIButton *startDateButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    startDateButton.tag = 1000;
    startDateButton.frame = CGRectMake(padding, y, self.lblStartDate.frame.size.width, self.lblStartDate.frame.size.height);
    [startDateButton addTarget:self action:@selector(btnDateAction:) forControlEvents:UIControlEventTouchUpInside];
    [startDateButton setTitle:@"start date" forState:UIControlStateNormal];
    [view addSubview:startDateButton];
    
    //button for locking in the end date
    UIButton *endDateButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    endDateButton.tag = 1001;
    endDateButton.frame = CGRectMake(2*padding + self.lblStartDate.frame.size.width, y, self.lblStartDate.frame.size.width, self.lblStartDate.frame.size.height);
    [endDateButton addTarget:self action:@selector(btnDateAction:) forControlEvents:UIControlEventTouchUpInside];
    [endDateButton setTitle:@"end date" forState:UIControlStateNormal];
    [view addSubview:endDateButton];
    
    
    
    //date picker
    self.datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    CGFloat h = self.datePicker.frame.size.height;
    self.datePicker.datePickerMode = UIDatePickerModeDate;
    self.datePicker.frame = CGRectMake(0, frame.size.height, frame.size.width, h);
    [self.datePicker addTarget:self action:@selector(datePickerChanged:) forControlEvents:UIControlEventValueChanged];
   
  
    [view addSubview:self.datePicker];
    
    
    //slider status
    y+= endDateButton.frame.size.height + padding;
    self.statusLabel = [[UILabel alloc] initWithFrame:CGRectMake(view.frame.size.width/2-20, y, 40, endDateButton.frame.size.height)];
    
    [view addSubview:self.statusLabel];
    
    
    
    //slider
    y+= self.statusLabel.frame.size.height + padding*2;
    self.statusComplete = [[UISlider alloc] initWithFrame:CGRectMake(padding, y, startDateButton.frame.size.width*2, startDateButton.frame.size.height)];
    [self.statusComplete addTarget:self action:@selector(getCurrentStatusValue:) forControlEvents:UIControlEventValueChanged];
    [view addSubview:self.statusComplete];
    
    
    //Textview
    y+= self.statusComplete.frame.size.height + padding *2;
    self.notes = [[UITextView alloc] initWithFrame:CGRectMake(padding, y, self.statusComplete.frame.size.width, self.statusComplete.frame.size.height*5)];
    self.notes.delegate = self;
    [view addSubview:self.notes];
    
    //cancel button that transitions out of create task view and back into the planning view
    UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    cancelButton.frame = CGRectMake(view.frame.size.width -80, view.frame.size.height - 40, 80, 40);
    [cancelButton setTitle: @"cancel" forState:UIControlStateNormal];
    [view addSubview:cancelButton];
    [cancelButton addTarget:self  action:@selector(buttonCancel:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *createButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    createButton.frame = CGRectMake(cancelButton.frame.origin.x-100, view.frame.size.height - 40, 80, 40);
    [createButton setTitle: @"create" forState:UIControlStateNormal];
    [view addSubview:createButton];
    [createButton addTarget:self  action:@selector(buttonCreate:) forControlEvents:UIControlEventTouchUpInside];
    

    
    
    
    self.view = view;
    
    [view release];
}

- (void)textViewDidEndEditing:(UITextView *)textView{
    [textView resignFirstResponder];
    NSLog(@"done editing");
}

-(void) buttonCreate:(UIButton *) btn{
    NSLog(@"need to set task class");
}


-(void) getCurrentStatusValue:(UISlider *) slider{
    
    NSString *value = [NSString stringWithFormat:@"%.1f", 100*slider.value];
    self.statusLabel.text = value;
    
    
}

-(void) showDatePicker
{
   
    CGRect frame  = self.datePicker.frame;
    if(frame.origin.y< 480.0f) return;
    
    [UIView animateWithDuration:0.3f
            delay:0.0f options:UIViewAnimationCurveLinear animations:
            ^{
                CGRect frame  = self.datePicker.frame;
                frame.origin.y -= frame.size.height;
                self.datePicker.frame = frame;}
            completion:NULL];
    
    
    
}


-(void) hideDatePicker{
    CGRect frame  = self.datePicker.frame;
    if(frame.origin.y > 480.0f) return;
    
    [UIView animateWithDuration:0.3f
                          delay:0.0f options:UIViewAnimationCurveLinear animations:
     ^{
         CGRect frame  = self.datePicker.frame;
         frame.origin.y += frame.size.height;
         self.datePicker.frame = frame;}
                     completion:NULL];
}

-(void) datePickerChanged: (UIDatePicker *) datePicker{
    if(!self.pickingEndDate){
       
        
        NSLog(@"changed the startdate");
    }
    else{
        
        NSLog(@"changed the startdate");}
    
}

-(void) btnDateAction:(UIButton *) btn{//!!--HOW DO I RESIGN THE DATE PICKER AS FIRST RESPONDER??--!!
    [self showDatePicker];
    
    //[self.datePicker setHidden:NO];
    if (btn.tag == 1000) {
     //   [self.datePicker setHidden:NO];
        self.lblStartDate.text = _datePicker.date.description;
        //self.currTask.startDate = _datePicker.date;
        
    }
    
    if (btn.tag == 1001) {
     //   [self.datePicker setHidden:NO];
        self.lblEndDate.text = _datePicker.date.description;
      //  self.currTask.endDate = _datePicker.date;
    }
    
    
    NSLog(@"btnDateAction:%d", btn.tag);
    
}


-(void) buttonCancel:(UIButton *) btn{
    [self dismissViewControllerAnimated:YES completion:NULL];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{//delegate method to handle an empty task name
    [textField resignFirstResponder];
    
    if (self.taskNameField.text.length ==0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Name" message:@"Please enter a task name" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [alert show];
        [alert release];
        return YES;
    }
    self.currTask.name = self.taskNameField.text;
    
    
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{

}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    
    if([touch.view isEqual:self.datePicker] == NO){
        [self hideDatePicker];
    }
    
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{}
@end
