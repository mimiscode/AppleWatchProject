//
//  User.m
//  Project
//
//  Created by Sébastien LOUIS on 08/10/2015.
//  Copyright © 2015 ESGI. All rights reserved.
//

#import "User.h"

@implementation User


@synthesize idd = idd_;
@synthesize firstname = firstname_;
@synthesize lastname = lastname_;
@synthesize password = password_;
@synthesize mail = mail_;
@synthesize doctorIdd = doctorIdd_;

-(User*)initUserWithId:(int)idd andFirstname:(NSString*)firstname andLastname:(NSString*)lastname andPassword:(NSString*)password andMail:(NSString*)mail andDoctorIdd:(int)doctorIdd{
    
    self = [super init];
    self.idd = idd;
    self.firstname = firstname;
    self.lastname = lastname;
    self.password  = password;
    self.mail = mail;
    self.doctorIdd = doctorIdd;
    
    return self;
}


@end
