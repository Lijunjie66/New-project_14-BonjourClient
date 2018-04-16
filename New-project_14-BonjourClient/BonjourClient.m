//
//  BonjourClient.m
//  New-project_14-BonjourClient
//
//  Created by Geraint on 2018/4/16.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import "BonjourClient.h"

@implementation BonjourClient

- (id) init {
    if (self = [super init]) {
        _finishedLoading = NO; // 表明实例还没有停止查找服务
        _serviceBrowser = [[NSNetServiceBrowser alloc] init];
        [_serviceBrowser setDelegate:self];
    }
    return self;
}

#pragma mark --
#pragma mark NSNetServiceBrowserDelegate methods

//  开始搜索
- (void) netServiceBrowserWillSearch:(NSNetServiceBrowser *)browser {
    NSLog(@"Beginning search");
}

// 当服务浏览器实例 找到 以注册的服务时，检查服务器是否正在等待其他服务。如果没有其他服务，浏览器会发送一句停止消息
- (void) netServiceBrowser:(NSNetServiceBrowser *)browser
             didFindDomain:(NSString *)domainString
                moreComing:(BOOL)moreComing {
    NSLog(@"Found service : %@",browser);
    if (!moreComing) {
        // 没有新的服务，停止搜索
        [self.serviceBrowser stop];
    }
}

// 当服务器实例停止搜索时，会输出一条消息，表示已经停止了
- (void) netServiceBrowserDidStopSearch:(NSNetServiceBrowser *)browser {
    // 停止搜索，将标记设置为退出运行循环
    NSLog(@"Stopped search");
    self.finishedLoading = YES;
}

@end
