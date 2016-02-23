//
//  PillboxViewController.m
//  Project
//
//  Created by sylvain vincent on 07/10/2015.
//  Copyright © 2015 ESGI. All rights reserved.
//

#import "PillboxViewController.h"
#import "calendarFactory.h"
#import "medicationFactory.h"
#import "DayDetailViewController.h"
#import <WatchConnectivity/WatchConnectivity.h>

@interface PillboxViewController ()<WCSessionDelegate>

@end

@implementation PillboxViewController

@synthesize calendarArray = calendarArray_;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //Active Session connection with iWatch
    if([WCSession class] && [WCSession isSupported]){
        WCSession* session = [WCSession defaultSession];
        session.delegate = self;
        [session activateSession];
        
    }


    //Get next days labels
    
     NSArray* nextDays = [NSArray new];
     nextDays = [calendarFactory getSixNextDaysDate];
    [self.day1 setTitle:nextDays[0] forState:UIControlStateNormal];
    [self.day2 setTitle:nextDays[1] forState:UIControlStateNormal];
    [self.day3 setTitle:nextDays[2] forState:UIControlStateNormal];
    [self.day4 setTitle:nextDays[3] forState:UIControlStateNormal];
    [self.day5 setTitle:nextDays[4] forState:UIControlStateNormal];
    [self.day6 setTitle:nextDays[5] forState:UIControlStateNormal];
    [self.day7 setTitle:nextDays[6] forState:UIControlStateNormal];
    
    
    [self initializeCalendar];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)initializeCalendar{
    
    [calendarFactory getCalendarWithCompletionHandler:^(NSArray* calendar) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.calendarArray = calendar;
            [self setButtonsInformation];
        });
    }];
}

-(void)setButtonsInformation{
    
    if([self.calendarArray[0] count]){
        [self.rappel1 setText:[NSString stringWithFormat:@"%lu rappels",(unsigned long)[self.calendarArray[0] count]]];
    }else{
        [self.rappel1 setHidden:true];
        [self.day1 setBackgroundColor:[UIColor grayColor]];
        self.day1.enabled = NO;
    }
    
    if([self.calendarArray[1] count])
        [self.rappel2 setText:[NSString stringWithFormat:@"%lu rappels",(unsigned long)[self.calendarArray[1] count]]];
    else{
        [self.rappel2 setHidden:true];
        [self.day2 setBackgroundColor:[UIColor grayColor]];
        self.day2.enabled = NO;
    }
    
    if([self.calendarArray[2] count])
        [self.rappel3 setText:[NSString stringWithFormat:@"%lu rappels",(unsigned long)[self.calendarArray[2] count]]];
    else{
        [self.rappel3 setHidden:true];
        [self.day3 setBackgroundColor:[UIColor grayColor]];
        self.day3.enabled = NO;
    }
    
    if([self.calendarArray[3] count])
        [self.rappel4 setText:[NSString stringWithFormat:@"%lu rappels",(unsigned long)[self.calendarArray[3] count]]];
    else{
        [self.rappel4 setHidden:true];
        [self.day4 setBackgroundColor:[UIColor grayColor]];
        self.day4.enabled = NO;
    }
    
    if([self.calendarArray[4] count])
        [self.rappel5 setText:[NSString stringWithFormat:@"%lu rappels",(unsigned long)[self.calendarArray[4] count]]];
    else{
        [self.rappel5 setHidden:true];
        [self.day5 setBackgroundColor:[UIColor grayColor]];
        self.day5.enabled = NO;
    }
    
    if([self.calendarArray[5] count])
        [self.rappel6 setText:[NSString stringWithFormat:@"%lu rappels",(unsigned long)[self.calendarArray[5] count]]];
    else{
        [self.rappel6 setHidden:true];
        [self.day6 setBackgroundColor:[UIColor grayColor]];
        self.day6.enabled = NO;
    }
    
    if([self.calendarArray[6] count])
        [self.rappel7 setText:[NSString stringWithFormat:@"%lu rappels",(unsigned long)[self.calendarArray[6] count]]];
    else{
        [self.rappel7 setHidden:true];
        [self.day7 setBackgroundColor:[UIColor grayColor]];
        self.day7.enabled = NO;
    }
}

- (IBAction)onTouchFirstDay:(id)sender {
    DayDetailViewController* dayDetail1 = [DayDetailViewController new];
    dayDetail1.dayEvents = self.calendarArray[0];
    
//id  myCalendarArray = [calendarFactory getCalendarTest];
    
//    [[WCSession defaultSession] updateApplicationContext:myCalendarArray error:nil];
   
    [self.navigationController pushViewController:dayDetail1 animated:YES];

    
}

- (IBAction)onTouchSecondDay:(id)sender {
    DayDetailViewController* dayDetail2 = [DayDetailViewController new];
    dayDetail2.dayEvents = self.calendarArray[1];
    [self.navigationController pushViewController:dayDetail2 animated:YES];
}


- (IBAction)onTouchThirdDay:(id)sender {
    DayDetailViewController* dayDetail3 = [DayDetailViewController new];
    dayDetail3.dayEvents = self.calendarArray[2];
    [self.navigationController pushViewController:dayDetail3 animated:YES]; 
}

- (IBAction)onTouchFourthDay:(id)sender {
    DayDetailViewController* dayDetail4 = [DayDetailViewController new];
    dayDetail4.dayEvents = self.calendarArray[3];
    [self.navigationController pushViewController:dayDetail4 animated:YES];
}

- (IBAction)onTouchFifthDay:(id)sender {
    DayDetailViewController* dayDetail5 = [DayDetailViewController new];
    dayDetail5.dayEvents = self.calendarArray[4];
    [self.navigationController pushViewController:dayDetail5 animated:YES];
}

- (IBAction)onTouchSixthDay:(id)sender {
    DayDetailViewController* dayDetail6 = [DayDetailViewController new];
    dayDetail6.dayEvents = self.calendarArray[5];
    [self.navigationController pushViewController:dayDetail6 animated:YES];
}

- (IBAction)onTouchSeventhDay:(id)sender {
    DayDetailViewController* dayDetail7 = [DayDetailViewController new];
    dayDetail7.dayEvents = self.calendarArray[6];
    [self.navigationController pushViewController:dayDetail7 animated:YES];
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

- (void)session:(WCSession *)session didFinishFileTransfer:(WCSessionFileTransfer *)fileTransfer error:(NSError *)error {
    
    if (!error) {
        NSLog(@"successful transfer");
    }
    else {
        NSLog(@"failed transfer");
    }

}

- (void)session:(WCSession *)session didReceiveMessage:(NSDictionary<NSString *,id> *)message {
    NSString* msg = [message objectForKey:@"times"];
    dispatch_async(dispatch_get_main_queue(),^{
        
        UIAlertController* alertController = [UIAlertController alertControllerWithTitle:@"message" message:msg preferredStyle:UIAlertControllerStyleAlert];
        
        [alertController addAction:[UIAlertAction actionWithTitle:@"FERMER" style:UIAlertControllerStyleAlert handler:nil]];
        
        [self presentViewController:alertController animated:YES completion:nil];
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
