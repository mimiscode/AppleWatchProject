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

+(void) connexionWithMail:(NSString*)mail andPassword:(NSString*)password completionHandler:(void (^)(NSData* data, NSURLResponse* response, NSError* error))completionHandler;

+(void) subscribeWithMail:(NSString*)mail  andFirstname:(NSString*)firstname andName:(NSString*)name andPassword:(NSString*)password completionHandler:(void (^)(NSData* data, NSURLResponse* response, NSError* error))completionHandler;

@end
