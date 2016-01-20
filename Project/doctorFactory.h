//
//  doctorFactory.h
//  Project
//
//  Created by Sébastien LOUIS on 07/10/2015.
//  Copyright © 2015 ESGI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Config.h"
#import "Doctor.h"

@interface doctorFactory : NSObject

+(NSArray*) getDoctors;

+(Doctor*) getDoctorWithId:(int)idd;

+(NSArray*) formatDoctorsWithDoctors:(NSArray*)doctors;

@end
