//
//  InterfaceController.h
//  Project WatchKit Extension
//
//  Created by Sébastien LOUIS on 07/10/2015.
//  Copyright © 2015 ESGI. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>
#import "Event.h"
@interface InterfaceController : WKInterfaceController
{
@private
    NSArray* weekEvents_;
}
@property (strong, nonatomic) NSArray* weekEvents;



//View items
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *medicationLabel;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *medicationNumber;

+(void)setEvent;
+(Event*)getNextEvent:(NSArray*)weekEvents;

@end
