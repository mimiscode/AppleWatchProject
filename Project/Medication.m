//
//  Medication.m
//  Project
//
//  Created by Sébastien LOUIS on 07/10/2015.
//  Copyright © 2015 ESGI. All rights reserved.
//

#import "Medication.h"

@implementation Medication

@synthesize idd = idd_;
@synthesize label = label_;
@synthesize description = description_;
@synthesize carIndication = carIndication_;

-(Medication*)initMedicationWithId:(NSString*)idd andLabel:(NSString*)label andDescription:(NSString*)description andCarIndication:(NSString*)carIndication{
    
    self = [super init];
    self.idd = idd;
    self.label = label;
    self.description = description;
    self.carIndication= carIndication;
    
    return self;
}

@end
