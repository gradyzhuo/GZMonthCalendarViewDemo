//
//  GZViewController.m
//  GZMonthCalendarView
//
//  Created by 卓俊諺 on 2013/10/7.
//  Copyright (c) 2013年 Grady Zhuo. All rights reserved.
//

#import "GZViewController.h"
#import "GZCusomCellLayoutEventList.h"

@interface GZViewController (){
    id<GZCalendarCellLayout> _customCellLayout;
}

@end

@implementation GZViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSDate *todayDate = [NSDate date];
    
    [self.monthCalendarView selectDate:todayDate];
    _customCellLayout = [GZCusomCellLayoutEventList new];
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"已選取：yyyy/MM/dd"];
    self.selectedShownLabel.text = [dateFormatter stringFromDate:todayDate];
    
//    self.monthCalendarView.backgroundColor = [UIColor clearColor];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)styleSegmentChanged:(id)sender{
    [self.monthCalendarView reloadDataWithDate:self.monthCalendarView.selectedDate];
}


#pragma mark - month calendar view delegate

- (GZCalendarGridViewCellStyle)cellStyleForCalendarView:(GZMonthCalendrView *)calendarView{
    return self.styleSegment.selectedSegmentIndex == 1 ? GZCalendarGridViewCellStyleCustom : GZCalendarGridViewCellStyleDateOnly;
}

- (id<GZCalendarCellLayout>)customCellLayoutForCalendarView:(GZMonthCalendrView *)calendarView{
    return _customCellLayout;
}


-(void)calendarView:(GZMonthCalendrView *)calendarView didSelectDate:(NSDate *)date{
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"已選取：yyyy/MM/dd"];
    self.selectedShownLabel.text = [dateFormatter stringFromDate:date];
}

-(BOOL)calendarView:(GZMonthCalendrView *)calendarView shouldShowEventFromDate:(NSDate *)fromDate toDate:(NSDate *)date{
    return YES;
}

-(NSArray *)calendarView:(GZMonthCalendrView *)calendarView eventsFromDate:(NSDate *)fromDate toDate:(NSDate *)date{
    return @[@1];
}


@end
