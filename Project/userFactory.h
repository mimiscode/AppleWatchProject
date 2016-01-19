//
//  userFactory.h
//  Project
//
//  Created by Sébastien LOUIS on 08/10/2015.
//  Copyright © 2015 ESGI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "Config.h"

@interface userFactory : NSObject

+(NSArray*) getUsers;

+(User*) connexionWithMail:(NSString*)mail andPassword:(NSString*)password;

+(NSArray*) formatUsersWithUsers:(NSArray*)users;

@end
