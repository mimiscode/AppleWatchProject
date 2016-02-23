//
//  DayDetailViewController.m
//  Project
//
//  Created by sylvain vincent on 08/10/2015.
//  Copyright © 2015 ESGI. All rights reserved.
//

#import "DayDetailViewController.h"
#import "Event.h"
#import "medicationFactory.h"

@interface DayDetailViewController ()

@end

static NSString* const kHomeViewControllerCellIdentifier=@"SuperUniqueKey";


@implementation DayDetailViewController
@synthesize dayEvents =dayEvents_;
@synthesize medications = medications_;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.dayEventsTableView.delegate = self;
    self.dayEventsTableView.dataSource = self;
    
    [self initializeMedications];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) initializeMedications{
    [medicationFactory getMedicationsWithCompletionHandler:^(NSArray* medications) {
         dispatch_async(dispatch_get_main_queue(), ^{
             self.medications = medications;
             [self.dayEventsTableView reloadData];
         });
    }];
}

-(NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dayEvents count];
}

-(UITableViewCell *)tableView:(UITableView *)
tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Event* event = [Event new];
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:kHomeViewControllerCellIdentifier];
    event = [self.dayEvents objectAtIndex:indexPath.row];
    Medication* medication = [self getMedicationById:event.medication];
    
    NSDateFormatter* dateFormatter = [NSDateFormatter new];
   
    [dateFormatter setDateFormat:@"HH:mm"];
    NSString *dateStr = [dateFormatter  stringFromDate:event.date];
    
   // NSDate *eventDate = [dateFormatter dateFromString:dateStr];// date with yyyy-MM-dd format
    NSLog(@"deyEventDate : %@", dateStr);
    
    
    
    
    
    cell= [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kHomeViewControllerCellIdentifier];
    
    UILabel* eventHour = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 140, 20)];
    
    eventHour.text = [NSString stringWithFormat:@"%@", dateStr];
    
   // UILabel* doctorFirstname = [[UILabel alloc]initWithFrame:CGRectMake(80, 22, 140, 20)];
    //doctorFirstname.text = [NSString stringWithFormat:@"%@", doctor.firstname];
    
     UILabel* medicationLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 40, 140, 20)];
     medicationLabel.text = [NSString stringWithFormat:@"%@ (x%d)", medication.label, event.numberMedications];
    
    UISwitch *switchView = [[UISwitch alloc] initWithFrame:CGRectZero];
    cell.accessoryView = switchView;
    [switchView setOn:YES animated:YES];
    //[switchView addTarget:self action:nil forControlEvents:UIControlEventValueChanged];
    
    
        [cell.contentView addSubview:eventHour];
    [cell.contentView addSubview:medicationLabel];

    cell.backgroundColor = [UIColor clearColor];
    
    
    
    return cell;
}


-(Medication*) getMedicationById:(NSString*)medicationId{
    
    for(Medication* medication in self.medications){
        if([[medication idd]  isEqualToString:medicationId]){
            return medication;
        }
    }
    return nil;
}

- (IBAction)onAddEventTouch:(id)sender {
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Bientôt disponible"
                                                                   message:@"Cette fonctionnalité sera disponible dans la version 2.0 de l'application."
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Fermer" style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * action) {                   }];
    
    [alert addAction:cancelAction];
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
