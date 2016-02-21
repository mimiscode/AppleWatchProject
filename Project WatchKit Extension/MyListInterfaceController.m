//
//  MyListInterfaceController.m
//  Project
//
//  Created by Tracy Sablon on 02/02/2016.
//  Copyright © 2016 ESGI. All rights reserved.
//

#import "MyListInterfaceController.h"
#import "CustomTableRowController.h"
#import <WatchConnectivity/WatchConnectivity.h>

@interface MyListInterfaceController ()

@end

@implementation MyListInterfaceController

@synthesize pushedData;
@synthesize medicationTableView;

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
    
    NSLog(@"Mylist interface !");
    NSLog(@"display context : %@",context);
    
    pushedData = context;
    
    [medicationTableView setNumberOfRows:[pushedData count] withRowType:@"CustomTableRowController"];
    
    for (NSInteger i = 0; i < [pushedData count]; i++) {
        id pushedDataTitle = [[pushedData objectAtIndex:i] objectForKey:@"idd"];
        
        
        NSString *pushedDataDate = [[pushedData objectAtIndex:i] objectForKey:@"date"];
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];

        NSLocale *frLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"fr_FR"];
        [dateFormatter setLocale:frLocale];
        [dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
        [dateFormatter setDateFormat:@"yyyy-MM-dd-HH:mm:ss"];
        
        NSDate *dateFromString = [[NSDate alloc] init];
        dateFromString = [dateFormatter dateFromString:pushedDataDate];
        [dateFormatter setDateFormat:@"EE dd MMM"];
        pushedDataDate = [dateFormatter stringFromDate:dateFromString];

        
        CustomTableRowController *customRow = [medicationTableView rowControllerAtIndex:i];
        
        [customRow.titleLbl setText:[NSString stringWithFormat:@"pilule %@",pushedDataTitle]];
        
        [customRow.dateLbl setText:[NSString stringWithFormat:@"%@",pushedDataDate]];
        
    }

}

- (void)table:(WKInterfaceTable *)table didSelectRowAtIndex:(NSInteger)rowIndex {
    
    id dataList = [pushedData objectAtIndex:rowIndex];
    
    [self pushControllerWithName:@"Info" context:dataList];
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



