//
//  CCCalendar.h
//
//
//  Created by 冯明庆 on 16/6/29.
//  Copyright © 2016年 冯明庆 All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CCCalendar : NSObject

/// 当前日期第一天是周几
- (NSInteger)ccFirstWeekdayInThisMonth:(NSDate *)date;

/// 根据日期返回今天周几
- (NSInteger)ccGetDateWeekday : (NSDate *) date ;

/// 这个月有多少天
- (NSInteger)ccTotaldaysInMonth:(NSDate *)date;

/// 上个月
- (NSDate *)ccLastMonth:(NSDate *)date;

/// 下个月
- (NSDate*)ccNextMonth:(NSDate *)date;

/// 几号
- (NSInteger)ccDay:(NSDate *)date;

/// 月份
- (NSInteger)ccMonth:(NSDate *)date;

/// 年
- (NSInteger)ccYear:(NSDate *)date;

/// 距离当前日期 之前 / 之后多少天
- (NSString *) ccCalculateDateWithCurrentDate : (NSString *) stringCurrentDate
                                     withDays : (NSInteger) days
                                  withIsAfter : (BOOL) isAfter ;

/// 计算距离当前时间 , eg : 2016-12-11 12:04
+ (NSString *) ccGetTimeInterval : (NSString *) stringDate;
@end
