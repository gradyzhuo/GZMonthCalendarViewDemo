//
//  GZViewController.m
//  GZMonthCalendarView
//
//  Created by 卓俊諺 on 2013/10/7.
//  Copyright (c) 2013年 Grady Zhuo. All rights reserved.
//

#import "GZViewController.h"

@interface GZViewController (){
    
}

@end

@implementation GZViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self.scrollView selectDate:[NSDate date]];
//    self.scrollView.pagingEnabled = YES;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)change:(UISegmentedControl *)sender{
    if (sender.selectedSegmentIndex == 0) {
        self.scrollView.alwaysBounceHorizontal = YES;
    }else{
        self.scrollView.alwaysBounceVertical = YES;
    }
}

- (IBAction)goTo:(id)sender {
    GZMonthCalendrView *calendarView = (GZMonthCalendrView *)self.scrollView;
    
    CGRect frame = calendarView.frame;
    CGFloat height = CGRectGetHeight(frame);
    if (height == 55) {
        frame.size.height = CGRectGetWidth(frame);
    }else{
        frame.size.height = 55;
    }
    
    
    [UIView animateWithDuration:5 animations:^{
        calendarView.frame = frame;
    } completion:^(BOOL finished) {
        
    }];

    
    
    
    
//    NSLog(@"%@",calendarView.visibleContentViews);
//    GZCalendarGridView *topContentView = calendarView.visibleContentViews[0];
    
//    CGPoint offset = calendarView.contentOffset;
//    offset.y -= 6000;
//    [calendarView setContentOffset:offset animated:YES];
    
//    [calendarView jumpToToday:YES];
    
//    [calendarView goToDate:nil];
    
//    NSInteger topMonth = [[NSCalendar currentCalendar] ordinalityOfUnit:NSCalendarUnitMonth inUnit:NSYearCalendarUnit forDate:topContentView.baseDate];
//    NSInteger topYear = [[NSCalendar currentCalendar] ordinalityOfUnit:NSCalendarUnitWeekOfYear inUnit:NSCalendarUnitEra forDate:topContentView.baseDate];
//
//    
//    NSInteger todayMonth = [[NSCalendar currentCalendar] ordinalityOfUnit:NSCalendarUnitMonth inUnit:NSYearCalendarUnit forDate:[NSDate date]];
//    NSInteger todayYear = [[NSCalendar currentCalendar] ordinalityOfUnit:NSCalendarUnitWeekOfYear inUnit:NSCalendarUnitEra forDate:[NSDate date]];
//
//    
//    NSUInteger months = ((topYear*12+topMonth) - (todayYear*12+todayMonth));
//    
//    NSDate *topStartDate = topContentView.startDate;
//    
//    
//    NSLog(@"(topYear,topMonth):(%d,%d)",topYear,topMonth);
//    NSLog(@"(todayYear,todayMonth):(%d,%d)",todayYear,todayMonth);
//    NSLog(@"months:%d",months);
    
}



-(void)calendarView:(GZMonthCalendrView *)calendarView didSelectDate:(NSDate *)date{
    NSDateComponents *components = [calendarView.calendar components:NSCalendarUnitWeekOfYear|NSCalendarUnitMonth|NSCalendarUnitWeekOfMonth|NSCalendarUnitWeekOfYear fromDate:date];
    
    NSLog(@"date:%@",components);
    
    
}

-(BOOL)calendarView:(GZMonthCalendrView *)calendarView shouldShowEventFromDate:(NSDate *)fromDate toDate:(NSDate *)date{
    return YES;
}

-(NSArray *)calendarView:(GZMonthCalendrView *)calendarView eventsFromDate:(NSDate *)fromDate toDate:(NSDate *)date{
    return @[@1];
}

- (void)calendarView:(GZMonthCalendrView *)calendarView didShowMonthHeaderLabel:(UILabel *)monthHeaderLabel onBaseDate:(NSDate *)baseDate{
    
    
//    NSInteger toYear = [calendarView.calendar ordinalityOfUnit:NSCalendarUnitWeekOfYear inUnit:NSCalendarUnitEra forDate:[NSDate date]];
//    NSInteger year = [calendarView.calendar ordinalityOfUnit:NSCalendarUnitWeekOfYear inUnit:NSCalendarUnitEra forDate:baseDate];
//    
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    if (toYear != year) {
//        [dateFormatter setDateFormat:@"LLL Y"];
//    }else{
//        [dateFormatter setDateFormat:@"LLL"];
//    }
//    
//    monthHeaderLabel.text = [dateFormatter stringFromDate:baseDate];
    
}

@end
