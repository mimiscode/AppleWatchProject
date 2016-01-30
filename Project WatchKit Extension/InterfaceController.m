//
//  InterfaceController.m
//  Project WatchKit Extension
//
//  Created by Sébastien LOUIS on 07/10/2015.
//  Copyright © 2015 ESGI. All rights reserved.
//

#import "InterfaceController.h"
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

/*
- (void)session:(WCSession *)session didReceiveMessage:(NSDictionary<NSString *, id> *)message {
    NSString* msg = [message objectForKey:@"message"];
    NSLog(@"%@",msg);
    
}

- (void)session:(WCSession *)session didReceiveFile:(WCSessionFile *)file {
    
    NSLog(@"File has been received:%@", file);
    
}
 */

- (void)session:(WCSession *)session didReceiveApplicationContext:(NSDictionary<NSString *,id> *)applicationContext {
    
    NSLog(@"didReceiveApplicationContext");
    
    id appC = applicationContext;
    //NSLog(@"%@",appC);
    
    medicationData = appC;
}


@end



