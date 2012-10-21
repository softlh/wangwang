//
//  NetBodyCheckController.h
//  MyriadNet
//
//  Created by Ibokan on 12-10-16.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSONRequest.h"
#import "InformationCell.h"
@class BodyMessage;
#import "MessageSend.h"

@interface NetBodyCheckController : UIViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,messagesend>
{
    UITextField *aTextField;//搜索框
    JSONRequest *request;
    UIImageView *backView;//背景图片
    BOOL isRegistered;
    int HEIGHT;
    UILabel *statusLableShow;
    UILabel *DNSLableShow;
    UILabel *accessLableShow;
    UILabel *remindLableShow;
    
    NSArray *arrayCom;
    UITableView *tableViewCom;
    InformationCell *cell;
    NSMutableArray *cellArray;
    
    NSString *textString;
    BodyMessage *message;
    
    NSDictionary *whoisDic;
    NSDictionary *accessDic;
    NSDictionary *registerDic;
    
    NSArray *statuArr;
    NSArray *DNSArray;
    NSArray *registerArr;
    NSArray *accessArr;
    NSString *domainstatus;//域名状态
    NSString *dnsserver;//域名DNS
    NSString *notdomain;//未注册域名
    
    BOOL whoisBL;
    BOOL accessBL;
    BOOL registerBL;
    
    NSArray *array;

}
@property (nonatomic,retain) UIActivityIndicatorView *indicatorView;
@end
