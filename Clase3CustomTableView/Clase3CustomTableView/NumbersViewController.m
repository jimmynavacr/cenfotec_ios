//
//  NumbersViewController.m
//  CustomTableViewExample
//
//  Created by Edgar Delgado on 2/11/17.
//  Copyright © 2017 Edgar Delgado. All rights reserved.
//

#import "NumbersViewController.h"
#import "NumbersCustomTableViewCell.h"

@interface NumbersViewController ()< UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic,strong) NSMutableArray *dataSource;

@end

@implementation NumbersViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self registerCustomCell];
    [self fillArray];
}

-(void) fillArray{
    self.dataSource = [NSMutableArray new];
    for(int index=2;index<5001;index++)
    {
        if(index%2 == 0){
            [self.dataSource addObject:[NSString stringWithFormat:@"%d",index]];
        }
        
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) registerCustomCell
{
    UINib *nib = [UINib nibWithNibName:@"NumbersCustomTableViewCell" bundle:nil];
    [self.tableview registerNib:nib forCellReuseIdentifier:@"NumbersCustomTableViewCell" ];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    NumbersCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NumbersCustomTableViewCell"];
    NSString *numbertoDraw =self.dataSource[indexPath.row];
    [cell setupCellWithNumber:numbertoDraw];
    return cell;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
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
