//
//  CCCalendar.m
//  
//
//  Created by 冯明庆 on 16/6/29.
//  Copyright © 2016年 冯明庆 All rights reserved.
//

#import "CCCalendar.h"

@interface CCCalendar ()

@end

@implementation CCCalendar

- (NSInteger)ccDay:(NSDate *)date{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    return [components day];
}

- (NSInteger)ccMonth:(NSDate *)date{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    return [components month];
}

- (NSInteger)ccYear:(NSDate *)date{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    return [components year];
}


- (NSInteger)ccFirstWeekdayInThisMonth:(NSDate *)date{
    NSCalendar *calendar = [NSCalendar currentCalendar];
#pragma mark - Beginning OF Month
    [calendar setFirstWeekday:1];//1.Sun. 2.Mon. 3.Thes. 4.Wed. 5.Thur. 6.Fri. 7.Sat.
    NSDateComponents *comp = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    [comp setDay:1];
    NSDate *firstDayOfMonthDate = [calendar dateFromComponents:comp];
    
    NSUInteger firstWeekday = [calendar ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitWeekOfMonth forDate:firstDayOfMonthDate];
    return firstWeekday - 1;
}

- (NSInteger)ccGetDateWeekday : (NSDate *) date {
    NSInteger weekDay = [self ccFirstWeekdayInThisMonth:date];
    NSInteger day = [self ccDay:date];
    
    NSInteger currentWeekNum = (day + weekDay - 1) % 7;
    if (currentWeekNum == 0) {
        currentWeekNum = 7;
    }
    return currentWeekNum;
}

- (NSInteger)ccTotaldaysInMonth:(NSDate *)date{
    NSRange daysInLastMonth = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    return daysInLastMonth.length;
}

- (NSDate *)ccLastMonth:(NSDate *)date{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.month = -1;
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:date options:0];
    return newDate;
}

- (NSDate*)ccNextMonth:(NSDate *)date{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.month = +1;
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:date options:0];
    return newDate;
}

- (NSString *) ccCalculateDateWithCurrentDate : (NSString *) stringCurrentDate
                                     withDays : (NSInteger) days
                                  withIsAfter : (BOOL) isAfter {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"Asia/Shanghai"]];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSDate *date = [formatter dateFromString:stringCurrentDate];
    
    if (!date) {
        date = [NSDate date];
    }
    
    /// 1天的长度
    NSTimeInterval timeInterval = 24 * 60 * 60 * 1;
    NSDate *dateCalculate = [date initWithTimeInterval:(isAfter ? +timeInterval : -timeInterval) * days
                                             sinceDate:date];
    if (days == 0) {
        dateCalculate = date;
    }
    NSDateFormatter *formatterCal = [[NSDateFormatter alloc] init];
    [formatterCal setDateFormat:@"yyyy-MM-dd"];
    return [formatterCal stringFromDate:dateCalculate];
}

/// Only : 2016-12-11 12:04
+ (NSString *) ccGetTimeInterval : (NSString *) stringDate {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm";
    NSDate *dateCurrent = [formatter dateFromString:stringDate];
    NSTimeInterval interval = [[NSDate date] timeIntervalSinceDate:dateCurrent];
    if (interval / (60 * 60 * 24 * 30) >= 1 ) {
        return stringDate;
    }
    if (interval / (60 * 60 * 24) >= 1){
        long longTimes = (long)interval;
        return [NSString stringWithFormat:@"%ld天前",longTimes / (60 * 60 * 24)];
    }
    if (interval / (60 * 60) >= 1){
        long longTimes = (long)interval;
        return [NSString stringWithFormat:@"%ld小时前",longTimes / (60 * 60)];
    }
    if (interval / 60 >= 1){
        long longTimes = (long)interval;
        return [NSString stringWithFormat:@"%ld分钟前",longTimes / 60];
    }
    return @"刚刚";
}

@end
