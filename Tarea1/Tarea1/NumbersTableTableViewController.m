//
//  NumbersTableTableViewController.m
//  Tarea1
//
//  Created by Jimmy Navarro Castro on 2/10/17.
//  Copyright © 2017 Jimmy Navarro Castro. All rights reserved.
//

#import "NumbersTableTableViewController.h"

@interface NumbersTableTableViewController ()
@property(nonatomic,strong) NSMutableArray *numbersArray;
@end

@implementation NumbersTableTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        [self initializeNumbersArray];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)initializeNumbersArray{


    self.numbersArray = [NSMutableArray new];
    for (int i = 1; i <= 80; i++)
    {
        NSLog(@"%d", i);
        
        NSString *operationName = [NSString stringWithFormat:@"8*%d=",i];
        NSDictionary *numDictionary = [[NSDictionary alloc] initWithObjects:@[operationName,[NSNumber numberWithInt:8*i]] forKeys:@[@"opName", @"opResult"]];
        [self.numbersArray addObject:numDictionary];
        
    }
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
    return self.numbersArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSDictionary *currentNum = self.numbersArray[indexPath.row];
    
    cell.textLabel.text = [currentNum valueForKey:@"opName"];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%d", [[currentNum valueForKey:@"opResult"] intValue]];
    
    return cell;
}





@end
