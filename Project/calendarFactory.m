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

+(NSArray*) getCalendar{
    
    NSData *JSONData = [NSData new];
    
    /*Mock datas*/
    if(MOCK_MODE){
        JSONData = [calendarMockWebService getCalendar];
    }
    
    else{
        /*Real datas*/
        JSONData = [calendarWebService getCalendar];
    }
   
    if(!JSONData){
        return nil;
    }
    
    
    NSArray* result = [NSArray new];
    result = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingMutableContainers error:nil];
    
    result = [self formatEventsWithCalendar:result];
    result = [self getSixNextDaysEventsWithCalendar:result];
    
    return result;
}




+(NSArray*) formatEventsWithCalendar:(NSArray*) calendar{
    NSLog(@"test 1");
    NSMutableArray* result = [NSMutableArray new];
    NSDateFormatter* dateFormatter = [NSDateFormatter new];
    NSArray* medicationList = [medicationFactory getMedications];
    Medication* medication = [Medication new];
    [dateFormatter setDateFormat:@"yyyy-MM-dd-HH:mm:ss"];
    
    
    if (calendar!=nil)
    {       NSLog(@" taille : %lu",(unsigned long)[medicationList count]);
        
            for(Event* obj in calendar){
                /*for(medication in medicationList){
                    if([medication idd] == [[obj valueForKey:@"medication"]intValue])
                        [obj setMedication:medication];
                }
             */
                
                NSLog(@"obj=%@", obj);
                Event* event = [Event new];
                
                event = [event initEventWithId:[[obj valueForKey:@"idd"] intValue]
                                         andState:[[obj valueForKey:@"state"] intValue]
                                     andDate:[dateFormatter dateFromString:[obj valueForKey:@"date"]]
                          andNumberMedications:[[obj valueForKey:@"numberMedications"] intValue]
                                 andMedication:[[obj valueForKey:@"medication"] intValue]]
                          ;
                
                [result addObject:event];
            }
            
            
        /* for(Event* event in result){
                NSLog(@"id -> %d",event.idd);
            }
         */
            return result;
        
        }
        else
            NSLog(@"%@", calendar);
        
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
