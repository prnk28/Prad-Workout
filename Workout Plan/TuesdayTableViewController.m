//
//  TuesdayTableViewController.m
//  TDKFitness
//
//  Created by Pradyumn Nukala on 10/21/15.
//  Copyright © 2015 Pradyumn. All rights reserved.
//

#import "TuesdayTableViewController.h"

@interface TuesdayTableViewController ()
@property NSArray *workout;
@property NSArray *reps;
@property NSArray *images;
@end

@implementation TuesdayTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    self.workout = @[@"Jackknife Sit-Up",
                     @"Decline Reverse Crunch",
                     @"Smith Machine Bent Over Row",
                     @"Pull-ups (Close-grip)",
                     @"Straight-Arm Dumbbell Pullover",
                     @"Barbell Shrug*",
                     @"Hyperextensions (Weighted)"
                     ];
    
    self.images = @[@"jackknifeSitUp",
                    @"imgres.jpg",
                    @"bentOverRow.png",
                    @"closePullup.jpg",
                    @"straightArmPullover.png",
                    @"barbellShrug.png",
                    @"hyperextensions.jpg",
                    ];
    
    self.reps = @[@"3 sets to failure, 2-minute rest",
                  @"3 sets to failure, 2-minute rest",
                  @"4 sets, 10 reps, 2-minute rest",
                  @"4 sets to failure, 2-minute rest",
                  @"3 sets, 12 reps, 2-minute rest",
                  @"4 sets, 12 reps, 2-minute rest",
                  @"3 sets to failure, 2-minute rest"
                  ];
    
    self.navigationItem.title = @"Tuesday";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.workout.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    NSDate *workout = self.workout[indexPath.row];
    NSDate *reps = self.reps[indexPath.row];
    cell.detailTextLabel.text = [reps description];
    cell.textLabel.text = [workout description];
    cell.imageView.image = [UIImage imageNamed:[self.images objectAtIndex:indexPath.row]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 65;
}

- (void)tableView:(UITableView *)theTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
    UIAlertView * alert =[[UIAlertView alloc ] initWithTitle:self.workout[indexPath.row]
                                                     message:self.reps[indexPath.row]
                                                    delegate:self
                                           cancelButtonTitle:@"GOOO!!"
                                           otherButtonTitles: nil];
    [alert show];
}


@end
