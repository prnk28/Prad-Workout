//
//  SundayTableViewController.m
//  TDKFitness
//
//  Created by Pradyumn Nukala on 10/21/15.
//  Copyright © 2015 Pradyumn. All rights reserved.
//

#import "SundayTableViewController.h"

@interface SundayTableViewController ()
@property NSArray *workout;
@property NSArray *reps;
@property NSArray *images;
@end

@implementation SundayTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    self.workout = @[@"Cable Crunch",
                     @"Machine Bench Press",
                     @"Incline Dumbell Press",
                     @"Barbell Incline Bench Press",
                     @"Weighted Bench Dip",
                     @"Seated Bent-Over Rear Delt Raise",
                     @"Standing Low-Pulley Deltoid Raise",
                     @"Smith Machine Overhead Shoulder Press"
                     ];
    
    self.images = @[@"cableCrunch.png",
                    @"machineBenchPress.png",
                    @"inclineDumbellPress.png",
                    @"barbellInclineBenchPress.png",
                    @"weightedBenchDip.png",
                    @"SeatedBentDeltRaise.png",
                    @"lowPulley.png",
                    @"smithMachineOverheadPress.jpg"
                    ];
    
    self.reps = @[@"3 sets to failure, 60-second rest",
                  @"4 sets, 10 reps, 2-minute rest",
                  @"4 sets, 15, 12, 10, 8 reps, 2-minute rest",
                  @"4 sets, 6 reps, 2-minute rest",
                  @"3 sets to failure, 60-second rest",
                  @"4 sets, 15 reps, 90-second rest",
                  @"3 sets, 12 reps (each side), 90-second rest",
                  @"4 sets, 8 reps, 90-second rest",
                  ];

    self.navigationItem.title = @"Sunday";
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


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    NSDate *workout = self.workout[indexPath.row];
    NSDate *reps = self.reps[indexPath.row];
    cell.detailTextLabel.text = [reps description];
    cell.textLabel.text = [workout description];
    cell.imageView.image = [UIImage imageNamed:[self.images objectAtIndex:indexPath.row]];
    
    return cell;
}

@end
