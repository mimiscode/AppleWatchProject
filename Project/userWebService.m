//
//  userWebService.m
//  Project
//
//  Created by Sébastien LOUIS on 08/10/2015.
//  Copyright © 2015 ESGI. All rights reserved.
//

#import "userWebService.h"

@implementation userWebService

+(NSData*) getUsers{
    return nil;
}

+(void) connexionWithMail:(NSString*)mail andPassword:(NSString*)password completionHandler:(void (^)(NSData* data, NSURLResponse* response, NSError* error))myCompletion{
    
    NSURL *url = [NSURL URLWithString:@"https://applewatchproject.herokuapp.com/connexion"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"POST"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    [dictionary setValue:mail forKey:@"mail"];
    [dictionary setValue:password forKey:@"password"];
    NSError *error;
    NSData *data = [NSJSONSerialization dataWithJSONObject:dictionary
                                                   options:NSJSONWritingPrettyPrinted
                                                     error:&error];
    
    
    [request setValue:[NSString stringWithFormat:@"%lu",
                       (unsigned long)[data length]]
   forHTTPHeaderField:@"Content-length"];
    
    [request setHTTPBody:data];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData* data, NSURLResponse* response, NSError* error) {
        myCompletion(data, response, error);
    }];
    [dataTask resume];
}

+(void)subscribeWithMail:(NSString*)mail  andFirstname:(NSString*)firstname andName:(NSString*)name andPassword:(NSString*)password completionHandler:(void (^)(NSData* data, NSURLResponse* response, NSError* error))myCompletion{
    
    NSURL *url = [NSURL URLWithString:@"https://applewatchproject.herokuapp.com/users"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"POST"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    [dictionary setValue:name forKey:@"lastname"];
    [dictionary setValue:firstname forKey:@"firstname"];
    [dictionary setValue:mail forKey:@"mail"];
    [dictionary setValue:password forKey:@"password"];

    NSError *error;
    NSData *data = [NSJSONSerialization dataWithJSONObject:dictionary
                                                   options:NSJSONWritingPrettyPrinted
                                                     error:&error];
    
    
    [request setValue:[NSString stringWithFormat:@"%lu",
                       (unsigned long)[data length]]
    forHTTPHeaderField:@"Content-length"];
    
    [request setHTTPBody:data];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData* data, NSURLResponse* response, NSError* error) {
        myCompletion(data, response, error);
    }];
    
    [dataTask resume];

}



+(void) updateUser:(User*)user completionHandler:(void (^)(NSData* data, NSURLResponse* response, NSError* error))myCompletion{
    
    NSURL *url = [NSURL URLWithString:@"https://applewatchproject.herokuapp.com/users"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"PUT"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    [dictionary setValue:user.idd forKey:@"_id"];
    [dictionary setValue:user.lastname forKey:@"lastname"];
    [dictionary setValue:user.firstname forKey:@"firstname"];
    [dictionary setValue:user.mail forKey:@"mail"];
    [dictionary setValue:user.password forKey:@"password"];
    [dictionary setValue:user.doctorIdd forKey:@"doctorId"];
    
    NSError *error;
    NSData *data = [NSJSONSerialization dataWithJSONObject:dictionary
                                                   options:NSJSONWritingPrettyPrinted
                                                     error:&error];
    
    
    [request setValue:[NSString stringWithFormat:@"%lu",
                       (unsigned long)[data length]]
   forHTTPHeaderField:@"Content-length"];
    
    [request setHTTPBody:data];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData* data, NSURLResponse* response, NSError* error) {
        myCompletion(data, response, error);
    }];
    
    [dataTask resume];
}




@end
