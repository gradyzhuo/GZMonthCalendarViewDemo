//
//  GZViewController.h
//  GZMonthCalendarView
//
//  Created by 卓俊諺 on 2013/10/7.
//  Copyright (c) 2013年 Grady Zhuo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GZKit/GZKit.h>

@interface GZViewController : UIViewController<GZMonthCalendrViewDelegate>

@property (weak, nonatomic) IBOutlet GZMonthCalendrView *scrollView;

- (IBAction)change:(id)sender;
- (IBAction)goTo:(id)sender;

@end
