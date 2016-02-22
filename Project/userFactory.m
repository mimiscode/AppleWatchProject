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
         NSLog(@"USERJSON %@",JSONData);
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
    
    NSLog(@"Test du resultat user: %@",result);
    
    result = [self formatUsersWithUsers: result];
    
    return result;
}

+(void) connexionWithMail:(NSString*)mail andPassword:(NSString*)password completionHandler:(void (^)(User* user))myCompletion{
    
    
    [userWebService connexionWithMail:mail andPassword:password completionHandler:^(NSData* data, NSURLResponse* response, NSError* error){
        
        User* user = [User new];
        
        if(!error){
            NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data
                                                                     options:0
                                                                       error:NULL];
            
            int code = [[jsonDict valueForKey:@"code"] intValue];
            
            if(code == 0){
                NSDictionary* jsonUser = [jsonDict objectForKey:@"object"];
                user = [self formatUserWithJSON:jsonUser];
                myCompletion(user);
            }
            else{
                myCompletion(nil);
            }
        }
        else{
                NSLog(@"Connexion failed.");
                 myCompletion(nil);
            }
       
    }];

}



+(void) subscribeWithMail:(NSString*)mail andFirstname:(NSString*)firstname andName:(NSString*)name andPassword:(NSString*)password completionHandler:(void (^)(User* user))myCompletion{
    
    
    [userWebService subscribeWithMail:mail andFirstname:firstname andName:name andPassword:password completionHandler:^(NSData* data, NSURLResponse* response, NSError* error){
        
        User* user = [User new];
        
        if(!error){
            NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data
                                                                     options:0
                                                                       error:NULL];
            
            int code = [[jsonDict valueForKey:@"code"] intValue];
            
            if(code == 0){
                NSDictionary* jsonUser = [jsonDict objectForKey:@"object"];
                user = [self formatUserWithJSON:jsonUser];
                myCompletion(user);
            }
            else{
                myCompletion(nil);
            }
        }
        else{
            NSLog(@"Connexion failed.");
            myCompletion(nil);
        }
        
    }];
}

+(void) updateUser:(User*)user completionHandler:(void (^)(User* user))myCompletion{
    
    [userWebService updateUser:user completionHandler:^(NSData* data, NSURLResponse* response, NSError* error){
        
        User* updatedUser = [User new];
        
        if(!error){
            NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data
                                                                     options:0
                                                                       error:NULL];
            
            int code = [[jsonDict valueForKey:@"code"] intValue];
            
            if(code == 0){
                NSDictionary* jsonUser = [jsonDict objectForKey:@"object"];
                updatedUser = [self formatUserWithJSON:jsonUser];
                myCompletion(updatedUser);
            }
            else{
                myCompletion(nil);
            }
        }
        else{
            NSLog(@"Update user failed.");
            myCompletion(nil);
        }
        
    }];

}


+(User*) formatUserWithJSON:(NSDictionary*) jsonUser{
    
    if(jsonUser == nil){
        return nil;
    }
    else{
        
    User* user = [User new];
    user = [user initUserWithId:[jsonUser valueForKey:@"_id"]
                   andFirstname:[jsonUser valueForKey:@"firstname"]
                    andLastname:[jsonUser valueForKey:@"lastname"]
                    andPassword:[jsonUser valueForKey:@"password"]
                        andMail:[jsonUser valueForKey:@"mail"]
                   andDoctorIdd:[jsonUser valueForKey:@"doctorId"]
            ];
    return user;
    }
}

+(NSArray*) formatUsersWithUsers:(NSArray*)users{
    
    NSMutableArray* result = [NSMutableArray new];
    
    if (users!=nil)
    {
        for(NSObject* obj in users){
            
            NSLog(@"obj=%@", obj);
            User* user = [User new];
            
            
            user = [user initUserWithId:[obj valueForKey:@"idd"]
                                 andFirstname:[obj valueForKey:@"firstname"]
                                  andLastname:[obj valueForKey:@"lastname"]
                                   andPassword:[obj valueForKey:@"password"]
                                     andMail:[obj valueForKey:@"mail"]
                                    andDoctorIdd:[obj valueForKey:@"doctorIdd"]
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
