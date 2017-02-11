//
//  ColorsTableViewController.m
//  Quiz2
//
//  Created by Jimmy Navarro Castro on 2/11/17.
//  Copyright © 2017 Jimmy Navarro Castro. All rights reserved.
//

#import "ColorsTableViewController.h"

@interface ColorsTableViewController ()
@property(nonatomic,strong) NSMutableArray *numbersArray;
@end

@implementation ColorsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self LoadColorsArray];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)LoadColorsArray {
    [super viewDidLoad];
    
    self.numbersArray = [NSMutableArray new];
    for (int i = 1; i <= 5000; i++)
    {
        
        NSString *number = [NSString stringWithFormat:@"%d",i];
        NSDictionary *numDictionary = [[NSDictionary alloc] initWithObjects:@[number] forKeys:@[@"opNumber"]];
        [self.numbersArray addObject:numDictionary];
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSDictionary *currentNum = self.numbersArray[indexPath.row];
    NSString *number = [currentNum valueForKey:@"opNumber"];
    
    cell.textLabel.text =number;
    
    
 
    NSInteger num = [number integerValue];
    
    if (num % 2)
    {
        cell.textLabel.textColor= [UIColor redColor ];
    }
    
    else
    {
        cell.textLabel.textColor= [UIColor blueColor];
    }
    
    return cell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.numbersArray.count;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
