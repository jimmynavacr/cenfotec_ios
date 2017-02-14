//
//  NumbersCustomTableViewCell.m
//  CustomTableViewExample
//
//  Created by Edgar Delgado on 2/11/17.
//  Copyright © 2017 Edgar Delgado. All rights reserved.
//

#import "NumbersCustomTableViewCell.h"

@interface NumbersCustomTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *numbeLabel;

@end

@implementation NumbersCustomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

-(void) setupCellWithNumber:(NSString*) number{
    self.numbeLabel.text =number;
}

@end
