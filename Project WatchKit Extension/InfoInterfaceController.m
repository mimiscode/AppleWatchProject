//
//  InfoInterfaceController.m
//  Project
//
//  Created by Tracy Sablon on 08/10/2015.
//  Copyright © 2015 ESGI. All rights reserved.
//

#import "InfoInterfaceController.h"

@interface InfoInterfaceController ()

@end

@implementation InfoInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
}
- (IBAction)OnTouchCancel {
    [self popToRootController];
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



