//
//  ResponseNoInterfaceController.h
//  Project
//
//  Created by Tracy Sablon on 08/10/2015.
//  Copyright © 2015 ESGI. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface ResponseNoInterfaceController : WKInterfaceController

@property (strong, nonatomic) IBOutlet WKInterfacePicker *interfacePicker;

@property (strong, nonatomic) NSArray <WKPickerItem *> *pickerItems;

@property (strong, nonatomic) IBOutlet WKInterfaceLabel *selectedValue;

@property (strong, nonatomic) NSMutableArray *times;

@end
