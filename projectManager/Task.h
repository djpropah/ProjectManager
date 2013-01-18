#import <Foundation/Foundation.h>



@interface Task : NSObject


@property (retain,nonatomic) NSString *name;
@property (retain, nonatomic) NSDate *startDate;
@property (retain, nonatomic) NSDate *endDate;
@property (retain, nonatomic) NSArray *assignees;
@property (retain, nonatomic) NSString *notes;


@end