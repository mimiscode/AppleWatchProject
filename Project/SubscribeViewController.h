//
//  SubscribeViewController.h
//  Project
//
//  Created by sylvain vincent on 08/10/2015.
//  Copyright © 2015 ESGI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface SubscribeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *userMail;
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *userFirstname;
@property (weak, nonatomic) IBOutlet UITextField *userPassword;
@property (weak, nonatomic) IBOutlet UILabel *errorMessage;

-(void) goToMenuViewWithUser:(User*)user;

-(void) displaySubscribeErrorMessage;

@end
