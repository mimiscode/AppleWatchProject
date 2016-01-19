//
//  DayDetailViewController.h
//  Project
//
//  Created by sylvain vincent on 08/10/2015.
//  Copyright © 2015 ESGI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DayDetailViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>{
    NSArray* dayEvents_;
}

@property (nonatomic, strong)NSArray* dayEvents;

@property (weak, nonatomic) IBOutlet UITableView *dayEventsTableView;

@property (weak, nonatomic) IBOutlet UILabel *legalInformationLink;

@end
