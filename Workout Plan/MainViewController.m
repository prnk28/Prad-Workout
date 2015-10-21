//
//  MainViewController.m
//  Workout Plan
//
//  Created by Pradyumn Nukala on 10/21/15.
//  Copyright © 2015 Pradyumn. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
@property NSArray *objects;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    self.objects = @[@"Sunday: AM - Cardio, PM - Abs, Chest, Shoulders, Triceps",
                     @"Monday: AM - Cardio, PM - Rest",
                     @"Tuesday: AM - Cardio, PM - Abs, Back, Traps",
                     @"Wednesday: AM - Cardio, PM - Rest",
                     @"Thursday: AM - Cardio, PM - Abs, Arms",
                     @"Friday: AM - Cardio, PM - Abs, Legs"];
    
        self.navigationItem.title = @"Prad's Workout";
}

#pragma mark - Table view data source
- (void)tableView:(UITableView *)theTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
    if (indexPath.row == 1 || indexPath.row == 3) {
        UIAlertView * alert =[[UIAlertView alloc ] initWithTitle:@"Cardio Today"
                                                         message:@"Choose any type of exercise you like, such as walking, cycling on a stationary bike, or using a stair climber, but keep the intensity at your target heart rate, 142."
                                                        delegate:self
                                               cancelButtonTitle:@"GOOO!!"
                                               otherButtonTitles: nil];
        [alert show];
    } else if(indexPath.row == 0){
        SundayTableViewController *svc = [[SundayTableViewController alloc] init];
        [self.navigationController pushViewController:svc animated:YES];
    }else if(indexPath.row == 2){
        TuesdayTableViewController *tvc = [[TuesdayTableViewController alloc] init];
        [self.navigationController pushViewController:tvc animated:YES];
    } else if (indexPath.row == 4){
        ThursdayTableViewController *thvc = [[ThursdayTableViewController alloc]init];
        [self.navigationController pushViewController:thvc animated:YES];
    } else {
        FridayTableViewController *fvc = [[FridayTableViewController alloc] init];
        [self.navigationController pushViewController:fvc animated:YES];
    }
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {


    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    
    NSDate *object = self.objects[indexPath.row];
    cell.textLabel.text = [object description];
    return cell;
}

@end