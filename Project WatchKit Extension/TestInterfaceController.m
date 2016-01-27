//
//  TestInterfaceController.m
//  Project
//
//  Created by Tracy Sablon on 27/01/2016.
//  Copyright © 2016 ESGI. All rights reserved.
//

#import "TestInterfaceController.h"
#import "InterfaceController.h"
#import <WatchConnectivity/WatchConnectivity.h>

@interface TestInterfaceController ()<WCSessionDelegate>

@end

@implementation TestInterfaceController

@synthesize pushedData;


- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    NSLog(@"Test interface !");
    NSLog(@"display context : %@",context);
    
    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



