//
//  HomeInterfaceController.m
//  Project
//
//  Created by Tracy Sablon on 02/02/2016.
//  Copyright © 2016 ESGI. All rights reserved.
//

#import "HomeInterfaceController.h"
#import <WatchConnectivity/WatchConnectivity.h>

@interface HomeInterfaceController ()<WCSessionDelegate>

@end

@implementation HomeInterfaceController
@synthesize medicationData;
@synthesize nextAlertLbl;
@synthesize nextAlert;

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
    
    [nextAlert setHidden:YES];
    
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

- (IBAction)OnTouchNextAlert {
    
    [self pushControllerWithName:@"MyList" context:medicationData];
}

- (void)session:(WCSession *)session didReceiveApplicationContext:(NSDictionary<NSString *,id> *)applicationContext {
    
    NSLog(@"didReceiveApplicationContext");
    
    id appC = applicationContext;
    
    NSLog(@"%@",appC);
    
    if (appC == nil) {
        [nextAlert setHidden:YES];
        
    }else{
        [nextAlertLbl setText:@"Voir mes prochaines alertes"];
        [nextAlert setHidden:NO];
    }
    
    medicationData = appC;
    
}
@end



