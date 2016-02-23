//
//  Medication.h
//  Project
//
//  Created by Sébastien LOUIS on 07/10/2015.
//  Copyright © 2015 ESGI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Medication : NSObject{
@private
    NSString* idd_;
    NSString* label_;
    NSString* description_;
    NSString* carIndication_;
}

@property (nonatomic,strong)NSString* idd;
@property (nonatomic,strong)NSString* label;
@property (nonatomic,strong)NSString* description;
@property (nonatomic,strong)NSString* carIndication;

-(Medication*)initMedicationWithId:( NSString*)idd andLabel:(NSString*)label andDescription:(NSString*)description andCarIndication:(NSString*)carIndication;


@end
