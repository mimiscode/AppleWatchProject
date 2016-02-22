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

+(NSArray*) getCalendarTest;

+(NSArray*) formatEventsWithCalendar:(NSDictionary*) calendar;

+(NSArray*) getSixNextDaysEventsWithCalendar:(NSArray*)calendar;

+(NSArray*) getSixNextDaysDate;

+(void) getCalendarWithCompletionHandler:(void (^)(NSArray* calendar))completionHandler;

@end
