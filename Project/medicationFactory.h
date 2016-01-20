//
//  medicationFactory.h
//  Project
//
//  Created by sylvain vincent on 09/10/2015.
//  Copyright © 2015 ESGI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Medication.h"
#import "Config.h"

@interface medicationFactory : NSObject

+(NSArray*) getMedications;

+(Medication*) getMedicationWithId:(int)idd;

+(NSArray*) formatMedicationsWithMedications:(NSArray*)medications;

@end
