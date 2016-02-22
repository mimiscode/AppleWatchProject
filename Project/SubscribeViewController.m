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
    [self.activityIndicator setHidden:true];
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
    
    self.userMail.enabled = NO;
    self.userPassword.enabled = NO;
    self.userFirstname.enabled = NO;
    self.userName.enabled = NO;
    
    [self.activityIndicator setHidden:false];
    [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
    
    
    if([mail isEqualToString:@""]
       || [firstname isEqualToString:@""]
       || [name isEqualToString:@""]
       ||  [password isEqualToString:@""]){
        [self.errorMessage setHidden:false];
    }
    else{
        
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
            
            [self.activityIndicator stopAnimating];
            [self.activityIndicator setHidden:true];
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

-(void)threadStartAnimating{
    [self.activityIndicator startAnimating];
}


@end
