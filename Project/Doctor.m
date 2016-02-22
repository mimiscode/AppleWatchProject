//
//  Doctor.m
//  Project
//
//  Created by Sébastien LOUIS on 07/10/2015.
//  Copyright © 2015 ESGI. All rights reserved.
//

#import "Doctor.h"

@implementation Doctor

@synthesize idd = idd_;
@synthesize firstname = firstname_;
@synthesize lastname = lastname_;
@synthesize address = address_;
@synthesize phone = phone_;
@synthesize mail = mail_;

-(Doctor*)initDoctorWithId:(NSString*)idd andFirstname:(NSString*)firstname andLastname:(NSString*)lastname andAddress:(NSString*)address andPhone:(NSString*)phone andMail:(NSString*)mail{
    
    self = [super init];
    self.idd = idd;
    self.firstname = firstname;
    self.lastname = lastname;
    self.address  = address;
    self.phone = phone;
    self.mail = mail;
    
    return self;
}

@end
