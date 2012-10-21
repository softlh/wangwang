//
//  detailedInformation.m
//  MyriadNet
//
//  Created by Ibokan on 12-10-17.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import "detailedInformation.h"
#import "InformationCell.h"
@interface detailedInformation ()

@end

@implementation detailedInformation
@synthesize contentString = _contentString;
@synthesize detailArray = _detailArray;
@synthesize whichInf = _whichInf;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)initTableView
{
    aTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 40, 320, 420) style:UITableViewStylePlain];
    [aTableView setBackgroundColor:[UIColor clearColor]];
    aTableView.delegate = self;
    aTableView.dataSource = self;
    [self.view addSubview:aTableView];
    
}

-(void)back
{
    [self dismissModalViewControllerAnimated:YES];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.navigationController.navigationBar.hidden=YES;
    UIImageView *topView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 40)];
    topView.userInteractionEnabled=YES;
    [topView setImage:[UIImage imageNamed:@"top.png"]];
    [self.view addSubview:topView];
    
    UILabel *titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(105, 5, 100, 30)];
    titleLabel.textAlignment=UITextAlignmentCenter;
    titleLabel.backgroundColor=[UIColor clearColor];
    titleLabel.textColor=[UIColor whiteColor];
    titleLabel.text=@"详细信息";
    [topView addSubview:titleLabel];
    
    UIButton *backBut=[[UIButton alloc]initWithFrame:CGRectMake(5, 5, 50, 30)];
    [backBut setBackgroundImage:[UIImage imageNamed:@"返回按钮.png"] forState:UIControlStateNormal];
    [backBut setTitle:@"返回" forState:UIControlStateNormal];
    backBut.titleLabel.font=[UIFont systemFontOfSize:12.0f];
    [backBut addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:backBut];

    UIImageView *backImage = [[UIImageView alloc] initWithFrame:CGRectMake(60, 120, 200, 200)];
    [backImage setImage:[UIImage imageNamed:@"backimage_one.png"]];
    backImage.userInteractionEnabled = YES;
    [self.view addSubview:backImage];
    [backImage release];
    
    NSLog(@"detailArray = %@",self.detailArray);
    
    [self initTableView];
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    
    return self.contentString;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if(self.whichInf == 2)
    {
        return 2;
    } else
    {
        return 1;
    }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"detail array count = %d",[self.detailArray count]);
    if(self.whichInf == 2)
    {
        return [self.detailArray count] * 4;
    } else
    {
        return [self.detailArray count];
    }
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIndentifier = @"Cell";
    cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if(cell == nil) {
        cell = [[[InformationCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIndentifier] autorelease];
    }
    
    switch (_whichInf) {
        case 1:
            cell.textLabel.text = [self.detailArray objectAtIndex:indexPath.row];
            break;
        case 2:
            {
                NSDictionary *dic1 = [self.detailArray objectAtIndex:0];
                switch(indexPath.row) {
                    case 0:
                        cell.textLabel.text = [NSString stringWithFormat:@"网站IP      %@",[dic1 objectForKey:@"wppip"]];
                        break;
                    case 1:
                        cell.textLabel.text = [NSString stringWithFormat:@"服务器归属地  %@",[dic1 objectForKey:@"server"]];
                        break;
                    case 2:
                        cell.textLabel.text = [NSString stringWithFormat:@"状态        %@",[dic1 objectForKey:@"status"]];
                        break;
                    case 3:
                        cell.textLabel.text = [NSString stringWithFormat:@"总时间       %@",[dic1 objectForKey:@"total_time"]];
                        break;
                    case 4:
                        cell.textLabel.text = [NSString stringWithFormat:@"解析时间      %@",[dic1 objectForKey:@"resolve_time"]];
                        break;
                    case 5:
                        cell.textLabel.text = [NSString stringWithFormat:@"连接时间      %@",[dic1 objectForKey:@"connect_time"]];
                        break;
                    case 6:
                        cell.textLabel.text = [NSString stringWithFormat:@"下载数据      %@",[dic1 objectForKey:@"down_data"]];
                        break;
                    case 7:
                        cell.textLabel.text = [NSString stringWithFormat:@"下载速度      %@",[dic1 objectForKey:@"down_speed"]];
                        break;
                }
                NSDictionary *dic2 = [self.detailArray objectAtIndex:1];
                switch(indexPath.row) {
                    case 0:
                        cell.textLabel.text = [NSString stringWithFormat:@"网站IP      %@",[dic2 objectForKey:@"wppip"]];
                        break;
                    case 1:
                        cell.textLabel.text = [NSString stringWithFormat:@"服务器归属地  %@",[dic2 objectForKey:@"server"]];
                        break;
                    case 2:
                        cell.textLabel.text = [NSString stringWithFormat:@"状态        %@",[dic2 objectForKey:@"status"]];
                        break;
                    case 3:
                        cell.textLabel.text = [NSString stringWithFormat:@"总时间       %@",[dic2 objectForKey:@"total_time"]];
                        break;
                    case 4:
                        cell.textLabel.text = [NSString stringWithFormat:@"解析时间      %@",[dic2 objectForKey:@"resolve_time"]];
                        break;
                    case 5:
                        cell.textLabel.text = [NSString stringWithFormat:@"连接时间      %@",[dic2 objectForKey:@"connect_time"]];
                        break;
                    case 6:
                        cell.textLabel.text = [NSString stringWithFormat:@"下载数据      %@",[dic2 objectForKey:@"down_data"]];
                        break;
                    case 7:
                        cell.textLabel.text = [NSString stringWithFormat:@"下载速度      %@",[dic2 objectForKey:@"down_speed"]];
                        break;
                }
            }
            break;
        case 3:
            cell.textLabel.text = [self.detailArray objectAtIndex:indexPath.row];
            break;
        default:
            break;
    }
    

    return cell;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
