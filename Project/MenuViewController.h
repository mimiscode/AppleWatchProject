//
//  MenuViewController.h
//  Project
//
//  Created by sylvain vincent on 07/10/2015.
//  Copyright © 2015 ESGI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface MenuViewController : UIViewController{
    @private
    User* user_;
}

@property (nonatomic, strong) User* user;

@property (weak, nonatomic) IBOutlet UILabel *legalInformationLink;

@end
