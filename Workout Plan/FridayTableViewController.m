//
//  FridayTableViewController.m
//  TDKFitness
//
//  Created by Pradyumn Nukala on 10/21/15.
//  Copyright © 2015 Pradyumn. All rights reserved.
//

#import "FridayTableViewController.h"

@interface FridayTableViewController ()
@property NSArray *workout;
@property NSArray *reps;
@property NSArray *images;
@end

@implementation FridayTableViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    self.workout = @[@"Cable Crunch",
                     @"Hanging Leg Raise",
                     @"Standing Calf Raises",
                     @"Seated Calf Raise",
                     @"Lying Leg Curls",
                     @"Leg Press",
                     @"Hack Squat",
                     @"Stiff-Legged Barbell Deadlift"
                     ];
    
    self.images = @[@"cableCrunch.png",
                    @"hangingLegRaise.png",
                    @"standingCalfRaise.png",
                    @"seatedCalfRaise.png",
                    @"lyingLegCurls.png",
                    @"legPress.png",
                    @"hackSquat.png",
                    @"barbellDeadlift.png"
                    ];
    
    self.reps = @[@"3 sets to failure, 30-second rest",
                  @"3 sets to failure, 30-second rest",
                  @"8 sets, 8 reps, 30-second rest",
                  @"3 sets, 10 reps, 60-second rest",
                  @"3 sets, 12, 9, 6 reps, 90-second rest",
                  @"Work up in weight, sets of 12 reps (until you can no longer complete 12 reps), 90-second rest",
                  @"3 sets, 15 reps, 90-second rest",
                  @"3 sets, 15 reps, 90-second rest",
                  ];
    
    self.navigationItem.title = @"Friday";
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
