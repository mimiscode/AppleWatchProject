//
//  MyListInterfaceController.h
//  Project
//
//  Created by Tracy Sablon on 02/02/2016.
//  Copyright © 2016 ESGI. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface MyListInterfaceController : WKInterfaceController

@property(strong,nonatomic) id pushedData;

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceTable *medicationTableView;


@end
