//
//  calendarWebService.m
//  Project
//
//  Created by Sébastien LOUIS on 07/10/2015.
//  Copyright © 2015 ESGI. All rights reserved.
//

#import "calendarWebService.h"

@implementation calendarWebService

+(void) getCalendarWithCompletionHandler:(void (^)(NSData* data, NSURLResponse* response, NSError* error))myCompletion{
    
    NSURL *url = [NSURL URLWithString:@"https://applewatchproject.herokuapp.com/events"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"GET"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData* data, NSURLResponse* response, NSError* error) {
        myCompletion(data, response, error);
    }];
    
    [dataTask resume];
    
}

+(void) updateEvent:(Event*)event andCompletionHandler:(void (^)(NSData* data, NSURLResponse* response, NSError* error))myCompletion{
    
    NSURL *url = [NSURL URLWithString:@"https://applewatchproject.herokuapp.com/events"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"PUT"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    NSDateFormatter* dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"yyyy-MM-dd-HH:mm:ss"];
    NSString* eventDate = [dateFormatter stringFromDate:event.date];
    
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    [dictionary setValue:event.idd forKey:@"_id"];
    [dictionary setValue:event.medication forKey:@"medication"];
    [dictionary setValue:[NSString stringWithFormat:@"%d", event.state] forKey:@"state"];
    [dictionary setValue:[NSString stringWithFormat:@"%d", event.numberMedications]forKey:@"numberMedications"];
    [dictionary setValue:eventDate forKey:@"date"];
    [dictionary setValue:event.alarm forKey:@"alarm"];
    [dictionary setValue:event.userId forKey:@"userId"];
    
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
