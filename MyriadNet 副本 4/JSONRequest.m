//
//  JSONRequest.m
//  MyriadNet
//
//  Created by Ibokan on 12-10-17.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import "JSONRequest.h"
#import "JSON.h"
@implementation JSONRequest

-(void)dealloc
{
    [resultMtuData release], resultMtuData = nil;
    [super dealloc];
}

-(void)requestURLinformation:(NSString*)urlString andRequest:(NSData*)data
{
    NSURL *url = [NSURL URLWithString:urlString];
    urlRequest = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    [urlRequest setHTTPMethod:@"POST"];
    [urlRequest setHTTPBody:data];
    resultMtuData = [[NSMutableData alloc] init];
    [NSURLConnection connectionWithRequest:urlRequest delegate:self];
    NSLog(@"request url information");
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [resultMtuData appendData:data];
    NSLog(@"result mutable data = %@",resultMtuData);
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString *string = [[NSString alloc] initWithData:resultMtuData encoding:NSUTF8StringEncoding];
    NSDictionary *dictionary = [string JSONValue];
    NSLog(@"dictionary = %@",dictionary);
//    dictionary objectForKey:@""
    [string release];
    
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"网络连接异常，重新加载......");
    [NSURLConnection connectionWithRequest:urlRequest
                                  delegate:self];
}
@end
