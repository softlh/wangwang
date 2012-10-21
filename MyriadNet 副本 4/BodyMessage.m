//
//  BodyMessage.m
//  MyriadNet
//
//  Created by Ibokan on 12-10-19.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import "BodyMessage.h"
#import "JSON.h"

@implementation BodyMessage
@synthesize messageDic =_messageDic,delegate;
-(void)dealloc
{
    [resultData release],resultData = nil;
    [resultConnection release],resultConnection = nil;
    [_messageDic release],_messageDic = nil;
    [super dealloc];
}
//urlstring为传进来的用户输入网址
-(void)resquestMessageandStringUrl:(NSDictionary *)webAddress andMethod:(NSString *)metmessage andApi:(NSString *)api
{
    //手机号加随机数
    NSString *phoneNumber=@"0169d2c595f9c3b70b0ae13d0123fc67e94e71af";
    NSLog(@"%@",phoneNumber);
    NSString *strid=[NSString stringWithFormat:@"%@_%u",phoneNumber,arc4random()];
    NSLog(@"strid = %@",strid);
    //要查的网址
//    NSArray *domainArray=[NSArray arrayWithObjects:urlstring, nil];
//    NSDictionary *webAddress=[NSDictionary dictionaryWithObjectsAndKeys:urlstring,@"domainname",nil];
    
    NSDictionary *dic1=[NSDictionary dictionaryWithObjectsAndKeys:@"1.0",@"v",
                        metmessage,@"method",
                        @"ios",@"client",strid,@"trid",webAddress,@"data", nil];
    
    NSString *finaStr=[dic1 JSONFragment];//转换成json格式
    
    //需要的接口
    NSString *apiAddress=api;
    NSURL *url=[NSURL URLWithString:apiAddress];
    NSMutableURLRequest *urlRequest=[[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    [urlRequest setHTTPMethod:@"POST"];
    [urlRequest setHTTPBody:[finaStr dataUsingEncoding:NSUTF8StringEncoding]];//传递参数，先转成utf8
    resultData=[[NSMutableData alloc]init];
    resultConnection=[[NSURLConnection alloc]initWithRequest:urlRequest delegate:self startImmediately:YES];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [resultData appendData:data];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString *str1=[[NSString alloc]initWithData:resultData encoding:NSUTF8StringEncoding];
    NSDictionary *dic1=[str1 JSONValue];
    _messageDic = [[NSDictionary alloc] init];
    self.messageDic = [dic1 objectForKey:@"results"];
    NSLog(@"字典 = %@",dic1);
    [str1 release];
    
   
     [self.delegate haveMessage];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"网络连接异常，重新加载......");
}



@end
