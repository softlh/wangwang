//
//  InformationCell.m
//  MyriadNet
//
//  Created by Ibokan on 12-10-17.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import "InformationCell.h"

@implementation InformationCell
@synthesize cellLable = _cellLable;
@synthesize tipView = _tipView;
@synthesize collectionView = _collectionView;
-(void)dealloc
{
    [_cellLable release];
    _cellLable = nil;
    [super dealloc];
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.cellLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
        [self.cellLable setBackgroundColor:[UIColor clearColor]];
        [self addSubview:self.cellLable];
        
//        self.tipView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"test_button.png"]];
//        self.tipView.userInteractionEnabled = YES;
//        self.tipView.frame = CGRectMake(220, 10, 40, 23);
//        [self addSubview:self.tipView];
//        UIButton *tipBtu = [UIButton buttonWithType:UIButtonTypeCustom];
//        tipBtu.frame = CGRectMake(10, 3, 17, 17);
//        [tipBtu setBackgroundImage:[UIImage imageNamed:@"cart.png"] forState:UIControlStateNormal];
//        [self.tipView addSubview:tipBtu];
//        [tipBtu addTarget:self action:@selector(tipInformation) forControlEvents:UIControlEventTouchUpInside];
//        [self.tipView release];
//        
//        self.collectionView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"test_button.png"]];
//        self.collectionView.userInteractionEnabled = YES;
//        self.collectionView.frame = CGRectMake(270, 10, 40, 23);
//        [self addSubview:self.collectionView];
//        UIButton *collectionBtu = [UIButton buttonWithType:UIButtonTypeCustom];
//        collectionBtu.frame = CGRectMake(10, 3, 17, 17);
//        [collectionBtu setBackgroundImage:[UIImage imageNamed:@"test_button.png"] forState:UIControlStateNormal];
//        [collectionBtu setBackgroundImage:[UIImage imageNamed:@"收藏.png"] forState:UIControlStateNormal];
//        [self.collectionView addSubview:collectionBtu];
//        [collectionBtu addTarget:self action:@selector(collectionThisWeb) forControlEvents:UIControlEventTouchUpInside];
//        [self.collectionView release];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
