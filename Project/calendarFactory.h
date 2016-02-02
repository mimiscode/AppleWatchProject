//
//  calendarFactory.h
//  Project
//
//  Created by Sébastien LOUIS on 07/10/2015.
//  Copyright © 2015 ESGI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Config.h"

@interface calendarFactory : NSObject

+(NSData*) getCalendar;

+(NSArray*) getPlannedWeekWithCalendar:(NSData*)calendar;

+(NSArray*) getCalendarTest;

+(NSArray*) formatEventsWithCalendar:(NSArray*) calendar;

+(NSArray*) getSixNextDaysEventsWithCalendar:(NSArray*)calendar;

+(NSArray*) getSixNextDaysDate;

@end
