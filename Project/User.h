//
//  User.h
//  Project
//
//  Created by Sébastien LOUIS on 08/10/2015.
//  Copyright © 2015 ESGI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject{
@private
    NSString* idd_;
    NSString* firstname_;
    NSString* lastname_;
    NSString* password_;
    NSString* mail_;
    NSString* doctorIdd_;
    
}

@property (nonatomic,strong)NSString* idd;
@property (nonatomic,strong)NSString* firstname;
@property (nonatomic,strong)NSString* lastname;
@property (nonatomic,strong)NSString* password;
@property (nonatomic,strong)NSString* mail;
@property (nonatomic,strong)NSString* doctorIdd;



-(User*)initUserWithId:(NSString*)idd andFirstname:(NSString*)firstname andLastname:(NSString*)lastname andPassword:(NSString*)password andMail:(NSString*)mail andDoctorIdd:(NSString*)doctorIdd;

@end
