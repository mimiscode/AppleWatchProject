//
//  ViewController.m
//  Project
//
//  Created by Sébastien LOUIS on 07/10/2015.
//  Copyright © 2015 ESGI. All rights reserved.
//

#import "ViewController.h"

#import "calendarFactory.h"
#import "doctorFactory.h"
#import "userFactory.h"
#import "User.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    //Get Calendar
    /*
     NSArray* calendarArray = [NSArray  new];
    calendarArray = [calendarFactory getCalendar];
    NSLog(@"CONTROLLER DATAS : %@", calendarArray);
    */
    
    //Get Doctors
    /*
     NSArray* doctorsArray = [NSArray new];
    doctorsArray = [doctorFactory getDoctors];
    NSLog(@"CONTROLLER DATAS  : %@", doctorsArray);
    */
    
    //Get Users
    /*
     NSArray* usersArray = [NSArray new];
    usersArray = [userFactory getUsers];
    NSLog(@"CONTROLLER DATAS : %@", usersArray);
    */
    
    //Get next days labels
    /*
     NSArray* nextDays = [NSArray new];
    nextDays = [calendarFactory getSixNextDaysDate];
    NSLog(@"CONTROLLER DATAS : %@", nextDays);
    */
    
    //Connexion test
     /*User* user = [userFactory connexionWithPhone:@"0197584776" andPassword:@"Michael"];
    if(!user){
        NSLog(@"Telephone/Mot de passe erronés");
    }
    else{
        Doctor* userDoctor = [Doctor new];
        userDoctor = [doctorFactory getDoctorWithId:[user doctorIdd]];
        NSLog(@"Connexion réussie ! User doctor  : %@ %@", [userDoctor firstname], [userDoctor lastname]);
    }
    */
   
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
