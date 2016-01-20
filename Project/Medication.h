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
    int idd_;
    NSString* label_;
    NSString* description_;
    NSString* carIndication_;
}

@property (nonatomic,assign)int idd;
@property (nonatomic,strong)NSString* label;
@property (nonatomic,strong)NSString* description;
@property (nonatomic,strong)NSString* carIndication;

-(Medication*)initMedicationWithId:(int)idd andLabel:(NSString*)label andDescription:(NSString*)description andCarIndication:(NSString*)carIndication;


@end
