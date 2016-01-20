//
//  userWebService.h
//  Project
//
//  Created by Sébastien LOUIS on 08/10/2015.
//  Copyright © 2015 ESGI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface userWebService : NSObject

+(NSData*) getUsers;

+(User*) connexionWithMail:(NSString*)mail andPassword:(NSString*)password;

@end
