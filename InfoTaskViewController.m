//
//  InfoTaskViewController.m
//  projectManager
//
//  Created by Paul Kim on 1/17/13.
//  Copyright (c) 2013 Paul Kim. All rights reserved.
//

#import "InfoTaskViewController.h"

@interface InfoTaskViewController ()

@end

@implementation InfoTaskViewController
@synthesize theTableView = _theTableView;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void) loadView{
    
    CGRect frame = [UIScreen mainScreen].applicationFrame;
    
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = [UIColor orangeColor];
    frame.origin.y=0;
    
    self.theTableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    self.theTableView.dataSource = self;
    self.theTableView.delegate = self;
    [view addSubview:self.theTableView];
    
    
    
    self.view = view;
    
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 40;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellID = @"ID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
   
    if(cell ==nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    cell.textLabel.text = [NSString stringWithFormat:@"row %d", indexPath.row];
    
    return cell;
}

@end
