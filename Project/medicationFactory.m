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

+(NSArray*) getMedications{
    
    NSData *JSONData = [NSData new];
    
    /*Mock datas*/
    if(MOCK_MODE){
        JSONData = [medicationMockWebService getMedications];
    }
    
    /*Real datas*/
    else{
        JSONData = [medicationMockWebService getMedications];
    }
    
    if(!JSONData){
        return nil;
    }
    
    NSArray* result = [NSMutableArray new];
    result = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingMutableContainers error:nil];
    
    result = [self formatMedicationsWithMedications: result];
    
    return result;
}

+(NSArray*) formatMedicationsWithMedications:(NSArray*)medications{
    
    NSMutableArray* result = [NSMutableArray new];
    
    if (medications!=nil)
    {
        for(NSObject* obj in medications){
            
            Medication* medication = [Medication new];
            
            
            medication = [medication initMedicationWithId:[[obj valueForKey:@"idd"] intValue] andLabel:[obj valueForKey:@"label"] andDescription:[obj valueForKey:@"description"] andCarIndication:[obj valueForKey:@"carIndication"]];
            
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

+(Medication*) getMedicationWithId:(int)idd{
    
    NSArray* medicationsArray = [NSArray new];
    medicationsArray = [self getMedications];
    
    if(!medicationsArray){
        return nil;
    }
    
    for(Medication* medication in medicationsArray){
        if([medication idd] == idd){
            return medication;
        }
        
    }
    return nil;
}

@end
