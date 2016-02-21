//
//  TestInterfaceController.m
//  Project
//
//  Created by Tracy Sablon on 27/01/2016.
//  Copyright © 2016 ESGI. All rights reserved.
//

#import "TestInterfaceController.h"
#import "CustomTableRowController.h"
#import <WatchConnectivity/WatchConnectivity.h>

@interface TestInterfaceController ()<WCSessionDelegate>

@end

@implementation TestInterfaceController

@synthesize pushedData;
//@synthesize medicationTableView;


- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    NSLog(@"Test interface !");
    NSLog(@"display context : %@",context);
    
    if (context == nil) {
        NSLog(@"No data available");
        
        WKInterfaceLabel *noDataLbl = [WKInterfaceLabel new];
        [noDataLbl setText:@"Aucun rappel disponible."];
        
        NSLog(@"%@",noDataLbl);
        
    }
    
  /*  pushedData = context;
    
    [medicationTableView setNumberOfRows:[pushedData count] withRowType:@"CustomTableRowController"];
    
    for (NSInteger i = 0; i < [pushedData count]; i++) {

        id pushedDataTitle = [[pushedData objectAtIndex:i] objectForKey:@"idd"];
        
        CustomTableRowController *customRow = [medicationTableView rowControllerAtIndex:i];
        
        [customRow.titleLbl setText:[NSString stringWithFormat:@"pilule %@",pushedDataTitle]];
        
    }

  */  
    // Configure interface objects here.
}

- (void)table:(WKInterfaceTable *)table didSelectRowAtIndex:(NSInteger)rowIndex {
    
    [self pushControllerWithName:@"Info" context:nil];

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



