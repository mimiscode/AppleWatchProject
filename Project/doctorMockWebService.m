//
//  doctorMockWebService.m
//  Project
//
//  Created by Sébastien LOUIS on 07/10/2015.
//  Copyright © 2015 ESGI. All rights reserved.
//

#import "doctorMockWebService.h"

@implementation doctorMockWebService

+(NSData*) getDoctors{
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"doctorMocks.JSON" ofType:nil];
    
    NSError *error = nil;
    
    NSData *JSONData = [NSData dataWithContentsOfFile:filePath options:NSDataReadingMappedIfSafe error:&error];
    
    return JSONData;
}
@end
