//
//  DoctorViewController.m
//  Project
//
//  Created by sylvain vincent on 07/10/2015.
//  Copyright © 2015 ESGI. All rights reserved.
//

#import "DoctorViewController.h"
#import "doctorFactory.h"
#import "userFactory.h"
#import "Doctor.h"

@interface DoctorViewController ()

@end

static NSString* const kHomeViewControllerCellIdentifier=@"SuperUniqueKey";


@implementation DoctorViewController


@synthesize user = user_;
@synthesize userDoctor = userDoctor_;
@synthesize allDoctors = allDoctors_;
@synthesize selectedDoctor = selectedDoctor_;
@synthesize doctorsToDisplay = doctorsToDisplay_;



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.doctorsListView.delegate = self;
    self.doctorsListView.dataSource = self;
    self.doctorsToDisplay = nil;
    self.allDoctors = nil;
    
    [self initializeDoctorsList];
    
    self.searchBar.delegate = self;
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) initializeDoctorsList{
    [self.activityIndicator setHidden:false];
    [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
    
    [doctorFactory getDoctorsWithCompletionHandler:^(NSArray* doctors) {
        self.allDoctors = doctors;
        self.doctorsToDisplay = doctors;
        dispatch_async(dispatch_get_main_queue(), ^{
        [self.doctorsListView reloadData];
        
        self.userDoctor = [self getDoctorById:self.user.doctorIdd inDoctors:self.allDoctors];
        
            if(self.userDoctor != nil){
                [self.doctorNameLabel setText:[NSString stringWithFormat:@"Dr. %@ %@", self.userDoctor.firstname, self.userDoctor.lastname]];
                [self.doctorAddressLabel setText:self.userDoctor.address];
                [self.doctorPhoneLabel setText:self.userDoctor.phone];
                [self.doctorMailLabel setText:self.userDoctor.mail];
                [self.errorMessage setHidden:true];
            }
            else{
                [self.errorMessage setHidden:false];
            }
            
            [self.activityIndicator setHidden:true];
            [self.activityIndicator stopAnimating];
        });
        
    }];
    

}

-(Doctor*) getDoctorById:(NSString*)idd inDoctors:(NSArray*)doctors{
    
    for(int i=0; i<[doctors count]; i++){
        Doctor* currentDoctor = [doctors objectAtIndex:i];
        if([currentDoctor.idd isEqualToString:idd]){
            return [doctors objectAtIndex:i];
        }
    }
    return nil;
}

-(NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section{
        return [self.doctorsToDisplay count];
}

-(UITableViewCell *)tableView:(UITableView *)
tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Doctor* doctor = [Doctor new];
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:kHomeViewControllerCellIdentifier];
    
    doctor = [self.doctorsToDisplay objectAtIndex:indexPath.row];
    
    
        cell= [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kHomeViewControllerCellIdentifier];
        
        UILabel* doctorLastname = [[UILabel alloc]initWithFrame:CGRectMake(10, 22, 140, 20)];
        doctorLastname.text = [NSString stringWithFormat:@"%@", [NSString stringWithFormat:@"%@ %@", doctor.firstname, doctor.lastname]];
    
        
        [cell.contentView addSubview:doctorLastname];
    
       cell.backgroundColor = [UIColor clearColor];
        
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
        self.selectedDoctor = [self.doctorsToDisplay objectAtIndex:indexPath.row];
    
    
    NSString* message = [NSString stringWithFormat:@"Souhaitez-vous vraiment remplacer votre médecin par le suivant : %@ %@", self.selectedDoctor.lastname, self.selectedDoctor.firstname];
    
   
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Confirmation"
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* validAction = [UIAlertAction actionWithTitle:@"Confirmer" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                               self.user.doctorIdd = self.selectedDoctor.idd;
                                                              self.doctorAddressLabel.text = @"";
                                                              self.doctorMailLabel.text = @"";
                                                              self.doctorNameLabel.text = @"";
                                                              self.doctorPhoneLabel.text = @"";
                                                              [self.activityIndicator setHidden:false];
                                                              [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
                                                              
                                                              [userFactory updateUser:self.user completionHandler:^(User* user) {
                                                                  dispatch_async(dispatch_get_main_queue(), ^{
                                                                      self.user = user;
                                                                      self.userDoctor = [self getDoctorById:self.user.doctorIdd inDoctors:self.allDoctors];
                                                                      if(self.userDoctor != nil){
                                                                    [self.doctorNameLabel setText:[NSString stringWithFormat:@"Dr. %@ %@", self.userDoctor.firstname, self.userDoctor.lastname]];
                                                                      [self.doctorAddressLabel setText:self.userDoctor.address];
                                                                      [self.doctorPhoneLabel setText:self.userDoctor.phone];
                                                                      [self.doctorMailLabel setText:self.userDoctor.mail];
                                                                          [self.errorMessage setHidden:true];
                                                                      }
                                                                      else{
                                                                          [self.errorMessage setHidden:false];
                                                                      }
                                                                      
                                                                      [self.activityIndicator stopAnimating];
                                                                      [self.activityIndicator setHidden:true];
                                                                  });
                                                                  
                                                              }];
                                                          }];
    
    
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Annuler" style:UIAlertActionStyleDefault
                                                        handler:^(UIAlertAction * action) {
                                                        }];
    

    
    
    [alert addAction:cancelAction];
    [alert addAction:validAction];

    [self presentViewController:alert animated:YES completion:nil];
    

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

- (NSArray*) searchFilterWithValue:(NSString*)searchValue inDoctors:(NSArray*)allDoctors{
    
    NSMutableArray* result = [NSMutableArray new];
    
    for(Doctor* doctor in allDoctors){
        
        NSRange textRange1;
        textRange1 =[[doctor.firstname lowercaseString] rangeOfString:[searchValue lowercaseString]];
        
        NSRange textRange2;
        textRange2 =[[doctor.lastname lowercaseString] rangeOfString:[searchValue lowercaseString]];
        
        if(textRange1.location != NSNotFound || textRange2.location != NSNotFound)
        {
            [result addObject:doctor];
        }
    }
    return result;
}

- (void)searchBar:(UISearchBar * _Nonnull)searchBar textDidChange:(NSString * _Nonnull)searchText{
    
    if([searchText isEqualToString:@""])
        self.doctorsToDisplay = (NSMutableArray*)self.allDoctors;
    else{
        self.doctorsToDisplay = [self searchFilterWithValue:searchText inDoctors:self.allDoctors
                                 ];
    }
    
    NSLog(@"Tab result : %@", self.doctorsToDisplay);
    
    [self.doctorsListView reloadData];
}

-(void)threadStartAnimating{
    [self.activityIndicator startAnimating];
}
@end
