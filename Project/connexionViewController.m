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
    
    NSString* userMail = self.mailField.text;
    NSString* userPassword = self.passwordField.text;
    
    [userFactory connexionWithMail:userMail andPassword:userPassword completionHandler:^(User* user) {
        
        if(user != nil){
            [self goToMenuViewWithUser:user];
        }
        else{
            [self displayConnexionErrorMessage];
        }
        
            
    }];
    
}


-(void) goToMenuViewWithUser:(User*)user{
    dispatch_async(dispatch_get_main_queue(), ^{
        MenuViewController *controller = [[MenuViewController alloc]init];
        controller.user = user;
        [self.navigationController pushViewController:controller animated:YES];
    });
}

-(void) displayConnexionErrorMessage{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.ErrorMessage setHidden:false];
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
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.mailField endEditing:YES];
    [self.passwordField endEditing:YES];
}

@end
