//
//  ThursdayTableViewController.m
//  TDKFitness
//
//  Created by Pradyumn Nukala on 10/21/15.
//  Copyright © 2015 Pradyumn. All rights reserved.
//

#import "ThursdayTableViewController.h"

@interface ThursdayTableViewController ()
@property NSArray *workout;
@property NSArray *reps;
@property NSArray *images;
@end

@implementation ThursdayTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    self.workout = @[@"Decline Crunch",
                     @"Flat Bench Lying Leg Raise",
                     @"Triceps Pushdown - Rope Attachment",
                     @"Bench Dips",
                     @"Decline EZ-Bar Triceps Extension",
                     @"Barbell Curl",
                     @"Preacher Curl",
                     @"Hammer Curls"
                     ];
    
    self.images = @[@"declinebenchcrunch.jpg",
                    @"flatBenchLegRaise.png",
                    @"ropePullDown.png",
                    @"benchDips.png",
                    @"declineTriceps.png",
                    @"barbellCurl.png",
                    @"preacherCurl.png",
                    @"hammerCurl.png"
                    ];
    
    self.reps = @[@"3 sets to failure, 60-second rest",
                  @"3 sets to failure, 60-second rest",
                  @"4 sets, 20, 15, 12, 9 reps, 60-second rest",
                  @"4 sets to failure, 60-second rest",
                  @"4 sets, 10 reps, 60-second rest",
                  @"5 sets, 8 reps, 60-second rest",
                  @"4 sets, 8 reps, 60-second rest",
                  @"3 sets, 10 reps, 60-second rest",
                  ];
    
    self.navigationItem.title = @"Thursday";
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
