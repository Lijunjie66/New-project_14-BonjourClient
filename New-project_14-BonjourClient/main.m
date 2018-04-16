//
//  main.m
//  New-project_14-BonjourClient
//
//  Created by Geraint on 2018/4/16.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "BonjourClient.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        
        // 获取当前的运行循环，查看信息
        NSRunLoop *loop = [NSRunLoop currentRunLoop];
        
        // 创建一个浏览器客户端，并将其服务浏览器实例添加到当前的运行循环中
        BonjourClient *client = [[BonjourClient alloc] init];
        
        // 查找指定的服务类型
        [client.serviceBrowser searchForServicesOfType:@"_ipp._tcp" inDomain:@"local."];
        
        // 一直循环，知道服务浏览器停止
        while (!client.finishedLoading && [loop runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]]);
        
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
