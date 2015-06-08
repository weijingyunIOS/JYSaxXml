//
//  ViewController.m
//  JYSaxXmlDemo
//
//  Created by wei_jingyun on 15/6/7.
//  Copyright (c) 2015年 wei_jingyun. All rights reserved.
//

#import "ViewController.h"
#import "JYSaxXml.h"
#import "Video.h"
#import "CityWeather.h"
#import "CityDescribe.h"
#import "Hehe.h"


@interface ViewController ()

/// 表格绑定的数据
@property (nonatomic, strong) NSArray *dataList;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData3];
}




- (void)loadData3 {
    
    [self loadURL:@"http://127.0.0.1/beijing%202.xml" completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        // 3. 解析器开始解析 - 后续的解析工作全部由代理完成
        
        NSDictionary *dic = @{JYmainClassNode : @"chakan" , @"chakan" : [CityDescribe class] , @"city" :[CityWeather class] , @"hehe" : [Hehe class]};
        
        [dic saxOtherparserWithdata:data finished:^(NSArray *dataList) {
            // 主线程回调
            self.dataList = dataList;
            
        }];

        
    }];
}

- (void)loadData2 {
    
    [self loadURL:@"http://192.168.1.106/beijing.xml" completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        // 3. 解析器开始解析
        NSDictionary *dic = @{JYmainClassNode : @"city" , @"city" : [CityWeather class] };

        [dic saxOtherparserWithdata:data finished:^(NSArray *dataList) {
            self.dataList = dataList;
            
        }];
        
    }];
    
}


- (void)loadData1 {
       // http://flash.weather.com.cn/wmaps/xml/beijing.xml
    
    [self loadURL:@"http://192.168.1.106/videos.xml" completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        
        // 3. 解析器开始解析 - 后续的解析工作全部由代理完成
        
        // 重要
        NSDictionary *dic = @{JYmainClassNode : @"video" , @"video" :[Video class] };
        
        [dic saxOneparserWithdata:data finished:^(NSArray *dataList) {
            // 将返回的 模型数组 传回来
             self.dataList =dataList ;
            
        }];
        
        
    }];
  
}


- (void)loadURL : (NSString*)urlString completionHandler:(void (^)(NSURLResponse* response, NSData* data, NSError* connectionError)) handler {

    NSURL *url = [NSURL URLWithString:urlString];
    
    // 不缓存
    NSURLRequest *request =
    [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:15];
    
    [NSURLConnection
     sendAsynchronousRequest:request
     queue:[[NSOperationQueue alloc] init]
     completionHandler:^(NSURLResponse *response, NSData *data,
                         NSError *connectionError) {
         
         if (connectionError != nil || data == nil) {
             NSLog(@"网路故障");
             return;
         }
    
         handler(response , data , connectionError);
     }];

}





@end
