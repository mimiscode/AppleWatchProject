//
//  medicationWebService.m
//  Project
//
//  Created by sylvain vincent on 09/10/2015.
//  Copyright © 2015 ESGI. All rights reserved.
//

#import "medicationWebService.h"

@implementation medicationWebService

+(void) getMedicationsWithCompletionHandler:(void (^)(NSData* data, NSURLResponse* response, NSError* error))myCompletion{
    
    NSURL *url = [NSURL URLWithString:@"https://applewatchproject.herokuapp.com/medications"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"GET"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData* data, NSURLResponse* response, NSError* error) {
        myCompletion(data, response, error);
    }];
    
    [dataTask resume];
    
}

@end
