//
//  Event.m
//  Project
//
//  Created by Sébastien LOUIS on 07/10/2015.
//  Copyright © 2015 ESGI. All rights reserved.
//

#import "Event.h"

@implementation Event

@synthesize idd = idd_;
@synthesize medication = medication_;
@synthesize date = date_;
@synthesize numberMedications = numberMedications_;
@synthesize state = state_;


-(Event*)initEventWithId:(int)idd andState:(int)state andDate:(NSDate*)date andNumberMedications:(int) numberMedications andMedication:(int) medication{
    
    self = [super init];
    self.idd = idd;
    self.state = state;
    self.date = date;
    self.numberMedications  = numberMedications;
    self.medication = medication;
    
    return self;
}


@end
