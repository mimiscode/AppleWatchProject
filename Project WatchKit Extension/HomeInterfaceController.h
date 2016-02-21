//
//  HomeInterfaceController.h
//  Project
//
//  Created by Tracy Sablon on 02/02/2016.
//  Copyright © 2016 ESGI. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface HomeInterfaceController : WKInterfaceController


@property (strong, nonatomic) id medicationData;

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceButton *nextAlert;

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *nextAlertLbl;

- (IBAction)OnTouchNextAlert;

@end
