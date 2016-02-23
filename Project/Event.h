//
//  Event.h
//  Project
//
//  Created by Sébastien LOUIS on 07/10/2015.
//  Copyright © 2015 ESGI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Medication.h"
@interface Event : NSObject{
 @private
    NSString* idd_;
    NSString* medication_;
    NSDate* date_;
    int numberMedications_;
    int state_;
    
}

@property (nonatomic,strong)NSString* idd;
@property (nonatomic,strong)NSString* medication;
@property (nonatomic,strong)NSDate* date;
@property (nonatomic,assign)int numberMedications;;
@property (nonatomic,assign)int state;


-(Event*)initEventWithId:(NSString*)idd andState:(int)state andDate:(NSDate*)date andNumberMedications:(int) numberMedications andMedication:(NSString*) medication;





@end
