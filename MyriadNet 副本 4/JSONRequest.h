//
//  JSONRequest.h
//  MyriadNet
//
//  Created by Ibokan on 12-10-17.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSONRequest : NSObject<NSURLConnectionDataDelegate,NSURLConnectionDelegate>
{
    NSMutableData *resultMtuData;
    NSMutableURLRequest *urlRequest;
}
-(void)requestURLinformation:(NSString*)urlString andRequest:(NSData*)data;
@end
