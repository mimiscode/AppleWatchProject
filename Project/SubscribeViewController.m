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
    // Do any additional setup after loading the view from its nib.
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
        
        [userFactory subscribeWithMail:mail andFirstname:firstname andName:name andPassword:password completionHandler:^(User* user) {
            
            if(user != nil){
                [self goToMenuViewWithUser:user];
            }
            else{
                [self displaySubscribeErrorMessage];
            }
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
