//
//  doctorFactory.m
//  Project
//
//  Created by Sébastien LOUIS on 07/10/2015.
//  Copyright © 2015 ESGI. All rights reserved.
//

#import "doctorFactory.h"
#import "doctorMockWebService.h"
#import "doctorWebService.h"
#import "Doctor.h"

@implementation doctorFactory


+(NSArray*) getDoctors{
    
    
    NSData *JSONData = [NSData new];
    
    /*Mock datas*/
    if(MOCK_MODE){
    JSONData = [doctorMockWebService getDoctors];
    }
    
    /*Real datas*/
    else{
        JSONData = [doctorWebService getDoctors];
    }
    
    if(!JSONData){
        return nil;
    }
    
    NSArray* result = [NSMutableArray new];
    result = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingMutableContainers error:nil];
    
    
    result = [self formatDoctorsWithDoctors:result];
    
    
    return result;
}

+(Doctor*) getDoctorWithId:(int)idd{
    
    NSArray* doctorsArray = [NSArray new];
    doctorsArray = [self getDoctors];
    
    if(!doctorsArray){
        return nil;
    }
    
    for(Doctor* doctor in doctorsArray){
        if([doctor idd] == idd){
            return doctor;
        }
    
    }
    return nil;
}

+(NSArray*) formatDoctorsWithDoctors:(NSArray*)doctors{
    
    NSMutableArray* result = [NSMutableArray new];
    
    if (doctors!=nil)
    {
        for(NSObject* obj in doctors){
            
            NSLog(@"obj=%@", obj);
            Doctor* doctor = [Doctor new];
            
            
            doctor = [doctor initDoctorWithId:[[obj valueForKey:@"idd"] intValue]
                                andFirstname:[obj valueForKey:@"firstname"]
                                andLastname:[obj valueForKey:@"lastname"]
                                andAddress:[obj valueForKey:@"address"]
                                andPhone:[obj valueForKey:@"phone"]
                                andMail:[obj valueForKey:@"email"]
                     ];
            
            [result addObject:doctor];
        }
        
        /* for(Doctor* doctor in result){
         NSLog(@"lastname -> %@",doctor.lastname);
         }*/
        
        return result;
        
    }
    else
        NSLog(@"%@", doctors);

    
    return nil;
}



@end
