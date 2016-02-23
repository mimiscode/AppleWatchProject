//
//  medicationWebService.h
//  Project
//
//  Created by sylvain vincent on 09/10/2015.
//  Copyright © 2015 ESGI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface medicationWebService : NSObject

+(void) getMedicationsWithCompletionHandler:(void (^)(NSData* data, NSURLResponse* response, NSError* error))completionHandler;

@end
