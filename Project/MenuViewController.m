//
//  MenuViewController.m
//  Project
//
//  Created by sylvain vincent on 07/10/2015.
//  Copyright © 2015 ESGI. All rights reserved.
//

#import "MenuViewController.h"
#import "DoctorViewController.h"
#import "PillboxViewController.h"
#import <WatchConnectivity/WatchConnectivity.h>


@interface MenuViewController ()<WCSessionDelegate>

@end

@implementation MenuViewController

@synthesize user = user_;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //Active Session connection with iWatch
    if([WCSession class] && [WCSession isSupported]){
        WCSession* session = [WCSession defaultSession];
        session.delegate = self;
        [session activateSession];
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onDoctorTouch:(id)sender {
    
    DoctorViewController* doctorViewController = [DoctorViewController new];
    
    [self.navigationController pushViewController:doctorViewController animated:NO];
    

}
- (IBAction)onInformationsTouch:(id)sender {
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Mentions légales"
                                                                   message:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Fermer" style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * action) {                   }];
    
    [alert addAction:cancelAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}
- (IBAction)onMedicationTouch:(id)sender {
    
    PillboxViewController* pillboxViewController = [PillboxViewController new];
    
    [self.navigationController pushViewController:pillboxViewController animated:NO];
    

}
- (IBAction)onHistoryTouch:(id)sender {
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Bientôt disponible"
                                                                   message:@"Cette fonctionnalité sera disponible dans la version 2.0 de l'application."
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Fermer" style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * action) {                   }];
    
    [alert addAction:cancelAction];
    
    [self presentViewController:alert animated:YES completion:nil];
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
