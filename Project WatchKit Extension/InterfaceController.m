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
    [self dismissController];

}

- (IBAction)OnTouchNo {
    [self pushControllerWithName:@"ResponseNo" context:nil];
}
- (IBAction)OnTouchPill {
    [self pushControllerWithName:@"Info" context:nil];
}


//- (void)session:(WCSession *)session didReceiveMessage:(nonnull NSDictionary<NSString *,id> *)message {
//    
//    NSString* msg = [message objectForKey:@"message"];
//    
//    NSArray* actions = @[[WKAlertAction actionWithTitle:@"CLOSE" style:WKAlertActionStyleCancel handler:^{NSLog(@"CANCEL");
//    }],[WKAlertAction actionWithTitle:@"REPONDRE" style:WKAlertActionStyleCancel handler:^{
//        
//        if ([WCSession defaultSession].reachable) {
//            [[WCSession defaultSession] sendMessage:@{@"message" : @"Hello from iWatch"} replyHandler:nil errorHandler:nil];
//        }
//        
//    }]];
//    
//    //    [self presentAlertControllerWithTitle:@"Message" message:msg preferredStyle:WKAlertControllerStyleActionSheet actions:@[[WKAlertAction actionWithTitle:@"CLOSE" style:WKAlertActionStyleCancel handler:^{NSLog(@"CANCEL");}]]];
//    
//    
//    [self presentAlertControllerWithTitle:@"Message" message:msg preferredStyle:WKAlertControllerStyleActionSheet actions:actions];
//}

@end



