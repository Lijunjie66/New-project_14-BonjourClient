//
//  BonjourClient.h
//  New-project_14-BonjourClient
//
//  Created by Geraint on 2018/4/16.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import <Foundation/Foundation.h>

// 接口采用 NSNetServiceBrowserDelegate 协议，因此会通过异步方式从NSNetServiceBrowser实例加载数据
@interface BonjourClient : NSObject <NSNetServiceBrowserDelegate>

@property (retain) NSNetServiceBrowser *serviceBrowser;
@property BOOL finishedLoading; // 用于指明 NSNetServiceBrowser实例 完成加载的时间

@end
