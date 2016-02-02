//
//  InterfaceController.m
//  Project WatchKit Extension
//
//  Created by Sébastien LOUIS on 07/10/2015.
//  Copyright © 2015 ESGI. All rights reserved.
//

#import "InterfaceController.h"
#import "calendarFactory.h"
#import "Event.h"
#import <WatchConnectivity/WatchConnectivity.h>



@interface InterfaceController()<WCSessionDelegate>

@end


@implementation InterfaceController

@synthesize medicationData;


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

- (IBAction)OnTouchOk {
    NSLog(@"OnTouchOk ! ");
    
    [self pushControllerWithName:@"Test" context:medicationData];

}

- (IBAction)OnTouchNo {
    [self pushControllerWithName:@"ResponseNo" context:nil];
}
- (IBAction)OnTouchPill {
    [self pushControllerWithName:@"Info" context:nil];
}


- (void)session:(WCSession *)session didReceiveApplicationContext:(NSDictionary<NSString *,id> *)applicationContext {
    
    NSLog(@"didReceiveApplicationContext");
    
    id appC = applicationContext;
    NSLog(@"RECEIVED DICO IS : %@",appC);
    
    medicationData = appC;
}

- (void)session:(WCSession *)session
 didReceiveFile:(WCSessionFile *)file{
    NSLog(@"File transfer : %@",file);
    NSData *fileData = [NSData dataWithContentsOfURL: [file fileURL]];
    NSArray* calendar = [calendarFactory getPlannedWeekWithCalendar:fileData];
    Event* ev = [[calendar objectAtIndex:0] objectAtIndex:0];
    NSLog(@"Calendar is : %d ", ev.idd);
}


@end



