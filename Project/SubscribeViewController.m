//
//  SubscribeViewController.m
//  Project
//
//  Created by sylvain vincent on 08/10/2015.
//  Copyright © 2015 ESGI. All rights reserved.
//

#import "SubscribeViewController.h"
#import "MenuViewController.h"
#import "userFactory.h"

@interface SubscribeViewController ()

@end

@implementation SubscribeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeFields];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onSubscribeButtonClicked:(id)sender {
    
    NSString* mail = self.userMail.text;
    NSString* firstname = self.userFirstname.text;
    NSString* name = self.userName.text;
    NSString* password = self.userPassword.text;
    
    if([mail isEqualToString:@""]
       || [firstname isEqualToString:@""]
       || [name isEqualToString:@""]
       ||  [password isEqualToString:@""]){
        [self.errorMessage setHidden:false];
    }
    else{
        [self.errorMessage setHidden:true];
        [self.activityIndicator setHidden:false];
        [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
        
        self.userMail.enabled = NO;
        self.userPassword.enabled = NO;
        self.userFirstname.enabled = NO;
        self.userName.enabled = NO;
        
        
        [userFactory subscribeWithMail:mail andFirstname:firstname andName:name andPassword:password completionHandler:^(User* user) {
            
            if(user != nil){
                [self goToMenuViewWithUser:user];
            }
            else{
                [self displaySubscribeErrorMessage];
            }
            
            self.userMail.enabled = YES;
            self.userPassword.enabled = YES;
            self.userFirstname.enabled = YES;
            self.userName.enabled = YES;
            
        }];
    }
    
}


-(void) goToMenuViewWithUser:(User*)user{
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Inscription"
                                                  message:@"Votre inscription a bien été prise en compte ! Vous êtes désormais connecté."
                                                  delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
        
        [alert show];
        
        
        MenuViewController *controller = [[MenuViewController alloc]init];
        controller.user = user;
        [self.navigationController pushViewController:controller animated:YES];
    });
}

-(void) displaySubscribeErrorMessage{
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Erreur"
                                                        message:@"Une erreure est survenue. Votre compte n'a pas été créé."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        
        [alert show];
    });
}

-(void)textFieldDidChange :(UITextField *)theTextField{
    if([self.userMail.text isEqualToString:@""] || [self.userFirstname.text isEqualToString:@""] || [self.userName.text isEqualToString:@""] || [self.userPassword.text isEqualToString:@""] || ! [self isMail:self.userMail.text]){
        self.subscribeButton.enabled = false;
        [self.subscribeButton setTitleColor:[UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0] forState:UIControlStateNormal];
    }
    else{
        self.subscribeButton.enabled = true;
        [self.subscribeButton setTitleColor:[UIColor colorWithRed:30/255.0 green:200/255.0 blue:30/255.0 alpha:1.0] forState:UIControlStateNormal];
    }
}

-(void)initializeFields{
    [self.activityIndicator setHidden:true];
    [self.subscribeButton setTitleColor:[UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0] forState:UIControlStateNormal];
    self.subscribeButton.enabled = false;
    [self.userMail addTarget:self action:@selector(textFieldDidChange:)forControlEvents:UIControlEventEditingChanged];
    [self.userName addTarget:self action:@selector(textFieldDidChange:)forControlEvents:UIControlEventEditingChanged];
    [self.userPassword addTarget:self action:@selector(textFieldDidChange:)forControlEvents:UIControlEventEditingChanged];
    [self.userFirstname addTarget:self action:@selector(textFieldDidChange:)forControlEvents:UIControlEventEditingChanged];
}

-(Boolean)isMail:(NSString*)mail{
    NSString *mailRegex = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", mailRegex];
    return [emailTest evaluateWithObject:mail];
}

-(void)threadStartAnimating{
    [self.activityIndicator startAnimating];
}


@end
