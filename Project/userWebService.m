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

+(NSMutableURLRequest*)postUser:(NSString*)lastname :(NSString*)firstname :(NSString*)mail :(NSString*)password
{
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"https://applewatchproject.herokuapp.com/users"]];
    
    [request setHTTPMethod:@"POST"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    [dictionary setValue:lastname forKey:@"lastname"];
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
    
    NSLog(@"%@", request);
    
    return request;
}

@end
