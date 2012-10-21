//
//  BodyMessage.h
//  MyriadNet
//
//  Created by Ibokan on 12-10-19.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MessageSend.h"

@interface BodyMessage : NSObject<NSURLConnectionDataDelegate>
{
    NSMutableData *resultData;
    NSURLConnection *resultConnection;//链接名
}

@property (nonatomic,retain) NSDictionary *messageDic;

@property(nonatomic,assign)id<messagesend>delegate;


-(void)resquestMessageandStringUrl:(NSDictionary *)webAddress andMethod:(NSString *)metmessage andApi:(NSString *)api;

@end
