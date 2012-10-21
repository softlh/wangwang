//
//  detailedInformation.h
//  MyriadNet
//
//  Created by Ibokan on 12-10-17.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class InformationCell;
@interface detailedInformation : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *aTableView;
    InformationCell *cell;
}
@property (nonatomic,retain) NSString *contentString;
@property (nonatomic,retain) NSArray *detailArray;
@property (nonatomic,assign) int whichInf;
@end
