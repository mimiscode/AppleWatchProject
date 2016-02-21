//
//  connexionViewController.h
//  Project
//
//  Created by sylvain vincent on 07/10/2015.
//  Copyright © 2015 ESGI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface connexionViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *mailField;

@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@property (weak, nonatomic) IBOutlet UILabel *subscribeLink;

@property (weak, nonatomic) IBOutlet UILabel *ErrorMessage;

@property (weak, nonatomic) IBOutlet UIButton *connectionButton;

-(void) goToMenuViewWithUser:(User*)user;

-(void) displayConnexionErrorMessage;

@end
