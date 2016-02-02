//
//  userFactory.m
//  Project
//
//  Created by Sébastien LOUIS on 08/10/2015.
//  Copyright © 2015 ESGI. All rights reserved.
//

#import "userFactory.h"
#import "userMockWebService.h"
#import "userWebService.h"
#import "User.h"

@implementation userFactory


+(NSArray*) getUsers{
    
    NSData *JSONData = [NSData new];
    
    /*Mock datas*/
    if(MOCK_MODE){
        JSONData = [userMockWebService getUsers];
    }
    
    /*Real datas*/
    else{
        JSONData = [userWebService getUsers];
    }
    
    if(!JSONData){
        return nil;
    }
    
    NSArray* result = [NSMutableArray new];
    result = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingMutableContainers error:nil];
    
    result = [self formatUsersWithUsers: result];
    
    return result;
}

+(User*) connexionWithMail:(NSString*)mail andPassword:(NSString*)password{
    
    User* user = [User new];
    
    /*Mock datas*/
     user = [userMockWebService connexionWithMail:mail andPassword:password];
    
    /*Real datas*/
    // user = [userWebService connexionWithPhone:phone andPassword:password];
    
    return user;
}

+(NSArray*) formatUsersWithUsers:(NSArray*)users{
    
    NSMutableArray* result = [NSMutableArray new];
    
    if (users!=nil)
    {
        for(NSObject* obj in users){
            
            User* user = [User new];
            
            user = [user initUserWithId:[[obj valueForKey:@"idd"] intValue]
                                 andFirstname:[obj valueForKey:@"firstname"]
                                  andLastname:[obj valueForKey:@"lastname"]
                                   andPassword:[obj valueForKey:@"password"]
                                     andMail:[obj valueForKey:@"mail"]
                                    andDoctorIdd:[[obj valueForKey:@"doctorIdd"] intValue]
                      ];
            
            [result addObject:user];
        }
        
       /* for(User* user in result){
         NSLog(@"password -> %@",user.password);
         }*/
        
        return result;
        
    }
    else
        NSLog(@"%@", users);
    

    
    return nil;

}


@end
