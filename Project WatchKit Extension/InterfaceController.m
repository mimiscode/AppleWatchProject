//
//  InterfaceController.m
//  Project WatchKit Extension
//
//  Created by Sébastien LOUIS on 07/10/2015.
//  Copyright © 2015 ESGI. All rights reserved.
//

#import "InterfaceController.h"
#import "calendarFactory.h"
#import "medicationFactory.h"
#import "Event.h"
#import <WatchConnectivity/WatchConnectivity.h>



@interface InterfaceController()<WCSessionDelegate>

@end


@implementation InterfaceController

@synthesize weekEvents = weekEvents_;


- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    if([WCSession class] && [WCSession isSupported]){
        WCSession* session = [WCSession defaultSession];
        session.delegate = self;
        [session activateSession];
    }
    
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

-(void)setEvent{
    //*******************
    //TODO: check if self.weekEvent not null. If null, read local storage
    //*******************
    
    Event* nextEvent = [InterfaceController getNextEvent:self.weekEvents];
    NSLog(@"NExt event id is : %d", nextEvent.idd);
    
    Medication* currentMedication = [medicationFactory getMedicationWithId:nextEvent.medication];
    
    self.medicationLabel.text = currentMedication.label;
    self.medicationNumber.text = [NSString stringWithFormat:@"x%d",nextEvent.numberMedications];
}


+(Event*)getNextEvent:(NSArray*)weekEvents{
    for (int i=0; i<weekEvents.count; i++){
        NSArray* dayEvents = [weekEvents objectAtIndex:i];
        Event* result;
        
        for (int j=0; j<dayEvents.count; j++) {
            // Search next event comparing dates
            
            if(!result){
                result = [dayEvents objectAtIndex:j];
            }
            else{
                Event* currentEvent = [dayEvents objectAtIndex:j];
                NSDate* currentEventDate = currentEvent.date;
                NSDate* nextEventDate = result.date;
                if ([ currentEventDate compare:nextEventDate] == NSOrderedAscending) {
                    NSLog(@"date1 is earlier than date2");
                    result = weekEvents[i][j];
                }
            }
            
        }
        return result;
    }
    return nil;
}

- (IBAction)OnTouchOk {
    NSLog(@"OnTouchOk ! ");
    
    //[self pushControllerWithName:@"Test" context:medicationData];

}

- (IBAction)OnTouchNo {
    [self pushControllerWithName:@"ResponseNo" context:nil];
}
- (IBAction)OnTouchPill {
    [self pushControllerWithName:@"Info" context:nil];
}



- (void)session:(WCSession *)session
 didReceiveFile:(WCSessionFile *)file{
    NSLog(@"File transfer : %@",file);
    NSData *fileData = [NSData dataWithContentsOfURL: [file fileURL]];
    self.weekEvents = [calendarFactory getPlannedWeekWithCalendar:fileData];
    [self setEvent];
}


@end



