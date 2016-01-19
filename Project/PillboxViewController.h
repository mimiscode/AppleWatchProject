//
//  PillboxViewController.h
//  Project
//
//  Created by sylvain vincent on 07/10/2015.
//  Copyright © 2015 ESGI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PillboxViewController : UIViewController{
 
    @private
    NSArray* calendarArray_;
}

@property (nonatomic, strong)NSArray* calendarArray;


@property (weak, nonatomic) IBOutlet UIButton *day1;
@property (weak, nonatomic) IBOutlet UIButton *day2;
@property (weak, nonatomic) IBOutlet UIButton *day3;
@property (weak, nonatomic) IBOutlet UIButton *day4;
@property (weak, nonatomic) IBOutlet UIButton *day5;
@property (weak, nonatomic) IBOutlet UIButton *day6;
@property (weak, nonatomic) IBOutlet UIButton *day7;

@property (weak, nonatomic) IBOutlet UILabel *rappel1;
@property (weak, nonatomic) IBOutlet UILabel *rappel2;
@property (weak, nonatomic) IBOutlet UILabel *rappel3;
@property (weak, nonatomic) IBOutlet UILabel *rappel4;
@property (weak, nonatomic) IBOutlet UILabel *rappel5;
@property (weak, nonatomic) IBOutlet UILabel *rappel6;
@property (weak, nonatomic) IBOutlet UILabel *rappel7;






@end
