//
//  calendarFactory.m
//  Project
//
//  Created by Sébastien LOUIS on 07/10/2015.
//  Copyright © 2015 ESGI. All rights reserved.
//

#import "calendarFactory.h"
#import "medicationFactory.h"
#import "calendarMockWebService.h"
#import "calendarWebService.h"
#import "Event.h"
#import "Medication.h"

@implementation calendarFactory

+(void) getCalendarWithCompletionHandler :(void (^)(NSArray* calendar))myCompletion{
    
        [calendarWebService getCalendarWithCompletionHandler:^(NSData* data, NSURLResponse* response, NSError* error){
            
            if(!error){
                NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data
                                                                         options:0
                                                                           error:NULL];
                
                
                int code = [[jsonDict valueForKey:@"code"] intValue];
                
                if(code == 0){
                    NSDictionary* jsonCalendar = [jsonDict objectForKey:@"object"];
                    NSArray* calendar  = [self formatEventsWithCalendar:jsonCalendar];
                    calendar = [self getSixNextDaysEventsWithCalendar:calendar];
                    myCompletion(calendar);
                }
                else{
                    myCompletion(nil);
                }
            }
            else{
                NSLog(@"Get calendar failed.");
                myCompletion(nil);
            }
            
        }];
}

+(NSArray*) getCalendarTest{
    
    NSData *JSONData = [NSData new];
    
    JSONData = [calendarMockWebService getCalendar];
    
    if(!JSONData){
        return nil;
    }
    
    NSArray *testDict = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingMutableContainers error:nil];
 
    
    return testDict;
    
    
}





+(NSArray*) formatEventsWithCalendar:(NSDictionary*) calendar{
    
        NSMutableArray* result = [NSMutableArray new];
        NSDateFormatter* dateFormatter = [NSDateFormatter new];
        [dateFormatter setDateFormat:@"yyyy-MM-dd-HH:mm:ss"];
        
        if (calendar!=nil)
        {
            for(Event* obj in calendar){
                
                NSLog(@"obj=%@", obj);
                Event* event = [Event new];
                
                event = [event initEventWithId:[obj valueForKey:@"_id"]
                                      andState:[[obj valueForKey:@"state"] intValue]
                                       andDate:[dateFormatter dateFromString:[obj valueForKey:@"date"]]
                          andNumberMedications:[[obj valueForKey:@"numberMedications"] intValue]
                                 andMedication:[obj valueForKey:@"medication"]
                                      andAlarm:[obj valueForKey:@"alarm"]];
                
                [result addObject:event];
            }
            
            return result;
            
        }
        else{
             NSLog(@"%@", calendar);
        }
    
     return nil;
}


+(NSArray*) getSixNextDaysEventsWithCalendar:(NSArray*)calendar{
    
    
    NSMutableArray* result = [NSMutableArray new];
     NSDateComponents *todayComponents = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[NSDate date]];
    long todayDay = [todayComponents day];
    long todayMonth = [todayComponents month];
    long todayYear = [todayComponents year];
    
    
    long actualDay;
    long actualMonth;
    long actualYear;
    
    
    
    for(int i=0; i<7; i++){
        result[i] = [NSMutableArray new];
        for(Event* event in calendar){
            NSDateComponents *actualDayComponents = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[event date]];
            actualDay = [actualDayComponents day];
            actualMonth = [actualDayComponents month];
            actualYear = [actualDayComponents year];
            
            if(todayDay == actualDay && todayMonth == actualMonth && todayYear == actualYear){
                [result[i] addObject:event];
            }
        }
        
        
        NSDate *nextDate = [NSDate dateWithTimeIntervalSinceNow: +((i+1)*60.0f*60.0f*24.0f)];
        
        todayComponents = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:nextDate];
        todayDay = [todayComponents day];
        todayMonth = [todayComponents month];
        todayYear = [todayComponents year];
    }
    

    return result;
    
}


+(NSArray*) getSixNextDaysDate{
    
    NSMutableArray* result = [NSMutableArray new];
    
    // Aujourd'hui
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    // Aucun affichage de l'heure
    [dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
    
    // Affichage de la date au format semi-abrégé
    [dateFormatter setDateFormat: @"EEEE dd MMMM"];
    
    
    /* ---Affichage de la date au format FR--- */
    NSLocale *frLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"fr_FR"];
    [dateFormatter setLocale:frLocale];
    
    
    
    for(int i=0; i<7; i++){
        
        result[i] = [NSString new];
        NSString* dateLabel =  [dateFormatter stringFromDate:date];
        [dateLabel capitalizedString];
        
        result[i] =dateLabel;
        
        date = [NSDate dateWithTimeIntervalSinceNow: +((i+1)*60.0f*60.0f*24.0f)];
        
    }
    return result;
}


@end
