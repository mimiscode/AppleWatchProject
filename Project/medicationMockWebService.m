//
//  medicationMockWebService.m
//  Project
//
//  Created by sylvain vincent on 09/10/2015.
//  Copyright © 2015 ESGI. All rights reserved.
//

#import "medicationMockWebService.h"
#import "medicationFactory.h"

@implementation medicationMockWebService

+(NSData*) getMedications{
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"medicationMocks.JSON" ofType:nil];
    
    NSError *error = nil;
    
    NSData *JSONData = [NSData dataWithContentsOfFile:filePath options:NSDataReadingMappedIfSafe error:&error];
    
    return JSONData;
    
}

@end
