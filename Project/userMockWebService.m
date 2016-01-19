//
//  userMockWebService.m
//  Project
//
//  Created by Sébastien LOUIS on 08/10/2015.
//  Copyright © 2015 ESGI. All rights reserved.
//

#import "userMockWebService.h"
#import "userFactory.h"

@implementation userMockWebService

+(NSData*) getUsers{
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"userMocks.JSON" ofType:nil];
    
    NSError *error = nil;
    
    NSData *JSONData = [NSData dataWithContentsOfFile:filePath options:NSDataReadingMappedIfSafe error:&error];
    
    return JSONData;
    
}



+(User*) connexionWithMail:(NSString*)mail andPassword:(NSString*)password{
    
    NSArray* usersArray = [NSArray new];
    usersArray = [userFactory getUsers];
    
    for(User* user in usersArray){
        if([[user mail] isEqualToString:mail]  && [[user password] isEqualToString:password] ){
            return user;
        }
    }
    return nil;
}
    
@end
