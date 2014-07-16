//
//  FMCalendarCellLayoutEventList.m
//  FMKit
//
//  Created by 卓俊諺 on 2013/8/12.
//  Copyright (c) 2013年 Grady Zhuo. All rights reserved.
//

#import "GZCusomCellLayoutEventList.h"

@implementation GZCusomCellLayoutEventList


- (void) drawCellBorderInRect:(CGRect)rect withBoardColor:(UIColor *)boardColor borderWidth:(CGFloat)borderWidth{
    UIColor* strokeColor = boardColor;
    
    //// Rectangle Drawing
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: rect];
    [[UIColor clearColor] setFill];
    [rectanglePath fill];
    [strokeColor setStroke];
    rectanglePath.lineWidth = borderWidth;
    [rectanglePath stroke];
}

- (CGRect) rectForTextRectFromRect:(CGRect)rect{
    return CGRectMake(rect.origin.x, rect.origin.y, rect.size.width,20);
}


- (void) drawCellInRect:(CGRect)rect withDateText:(NSString *)textContent textColor:(UIColor *)textContentColor backgroundColor:(UIColor *)backgroundColor{
    
    
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    
    UIColor* color5 = backgroundColor;
    
    //// rects
    //    CGRect rect = CGRectMake(0, 0, 40, 40);
    
    
    //// Abstracted Attributes
//    CGRect textRect = CGRectMake(CGRectGetMinX(rect) + floor(CGRectGetWidth(rect) * 0.00000 + 0.5)+5, CGRectGetMinY(rect) + floor(CGRectGetHeight(rect) * 0.00000 + 0.5), floor(CGRectGetWidth(rect) * 0.37500 + 0.5) - floor(CGRectGetWidth(rect) * 0.00000 + 0.5)+5, floor(CGRectGetHeight(rect) * 0.37500 + 0.5) - floor(CGRectGetHeight(rect) * 0.00000 + 0.5)+5);
    
    CGRect textRect = [self rectForTextRectFromRect:rect];
    
    
    
    //// ContentGroup
    {
        CGContextSaveGState(context);
        
        //// Clip rect
        CGContextClipToRect(context, rect);
        
        
        //// Background Drawing
        UIBezierPath* backgroundPath = [UIBezierPath bezierPath];
        [backgroundPath moveToPoint: CGPointMake(CGRectGetMinX(rect) + 0.00000 * CGRectGetWidth(rect), CGRectGetMinY(rect) + 0.99999 * CGRectGetHeight(rect))];
        [backgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(rect) + 1.00000 * CGRectGetWidth(rect), CGRectGetMinY(rect) + 1.00000 * CGRectGetHeight(rect))];
        [backgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(rect) + 0.99999 * CGRectGetWidth(rect), CGRectGetMinY(rect) + 0.00000 * CGRectGetHeight(rect))];
        [backgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(rect) + 0.00000 * CGRectGetWidth(rect), CGRectGetMinY(rect) + 0.00000 * CGRectGetHeight(rect))];
        [backgroundPath addLineToPoint: CGPointMake(CGRectGetMinX(rect) + 0.00000 * CGRectGetWidth(rect), CGRectGetMinY(rect) + 0.99999 * CGRectGetHeight(rect))];
        [backgroundPath closePath];
        [color5 setFill];
        [backgroundPath fill];
        
        
        //// Text Drawing
        [textContentColor setFill];
        //CGRectInset(textRect, 4, 0)
        [textContent drawInRect:textRect  withFont: [UIFont fontWithName: @"Helvetica-Bold" size: 15] lineBreakMode: NSLineBreakByCharWrapping alignment: NSTextAlignmentRight];
        
        
        CGContextRestoreGState(context);
    }

}

- (NSString *) dateStringFromDate:(NSDate *)date{
    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
    NSDateComponents *dateComponents = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:date];
    NSString* textContent = [NSString stringWithFormat:@"%d日",dateComponents.day];
    if (dateComponents.day == 1) {
        textContent = [NSString stringWithFormat:@"%d/%d日",dateComponents.month,dateComponents.day];
    }
    
    return textContent;
}

- (void) drawNormalCellInRect:(CGRect)rect onDate:(NSDate *)date{
    NSString* textContent = [self dateStringFromDate:date];
    UIColor* textContentColor = [UIColor blackColor];
    [self drawCellInRect:rect withDateText:textContent textColor:textContentColor backgroundColor:[UIColor clearColor]];
}

- (void) drawSelectedCellInRect:(CGRect)rect onDate:(NSDate *)date withCellState:(GZCalendarGridViewCellState)state{
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: rect];
    
    switch (state) {
        case GZCalendarGridViewCellStateToday:
            [[UIColor colorWithRed:1.000 green:0.343 blue:0.343 alpha:0.800] setFill];
            
            break;
            
        case GZCalendarGridViewCellStateDisable:
            [[UIColor colorWithWhite:0.470 alpha:1.000] setFill];
            break;
            
        case GZCalendarGridViewCellStateHoliday:
            [[UIColor colorWithWhite:0.5 alpha:1.000] setFill];
            
            break;
            
        case GZCalendarGridViewCellStateNormal:
        default:
            [[UIColor colorWithWhite:0 alpha:1.000] setFill];
            break;
    }
    
    [rectanglePath fill];
    
    NSString* textContent = [self dateStringFromDate:date];
    UIColor* textContentColor = [UIColor whiteColor];
    [self drawCellInRect:rect withDateText:textContent textColor:textContentColor backgroundColor:[UIColor clearColor]];
    [self drawCellBorderInRect:rect withBoardColor:[UIColor grayColor] borderWidth:1];
}

- (void) drawBackgroundInRect:(CGRect)rect withCellState:(GZCalendarGridViewCellState)state{
    if (state != GZCalendarGridViewCellStateDisable) {
        [[UIColor colorWithWhite:0.953 alpha:0.500] setFill];
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:rect];
        [path fill];
    }
    [self drawCellBorderInRect:rect withBoardColor:[UIColor grayColor] borderWidth:0.5];
}

- (void) drawTodayCellInRect:(CGRect)rect onDate:(NSDate *)date{
    NSString* textContent = [self dateStringFromDate:date];
    UIColor* textContentColor = [UIColor colorWithRed:1.000 green:0.343 blue:0.343 alpha:1.000];

    
    [self drawCellInRect:rect withDateText:textContent textColor:textContentColor backgroundColor:[UIColor clearColor]];
}

- (void) drawHolidayCellInRect:(CGRect)rect onDate:(NSDate *)date{
    NSString* textContent = [self dateStringFromDate:date];
    UIColor* textContentColor = [UIColor colorWithWhite:0.470 alpha:1.000];
    [self drawCellInRect:rect withDateText:textContent textColor:textContentColor backgroundColor:[UIColor clearColor]];

}

- (void) drawDisableCellInRect:(CGRect)rect onDate:(NSDate *)date{
    NSString* textContent = [self dateStringFromDate:date];
    UIColor* textContentColor = [UIColor colorWithWhite:0.643 alpha:0.630];
    [self drawCellInRect:rect withDateText:textContent textColor:textContentColor backgroundColor:[UIColor clearColor]];
}

- (void) drawHighlightedCellInRect:(CGRect)rect onDate:(NSDate *)date withCellState:(GZCalendarGridViewCellState)state{
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: rect];
    [[UIColor colorWithWhite:0.643 alpha:0.630] setFill];
    [rectanglePath fill];
    
    NSString* textContent = [self dateStringFromDate:date];
    UIColor* textContentColor = [UIColor whiteColor];
    [self drawCellInRect:rect withDateText:textContent textColor:textContentColor backgroundColor:[UIColor clearColor]];
    [self drawCellBorderInRect:rect withBoardColor:[UIColor grayColor] borderWidth:1];
}

- (void) drawEvents:(NSArray *)events inRect:(CGRect)frame withCellState:(GZCalendarGridViewCellState)state{
    NSInteger maxCount = floor((CGRectGetHeight(frame) - 30)/25);
    
    NSInteger needShowCount = events.count > maxCount ? events.count - maxCount:0;
    if (needShowCount > 0 ) {
        [[UIColor colorWithWhite:0.902 alpha:1.000] setFill];
        
        CGRect rect = CGRectMake(frame.origin.x, frame.origin.y+(CGRectGetHeight(frame)-15), CGRectGetWidth(frame), 15);
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:rect];
        
        [path fill];
        
        [[UIColor colorWithRed:0.277 green:0.478 blue:0.806 alpha:1.000] setFill];
        NSString *eventsCountString = needShowCount > 0 ? [NSString stringWithFormat:@"還有%d項",needShowCount]:@"";
        [eventsCountString drawInRect:rect withFont:[UIFont boldSystemFontOfSize:12] lineBreakMode:NSLineBreakByClipping alignment:NSTextAlignmentCenter];
    }
}




@end
