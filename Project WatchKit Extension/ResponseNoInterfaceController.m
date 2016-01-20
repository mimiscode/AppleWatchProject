//
//  ResponseNoInterfaceController.m
//  Project
//
//  Created by Tracy Sablon on 08/10/2015.
//  Copyright © 2015 ESGI. All rights reserved.
//

#import "ResponseNoInterfaceController.h"
#import <WatchConnectivity/WatchConnectivity.h>

@interface ResponseNoInterfaceController () <WCSessionDelegate>

@end

@implementation ResponseNoInterfaceController
@synthesize confirmBtn;

@synthesize times;

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    [confirmBtn setHidden:YES];
    
    //Active Session connection with iPhone
    if([WCSession class] && [WCSession isSupported]){
        WCSession* session = [WCSession defaultSession];
        session.delegate = self;
        [session activateSession];
    }

}
- (IBAction)OnTouchCancel {
    [self popToRootController];
}
- (IBAction)OnTouchConfirmer {
    
    //NSString *msg = [times objectAtIndex:0];
    
    if ([WCSession defaultSession].reachable) {
        [[WCSession defaultSession] sendMessage:@{@"times" : [times objectAtIndex:0]} replyHandler:nil errorHandler:nil];
    }
    
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    
    
    //times_ = @[@"5 min",@"10 min",@"15 min",@"30 min",@"45 min",@"1 heure"];
    
    WKPickerItem *five = [[WKPickerItem alloc] init];
    five.title = @"5 min";
    
    WKPickerItem *ten = [[WKPickerItem alloc] init];
    ten.title = @"10 min";
    
    WKPickerItem *fifth = [[WKPickerItem alloc] init];
    fifth.title = @"15 min";
    
    WKPickerItem *thirty = [[WKPickerItem alloc] init];
    thirty.title = @"30 min";
    
    WKPickerItem *fortyFive = [[WKPickerItem alloc] init];
    fortyFive.title = @"45 min";
    
    WKPickerItem *OneHour = [[WKPickerItem alloc] init];
    OneHour.title = @"1H";
    
    
    _pickerItems = @[five, ten, fifth, thirty, fortyFive, OneHour];
    [_interfacePicker setItems:self.pickerItems];
}
- (IBAction)ListPicker:(NSInteger)value {
    
    [confirmBtn setHidden:NO];
    
    WKPickerItem *selectedItem = self.pickerItems[value];
    
    times = [[NSMutableArray alloc] init];
    
    [times addObject:selectedItem.title];
    
    [self.selectedValue setText:selectedItem.title];
    
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



