//
//  connexionViewController.m
//  Project
//
//  Created by sylvain vincent on 07/10/2015.
//  Copyright © 2015 ESGI. All rights reserved.
//

#import "connexionViewController.h"
#import "userFactory.h"
#import "SubscribeViewController.h"
#import "MenuViewController.h"

@interface connexionViewController ()

@end

@implementation connexionViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onNoAccountTouch:(id)sender {
    
    SubscribeViewController* subscribeViewController = [SubscribeViewController new];
    
    [self.navigationController pushViewController:subscribeViewController animated:NO];
    
}

- (IBAction)onConnexionTouch:(id)sender {
    
    
    //Connexion test
    User* user = [userFactory connexionWithMail:self.mailField.text andPassword:self.passwordField.text];
     if(!user){
         self.ErrorMessage.hidden = false;
     }
     else{
         
         self.ErrorMessage.hidden = true;
         
         MenuViewController* menuViewController = [MenuViewController new];
         menuViewController.user = user;
         [self.navigationController pushViewController:menuViewController animated:NO];
     //Doctor* userDoctor = [Doctor new];
     //userDoctor = [doctorFactory getDoctorWithId:[user doctorIdd]];
     //NSLog(@"Connexion réussie ! User doctor  : %@ %@", [userDoctor firstname], [userDoctor lastname]);
         NSLog(@"Connexion réussie !");
     }
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.mailField endEditing:YES];
    [self.passwordField endEditing:YES];
}

@end
