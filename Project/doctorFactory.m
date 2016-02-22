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




+(void) getDoctorsWithCompletionHandler:(void (^)(NSArray* doctors))myCompletion{
    
    
    [doctorWebService getDoctorsWithCompletionHandler:^(NSData* data, NSURLResponse* response, NSError* error){
        
        if(!error){
            NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data
                                                                     options:0
                                                                       error:NULL];
        
            
            int code = [[jsonDict valueForKey:@"code"] intValue];
            
            if(code == 0){
               NSDictionary* jsonDoctors = [jsonDict objectForKey:@"object"];
                 NSArray* doctors  = [self formatDoctorsWithJSON:jsonDoctors];
                myCompletion(doctors);
            }
            else{
                myCompletion(nil);
            }
        }
        else{
            NSLog(@"Connexion failed.");
            myCompletion(nil);
        }
        
    }];
    
    
}

+(NSArray*) formatDoctorsWithJSON:(NSDictionary*)doctors{
    
    NSMutableArray* result = [NSMutableArray new];
    
    if (doctors==nil){
        return nil;
    }
    else
    {
        for(NSObject* obj in doctors){
            
            Doctor* doctor = [Doctor new];
            
            doctor = [doctor initDoctorWithId:[obj valueForKey:@"_id"]
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
}



@end
