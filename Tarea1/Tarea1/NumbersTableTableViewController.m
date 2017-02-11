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
#warning Incomplete implementation, return the number of sections
    return 0;
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


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *message = [NSString stringWithFormat:@"You selected the row# %ld",(long)indexPath.row];
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Information Message" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    
    [alertController addAction:okAction];
    
    [self presentViewController:alertController animated:true completion:nil];
    
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.numbersArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}

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
