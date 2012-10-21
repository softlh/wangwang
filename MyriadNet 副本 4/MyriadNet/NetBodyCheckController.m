//
//  NetBodyCheckController.m
//  MyriadNet
//
//  Created by Ibokan on 12-10-16.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import "NetBodyCheckController.h"
#import "detailedInformation.h"
#import "RegexKitLite.h"
#import "BodyMessage.h"

@interface NetBodyCheckController ()

@end

@implementation NetBodyCheckController
@synthesize indicatorView = _indicatorView;
-(void)dealloc
{
    [aTextField release],aTextField = nil;
    [backView release],backView = nil;
    [statusLableShow release],statusLableShow = nil;
    [DNSLableShow release],DNSLableShow = nil;
    [accessLableShow release],accessLableShow = nil;
    [remindLableShow release],remindLableShow = nil;
    [arrayCom release],arrayCom = nil;
    [tableViewCom release],tableViewCom = nil;
    [_indicatorView release],_indicatorView = nil;
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
//收藏
-(void)collectionThisWeb
{
    NSLog(@"收藏");
}
-(void)tipInformation
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请登陆万网www.net.cn查看详情! 电话:400-600-3456!" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alert show];
    [alert release];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [aTextField resignFirstResponder];
}
//域名状态检查
-(void)domainNameCheckImformation
{
    NSLog(@"域名状态检查");
    detailedInformation *information = [[detailedInformation alloc] init];
    information.contentString = @"  域名状态";
    statuArr = [[NSArray alloc] init];
    if(domainstatus != @"\"\"")
    {
        NSLog(@"domainstatus######=%@",domainstatus);
    }
    statuArr = [self stringToArray:domainstatus] ;
//    information.array=[[NSArray alloc]init];
    information.detailArray = statuArr;
    information.whichInf = 1;
    NSLog(@"detail array === %@",statuArr);
    [self presentModalViewController:information animated:YES];
    [information release];
}
//域名DNS检查
-(void)domainNameDNSCheckImformation
{
    NSLog(@"域名DNS检查");
    detailedInformation *information = [[detailedInformation alloc] init];
    information.contentString = @"  域名DNS";
    DNSArray = [[NSArray alloc] init];
    NSLog(@"dnsserver = %@",dnsserver);
    DNSArray = [self stringToArray:dnsserver];
//   information.array=[[NSArray alloc]init];
    information.detailArray = DNSArray;
    information.whichInf = 1;
    NSLog(@"dns array = %@",DNSArray);
    [self presentModalViewController:information animated:YES];
    [information release];
}
//域名访问检查
-(void)domainNameAccessCheakInformation
{
    detailedInformation *information = [[detailedInformation alloc] init];
    information.contentString = @"  域名访问";
    information.detailArray = accessArr;
    information.whichInf = 2;
    NSLog(@"access array = %@",accessArr);
    [self presentModalViewController:information animated:YES];
    [information release];
}
//未注册域名提醒
-(void)noRegisteredDomainNameRemind
{
    detailedInformation *information = [[detailedInformation alloc] init];
    information.contentString = @"  无注册域名";
//    information.array=[[NSArray alloc]init];
    registerArr = [self stringToArray:notdomain];
    NSLog(@"register array = %@",registerArr);
    information.detailArray = registerArr;
    information.whichInf = 3;
    [self presentModalViewController:information animated:YES];
    [information release];
}
//搜索域名已经有注册
-(void)initSearchLaterHasRegistered
{
    backView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 80, 320, 430)];
    [backView setImage:[UIImage imageNamed:@"test_ground.png"]];
    backView.userInteractionEnabled = YES;
    [self.view addSubview:backView];
    
    UIImageView *checkView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"test_return.png"]];
    checkView.userInteractionEnabled = YES;
    UILabel *statusLable = [[UILabel alloc] initWithFrame:CGRectMake(30, HEIGHT, 300, 50)];
    [checkView setFrame:CGRectMake(10, HEIGHT, 300, 74)];
    [statusLable setBackgroundColor:[UIColor clearColor]];
    statusLable.text = @"域名状态检查";
    statusLable.textColor = [UIColor grayColor];
    statusLable.textAlignment = 0;
    [backView addSubview:checkView];
    [backView addSubview:statusLable];
    UIButton *statusImf = [UIButton buttonWithType:UIButtonTypeCustom];
    [statusImf setBackgroundImage:[UIImage imageNamed:@"test_button.png"] forState:UIControlStateNormal];
    statusImf.frame = CGRectMake(240, 15, 40, 23);
    [statusImf setTitle:@"详细" forState:UIControlStateNormal];
    [statusImf.titleLabel setFont:[UIFont systemFontOfSize:12]];
    statusImf.tintColor = [UIColor grayColor];
    [statusImf addTarget:self action:@selector(domainNameCheckImformation) forControlEvents:UIControlEventTouchUpInside];
    [checkView addSubview:statusImf];
    statusLableShow = [[UILabel alloc] initWithFrame:CGRectMake(30, 50, 300, 24)];
    statusLableShow.textAlignment = 0;
    [statusLableShow setBackgroundColor:[UIColor clearColor]];
    [checkView addSubview:statusLableShow];
    [statusLable release];
    [checkView release];
    
    UIImageView *DNSView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"test_return.png"]];
    DNSView.userInteractionEnabled = YES;
    UILabel *DNSLable = [[UILabel alloc] initWithFrame:CGRectMake(30, HEIGHT + 84, 300, 50)];
    DNSView.frame = CGRectMake(10, HEIGHT + 84, 300, 74);
    [DNSLable setBackgroundColor:[UIColor clearColor]];
    DNSLable.text = @"域名DNS检查";
    DNSLable.textColor = [UIColor grayColor];
    DNSLable.textAlignment = 0;
    [backView addSubview:DNSView];
    [backView addSubview:DNSLable];
    UIButton *DNSinf = [UIButton buttonWithType:UIButtonTypeCustom];
    [DNSinf setBackgroundImage:[UIImage imageNamed:@"test_button.png"] forState:UIControlStateNormal];
    DNSinf.frame = CGRectMake(240, 15, 40, 23);
    [DNSinf setTitle:@"详细" forState:UIControlStateNormal];
    [DNSinf.titleLabel setFont:[UIFont systemFontOfSize:12]];
    [DNSinf addTarget:self action:@selector(domainNameDNSCheckImformation) forControlEvents:UIControlEventTouchUpInside];
    [DNSView addSubview:DNSinf];
    DNSLableShow = [[UILabel alloc] initWithFrame:CGRectMake(30, 50, 300, 24)];
    DNSLableShow.textAlignment = 0;
    [DNSLableShow setBackgroundColor:[UIColor clearColor]];
    [DNSView addSubview:DNSLableShow];
    [DNSLable release];
    [DNSView release];
    
    UIImageView *accessView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"test_return.png"]];
    accessView.userInteractionEnabled = YES;
    UILabel *accessLable = [[UILabel alloc] initWithFrame:CGRectMake(30, HEIGHT + 168, 300, 50)];
    accessView.frame = CGRectMake(10, HEIGHT + 168, 300, 74);
    [accessLable setBackgroundColor:[UIColor clearColor]];
    accessLable.text = @"域名访问检查";
    accessLable.textColor = [UIColor grayColor];
    accessLable.textAlignment = 0;
    [backView addSubview:accessView];
    [backView addSubview:accessLable];
    UIButton *accessInf = [UIButton buttonWithType:UIButtonTypeCustom];
    [accessInf setBackgroundImage:[UIImage imageNamed:@"test_button.png"] forState:UIControlStateNormal];
    accessInf.frame = CGRectMake(240, 15, 40, 23);
    [accessInf setTitle:@"详细" forState:UIControlStateNormal];
    [accessInf.titleLabel setFont:[UIFont systemFontOfSize:12]];
    [accessInf addTarget:self action:@selector(domainNameAccessCheakInformation) forControlEvents:UIControlEventTouchUpInside];
    [accessView addSubview:accessInf];
    accessLableShow = [[UILabel alloc] initWithFrame:CGRectMake(30, 50, 300, 24)];
    accessLableShow.textAlignment = 0;
    [accessLableShow setBackgroundColor:[UIColor clearColor]];
    [accessView addSubview:accessLableShow];
    [accessLable release];
    [accessView release];
    
    UIImageView *remindView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"test_return.png"]];
    remindView.userInteractionEnabled = YES;
    UILabel *remindLable = [[UILabel alloc] initWithFrame:CGRectMake(30, HEIGHT + 252, 300, 50)];
    remindView.frame = CGRectMake(10, HEIGHT + 252, 300, 74);
    [remindLable setBackgroundColor:[UIColor clearColor]];
    remindLable.text = @"未注册域名提醒";
    remindLable.textColor = [UIColor grayColor];
    remindLable.textAlignment = 0;
    [backView addSubview:remindView];
    [backView addSubview:remindLable];
    UIButton *remindInf = [UIButton buttonWithType:UIButtonTypeCustom];
    [remindInf setBackgroundImage:[UIImage imageNamed:@"test_button.png"] forState:UIControlStateNormal];
    remindInf.frame = CGRectMake(240, 15, 40, 23);
    [remindInf setTitle:@"详细" forState:UIControlStateNormal];
    [remindInf.titleLabel setFont:[UIFont systemFontOfSize:12]];
    [remindInf addTarget:self action:@selector(noRegisteredDomainNameRemind) forControlEvents:UIControlEventTouchUpInside];
    [remindView addSubview:remindInf];
    remindLableShow = [[UILabel alloc] initWithFrame:CGRectMake(30, 50, 300, 24)];
    remindLableShow.textAlignment = 0;
    [remindLableShow setBackgroundColor:[UIColor clearColor]];
    [remindView addSubview:remindLableShow];
    [remindLable release];
    [remindView release];
}
//搜索域名未注册
-(void)initSearchLaterAndNoRegistered
{
    backView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 80, 320, 430)];
    [backView setImage:[UIImage imageNamed:@"test_ground.png"]];
    backView.userInteractionEnabled = YES;
    [self.view addSubview:backView];
    
    UIImageView *noRegisteredView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"test_pickground.png"]];
    noRegisteredView.userInteractionEnabled = YES;
    noRegisteredView.frame = CGRectMake(10, 5, 300, 70);
    [backView addSubview:noRegisteredView];
    UILabel *noRegisteredLable = [[UILabel alloc] initWithFrame:CGRectMake(30, 5, 200, 70)];
    [noRegisteredLable setBackgroundColor:[UIColor clearColor]];
    noRegisteredLable.text = @"此域名未被注册";
    [noRegisteredLable setFont:[UIFont systemFontOfSize:20]];
    noRegisteredLable.textAlignment = 0;
    [backView addSubview:noRegisteredLable];
    
    UIImageView *tipView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"test_button.png"]];
    tipView.userInteractionEnabled = YES;
    tipView.frame = CGRectMake(240, 10, 40, 23);
    [noRegisteredView addSubview:tipView];
    UIButton *tipBtu = [UIButton buttonWithType:UIButtonTypeCustom];
    tipBtu.frame = CGRectMake(10, 3, 17, 17);
    [tipBtu setBackgroundImage:[UIImage imageNamed:@"cart.png"] forState:UIControlStateNormal];
    [tipView addSubview:tipBtu];
    [tipBtu addTarget:self action:@selector(tipInformation) forControlEvents:UIControlEventTouchUpInside];
    [tipView release];
    
    UIImageView *collectionView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"test_button.png"]];
    collectionView.userInteractionEnabled = YES;
    collectionView.frame = CGRectMake(240, 37, 40, 23);
    [noRegisteredView addSubview:collectionView];
    UIButton *collectionBtu = [UIButton buttonWithType:UIButtonTypeCustom];
    collectionBtu.frame = CGRectMake(13, 3, 17, 17);
    [collectionBtu setBackgroundImage:[UIImage imageNamed:@"test_button.png"] forState:UIControlStateNormal];
    [collectionBtu setBackgroundImage:[UIImage imageNamed:@"收藏.png"] forState:UIControlStateNormal];
    [collectionView addSubview:collectionBtu];
    [collectionBtu addTarget:self action:@selector(collectionThisWeb) forControlEvents:UIControlEventTouchUpInside];
    [collectionView release];
    
    [noRegisteredLable release];
    [noRegisteredView release];
    
    HEIGHT += 70;
//    [self initSearchBefore];
    UIImageView *checkView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"test_graybutton.png"]];
    UILabel *statusLable = [[UILabel alloc] initWithFrame:CGRectMake(30, HEIGHT, 300, 50)];
    [checkView setFrame:CGRectMake(10, HEIGHT, 300, 50)];
    [statusLable setBackgroundColor:[UIColor clearColor]];
    statusLable.text = @"域名状态检查";
    statusLable.textColor = [UIColor grayColor];
    statusLable.textAlignment = 0;
    [backView addSubview:checkView];
    [backView addSubview:statusLable];
    [statusLable release];
    [checkView release];
    
    UIImageView *DNSView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"test_graybutton.png"]];
    UILabel *DNSLable = [[UILabel alloc] initWithFrame:CGRectMake(30, HEIGHT + 60, 300, 50)];
    DNSView.frame = CGRectMake(10, HEIGHT + 60, 300, 50);
    [DNSLable setBackgroundColor:[UIColor clearColor]];
    DNSLable.text = @"域名DNS检查";
    DNSLable.textColor = [UIColor grayColor];
    DNSLable.textAlignment = 0;
    [backView addSubview:DNSView];
    [backView addSubview:DNSLable];
    [DNSLable release];
    [DNSView release];
    
    UIImageView *accessView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"test_graybutton.png"]];
    UILabel *accessLable = [[UILabel alloc] initWithFrame:CGRectMake(30, HEIGHT + 120, 300, 50)];
    accessView.frame = CGRectMake(10, HEIGHT + 120, 300, 50);
    [accessLable setBackgroundColor:[UIColor clearColor]];
    accessLable.text = @"域名访问检查";
    accessLable.textColor = [UIColor grayColor];
    accessLable.textAlignment = 0;
    [backView addSubview:accessView];
    [backView addSubview:accessLable];
    [accessLable release];
    [accessView release];
    
    UIImageView *remindView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"test_graybutton.png"]];
    UILabel *remindLable = [[UILabel alloc] initWithFrame:CGRectMake(30, HEIGHT + 180, 300, 50)];
    remindView.frame = CGRectMake(10, HEIGHT + 180, 300, 50);
    [remindLable setBackgroundColor:[UIColor clearColor]];
    remindLable.text = @"未注册域名提醒";
    remindLable.textColor = [UIColor grayColor];
    remindLable.textAlignment = 0;
    [backView addSubview:remindView];
    [backView addSubview:remindLable];
    [remindLable release];
    [remindView release];
}
-(void)initSearchBefore
{
    backView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 80, 320, 430)];
    [backView setImage:[UIImage imageNamed:@"test_ground.png"]];
    backView.userInteractionEnabled = YES;
    [self.view addSubview:backView];
    
    UIImageView *checkView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"test_graybutton.png"]];
    UILabel *statusLable = [[UILabel alloc] initWithFrame:CGRectMake(30, HEIGHT, 300, 50)];
    [checkView setFrame:CGRectMake(10, HEIGHT, 300, 50)];
    [statusLable setBackgroundColor:[UIColor clearColor]];
    statusLable.text = @"域名状态检查";
    statusLable.textColor = [UIColor grayColor];
    statusLable.textAlignment = 0;
    [backView addSubview:checkView];
    [backView addSubview:statusLable];
    [statusLable release];
    [checkView release];
    
    UIImageView *DNSView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"test_graybutton.png"]];
    UILabel *DNSLable = [[UILabel alloc] initWithFrame:CGRectMake(30, HEIGHT + 60, 300, 50)];
    DNSView.frame = CGRectMake(10, HEIGHT + 60, 300, 50);
    [DNSLable setBackgroundColor:[UIColor clearColor]];
    DNSLable.text = @"域名DNS检查";
    DNSLable.textColor = [UIColor grayColor];
    DNSLable.textAlignment = 0;
    [backView addSubview:DNSView];
    [backView addSubview:DNSLable];
    [DNSLable release];
    [DNSView release];
    
    UIImageView *accessView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"test_graybutton.png"]];
    UILabel *accessLable = [[UILabel alloc] initWithFrame:CGRectMake(30, HEIGHT + 120, 300, 50)];
    accessView.frame = CGRectMake(10, HEIGHT + 120, 300, 50);
    [accessLable setBackgroundColor:[UIColor clearColor]];
    accessLable.text = @"域名访问检查";
    accessLable.textColor = [UIColor grayColor];
    accessLable.textAlignment = 0;
    [backView addSubview:accessView];
    [backView addSubview:accessLable];
    [accessLable release];
    [accessView release];
    
    UIImageView *remindView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"test_graybutton.png"]];
    UILabel *remindLable = [[UILabel alloc] initWithFrame:CGRectMake(30, HEIGHT + 180, 300, 50)];
    remindView.frame = CGRectMake(10, HEIGHT + 180, 300, 50);
    [remindLable setBackgroundColor:[UIColor clearColor]];
    remindLable.text = @"未注册域名提醒";
    remindLable.textColor = [UIColor grayColor];
    remindLable.textAlignment = 0;
    [backView addSubview:remindView];
    [backView addSubview:remindLable];
    [remindLable release];
    [remindView release];
}
-(void)initInterface
{
    UIImageView *textView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 40, 320, 40)];
    [textView setImage:[UIImage imageNamed:@"test_seachback.png"]];
    [self.view addSubview:textView];
    [textView release];
    
    aTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 45, 260, 30)];
    aTextField.contentVerticalAlignment = UIControlContentHorizontalAlignmentCenter;
    [aTextField setBorderStyle:UITextBorderStyleRoundedRect];
    aTextField.placeholder = @"example:net.cn";
//    [aTextField setBorderStyle:UIKeyboardTypeEmailAddress];
    aTextField.text = nil;
    aTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:aTextField];
    aTextField.delegate = self;
    
    UIButton *btu = [UIButton buttonWithType:UIButtonTypeCustom];
    btu.frame = CGRectMake(285, 45, 30, 30);
    [btu setImage:[UIImage imageNamed:@"test_seach.png"] forState:UIControlStateNormal];
    [self.view addSubview:btu];
    [btu addTarget:self action:@selector(sendRequestWhois) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    UIImageView *backImage = [[UIImageView alloc] initWithFrame:CGRectMake(60, 60, 200, 200)];
    [backImage setImage:[UIImage imageNamed:@"backimage_one.png"]];
    backImage.userInteractionEnabled = YES;
    [backView addSubview:backImage];
    [backImage release];
}

#pragma mark - TextField Delegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSLog(@"textField delegate");
    [self.view addSubview:tableViewCom];
    [tableViewCom reloadData];
    return YES;
}

#pragma mark - TableView Delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"arrayCom count = %d",[arrayCom count]);
    return [arrayCom count];
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIndentifier = @"Cell";
    cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if(cell == nil) {
        cell = [[[InformationCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIndentifier] autorelease];
    }
 
    NSLog(@"text = %@",aTextField.text);
    cell.textLabel.text = [aTextField.text stringByAppendingString:[arrayCom objectAtIndex:indexPath.row]];
    [cellArray insertObject:cell.textLabel.text atIndex:indexPath.row];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    aTextField.text = nil;
    aTextField.text = [cellArray objectAtIndex:indexPath.row];
    NSLog(@"cellarray = %@",cellArray);
    NSLog(@"cellarray count = %d",[cellArray count]);
    [aTextField resignFirstResponder];
    [tableViewCom removeFromSuperview];
    [self sendRequestWhois];
}
-(NSArray*)stringToArray:(NSString*)string
{
    array =[[NSArray alloc]init];
    NSLog(@"string = %@",string);
    if(string.length!=0)
    {
        array=[string componentsSeparatedByString:@","];
    }
    NSLog(@"array = %@\tarray count = %d",array,[array count]);
    return array;
}
-(void)webInvalid
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"您输入的域名不正确!" message:@"例如:taobao.com/淘宝.com" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alert show];
    [alert release];
}

#pragma mark - 请求接口
-(void)sendRequestWhois
{
//    NSLog(@"cell字符串 = %@",aTextField.text);
//    NSString *email = @"iMilo@163.com";
//    NSString *regex = @"\\b([a-zA-Z0-9%_.+\\-]+)@([a-zA-Z0-9.\\-]+?\\.[a-zA-Z]{2,6})\\b";
//    if ([email isMatchedByRegex:regex])
//    {
//        NSLog(@"通过校验！");
//    }
//    else
//    {
//        NSLog(@"未通过校验，数据格式有误，请检查！");
//    }
//    BOOL bl = [aTextField.text isMatchedByRegex:@"^[0-9]*[a-zA-Z]*$"];
//    if(bl)
//    {
//        NSLog(@"123456");
//        [self webInvalid];
//    } else
//    {
    
    whoisBL = YES;
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:aTextField.text,@"domainname", nil];
//    NSDictionary *dic = [NSDictionary dictionaryWithObject:aTextField.text forKey:@"domainname"];
    
    [message resquestMessageandStringUrl:dic andMethod:@"whois" andApi:@"http://hiapp.hichina.com:8080/hiapp/json/whois/"];
}
-(void)sendRequestAccess
{
    accessBL = YES;
//    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:aTextField.text,@"domainname", nil];
    NSDictionary *dic = [NSDictionary dictionaryWithObject:aTextField.text forKey:@"domainname"];
    [message resquestMessageandStringUrl:dic andMethod:@"wwwrecord" andApi:@"http://hiapp.hichina.com:8080/hiapp/json/wwwrecord/"];
}
-(void)sendRequestRegister
{
    registerBL = YES;
//    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:aTextField.text,@"domainname", nil];
    NSDictionary *dic = [NSDictionary dictionaryWithObject:aTextField.text forKey:@"domainname"];
    [message resquestMessageandStringUrl:dic andMethod:@"noDomainName" andApi:@"http://hiapp.hichina.com:8080/hiapp/json/noDomainName/"];
}
-(void)detailedInformation
{
    [backView removeFromSuperview];
    domainstatus=[[NSString alloc]init];
    domainstatus = [[whoisDic objectForKey:@"whois"] objectForKey:@"domainstatus"];
    dnsserver = [[whoisDic objectForKey:@"whois"] objectForKey:@"dnsserver"];
    NSLog(@"domainstatus = %@",domainstatus);
    if(domainstatus.length == 0)
    {
        NSLog(@"1");
        [self initSearchLaterAndNoRegistered];
        
    }
    else {
        NSLog(@"2");
        [self initSearchLaterHasRegistered];
        statusLableShow.text = @"正常";
        [self sendRequestAccess];
    }
    if(dnsserver.length != 0)
    {
        DNSLableShow.text = @"正常";
    } else {
        DNSLableShow.text = @"异常";
    }
    
}
-(void)accessDeletailedInformation
{
    accessArr = [[NSArray alloc] init];
    int recode = [[accessDic objectForKey:@"recode"] intValue];
    int wwwstatus = [[accessDic objectForKey:@"wwwstatus"] intValue];
    NSLog(@"wwwstatus = %d",wwwstatus);
    if(recode == 0)
    {
        accessArr = [accessDic objectForKey:@"infos"];
        NSLog(@"######accessarray = %@",accessArr);
    }
    if(wwwstatus == 1)
    {
        accessLableShow.text = @"正常";
    } else {
        accessLableShow.text = @"异常";
    }
    [self sendRequestRegister];
}
-(void)registerDetailedInformation
{
    notdomain = [[registerDic objectForKey:@"notdomain"] retain];
    registerArr = [[NSArray alloc] init];
    registerArr = [self stringToArray:notdomain];
    NSLog(@"register arr = = %@",registerArr);
    NSLog(@"notdomain = %@",notdomain);
//    if([registerArr count] == 0)
    if(notdomain.length == 0)
    {
        remindLableShow.text = @"无未注册域名";
    } else {
        int value = [registerArr count];
        remindLableShow.text = [NSString stringWithFormat:@"%d个未注册域名",value];
    }
}
-(void)haveMessage
{
    
    NSLog(@"$$$$$$$$$$$$%@",message.messageDic);
    if(whoisBL)
    {
        whoisDic = message.messageDic;
        whoisBL = NO;
        [self detailedInformation];
    } else if(accessBL) {
        accessDic = message.messageDic;
        accessBL = NO;
        NSLog(@"accessDic = %@",accessDic);
        [self accessDeletailedInformation];
    } else if(registerBL) {
        registerDic = message.messageDic;
        registerBL = NO;
        [self registerDetailedInformation];
        NSLog(@"registerDic = %@",registerDic);
    }
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
//    [self sendRequestWhois];
    
    self.navigationController.navigationBar.hidden=YES;
    UIImageView *topView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 40)];
    topView.userInteractionEnabled=YES;
    [topView setImage:[UIImage imageNamed:@"top.png"]];
    [self.view addSubview:topView];
   
    UILabel *titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(105, 5, 100, 30)];
    titleLabel.textAlignment=UITextAlignmentCenter;
    titleLabel.backgroundColor=[UIColor clearColor];
    titleLabel.textColor=[UIColor whiteColor];
    titleLabel.text=@"域名体检";
    [topView addSubview:titleLabel];
    
    UIButton *backBut=[[UIButton alloc]initWithFrame:CGRectMake(5, 5, 50, 30)];
    [backBut setBackgroundImage:[UIImage imageNamed:@"返回按钮.png"] forState:UIControlStateNormal];
    [backBut setTitle:@"主页" forState:UIControlStateNormal];
    backBut.titleLabel.font=[UIFont systemFontOfSize:12.0f];
    [backBut addTarget:self action:@selector(backhome) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:backBut];
    
    arrayCom = [[NSArray arrayWithObjects:@".com",@".cn",@".mobi",@".co",@".net",@".com.cn",@".net.cn",@".so",@".org",@"gov.cn",@"org.cn",@".tel",@".tv",@".biz",@".cc",@".hk",@".name",@".info",@".asia",@".me", nil] retain];
    cellArray = [[NSMutableArray alloc] init];
    
    tableViewCom = [[UITableView alloc] initWithFrame:CGRectMake(0, 80, 320, 400) style:UITableViewStylePlain];
    tableViewCom.delegate = self;
    tableViewCom.dataSource = self;
    
    HEIGHT = 20;
    [self initInterface];
    [self initSearchBefore];
//    [self initSearchLaterAndNoRegistered];
//    [self initSearchLaterHasRegistered];
    message = [[BodyMessage alloc] init];
    message.delegate = self;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}





-(void)backhome
{
    
    [self dismissModalViewControllerAnimated:YES];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
