//
//  medicationMockWebService.h
//  Project
//
//  Created by sylvain vincent on 09/10/2015.
//  Copyright © 2015 ESGI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Medication.h"

@interface medicationMockWebService : NSObject

+(NSData*) getMedications;

@end
