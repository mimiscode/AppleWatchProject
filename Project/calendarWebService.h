//
//  calendarWebService.h
//  Project
//
//  Created by Sébastien LOUIS on 07/10/2015.
//  Copyright © 2015 ESGI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface calendarWebService : NSObject

+(void) getCalendarWithCompletionHandler:(void (^)(NSData* data, NSURLResponse* response, NSError* error))completionHandler;

@end
