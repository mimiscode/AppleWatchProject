//
//  medicationFactory.m
//  Project
//
//  Created by sylvain vincent on 09/10/2015.
//  Copyright © 2015 ESGI. All rights reserved.
//

#import "medicationFactory.h"
#import "medicationMockWebService.h"
#import "medicationWebService.h"
#import "Medication.h"

@implementation medicationFactory


+(void) getMedicationsWithCompletionHandler:(void (^)(NSArray* medications))myCompletion{
    
    
    [medicationWebService getMedicationsWithCompletionHandler:^(NSData* data, NSURLResponse* response, NSError* error){
        
        if(!error){
            NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data
                                                                     options:0
                                                                       error:NULL];
            
            
            int code = [[jsonDict valueForKey:@"code"] intValue];
            
            if(code == 0){
                NSDictionary* jsonMedications = [jsonDict objectForKey:@"object"];
                NSArray* medications  = [self formatMedicationsWithJson:jsonMedications];
                myCompletion(medications);
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

+(NSArray*) formatMedicationsWithJson:(NSDictionary*)medications{
    
    NSMutableArray* result = [NSMutableArray new];
    
    if (medications!=nil)
    {
        for(NSObject* obj in medications){
            
            NSLog(@"Medications : obj=%@", obj);
            Medication* medication = [Medication new];
            
            
            medication = [medication initMedicationWithId:[obj valueForKey:@"_id"] andLabel:[obj valueForKey:@"label"] andDescription:[obj valueForKey:@"description"] andCarIndication:[obj valueForKey:@"carIndication"]];
            
            [result addObject:medication];
        }
        
        /* for(User* user in result){
         NSLog(@"password -> %@",user.password);
         }*/
        
        return result;
        
    }
    else
        NSLog(@"%@", medications);
    
    
    
    return nil;
    
}

@end
