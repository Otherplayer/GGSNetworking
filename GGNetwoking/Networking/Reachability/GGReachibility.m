//
//  GGReachibility.m
//  GGNetwoking
//
//  Created by __无邪_ on 15/10/4.
//  Copyright © 2015年 __无邪_. All rights reserved.
//

#import "GGReachibility.h"
#define REMOTEHOSTNAME @"www.baidu.com"
#define REMOTEHOSTFULLYNAME @"http://www.baidu.com"

@implementation GGReachibility

+ (GGReachibility *)sharedInstance{
    static GGReachibility *reachability = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        reachability = [[GGReachibility alloc] init];
    });
    return reachability;
}


- (void)startMonitoringInternetStates{
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        BOOL isCan = NO;
        BOOL isCanWifi = NO;
        switch (status) {
            case AFNetworkReachabilityStatusNotReachable:
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:{
                isCan = YES;
                isCanWifi = NO;
            }
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:{
                isCan = YES;
                isCanWifi = YES;
            }
                break;
            default:
                break;
        }
        
        self.isReachable = isCan;
        self.isReachableWifi = isCanWifi;
        
//        [[NSNotificationCenter defaultCenter] postNotificationName:@"HYQNET" object:@(status)];
        
        NSLog(@"【Reachability: %@】", AFStringFromNetworkReachabilityStatus(status));
    }];
    
}

@end
