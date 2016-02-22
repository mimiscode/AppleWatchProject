//
//  Doctor.h
//  Project
//
//  Created by Sébastien LOUIS on 07/10/2015.
//  Copyright © 2015 ESGI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Doctor : NSObject{
@private
    NSString* idd_;
    NSString* firstname_;
    NSString* lastname_;
    NSString* address_;
    NSString* phone_;
    NSString* mail_;
    
}

@property (nonatomic,strong)NSString* idd;
@property (nonatomic,strong)NSString* firstname;
@property (nonatomic,strong)NSString* lastname;
@property (nonatomic,strong)NSString* address;
@property (nonatomic,strong)NSString* phone;
@property (nonatomic,strong)NSString* mail;


-(Doctor*)initDoctorWithId:(NSString*)idd andFirstname:(NSString*)firstname andLastname:(NSString*)lastname andAddress:(NSString*)address andPhone:(NSString*)phone andMail:(NSString*)mail;

@end
