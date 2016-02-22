//
//  DoctorViewController.h
//  Project
//
//  Created by sylvain vincent on 07/10/2015.
//  Copyright © 2015 ESGI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import "Doctor.h"

@interface DoctorViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>{
@private
    User* user_;
    Doctor* userDoctor_;
    Doctor* selectedDoctor_;
    NSArray* allDoctors_;
    NSArray* doctorsToDisplay_;
}
-(Doctor*) getDoctorById:(NSString*)idd inDoctors:(NSArray*)doctors;

-(NSArray*)searchFilterWithValue:(NSString*)searchValue inDoctors:(NSArray*)doctors;

-(void) initializeDoctorsList;
-(void)threadStartAnimating;

@property(nonatomic, strong)User* user;
@property(nonatomic, strong)Doctor* userDoctor;
@property(nonatomic, strong)Doctor* selectedDoctor;
@property(nonatomic, strong)NSArray* allDoctors;
@property(nonatomic, strong)NSArray* doctorsToDisplay;
@property (weak, nonatomic) IBOutlet UILabel *errorMessage;

@property (weak, nonatomic) IBOutlet UILabel *doctorNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *doctorAddressLabel;
@property (weak, nonatomic) IBOutlet UILabel *doctorPhoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *doctorMailLabel;

@property (weak, nonatomic) IBOutlet UITableView *doctorsListView;

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;



@end
