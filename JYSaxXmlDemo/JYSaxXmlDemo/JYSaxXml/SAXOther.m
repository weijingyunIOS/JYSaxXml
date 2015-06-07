//
//  SAXOther.m
//  JYSaxXmlDemo
//
//  Created by wei_jingyun on 15/6/7.
//  Copyright (c) 2015年 wei_jingyun. All rights reserved.
//

#import "SAXOther.h"
#import "JYSaxConst.h"
#import "NSString+SEL.h"


@interface SAXOther ()<NSXMLParserDelegate>

/// 目标数组
@property (nonatomic, strong) NSMutableArray *videos;

// 记录回调block
@property (nonatomic, copy) void (^finishedBlock)(NSArray *);

// 节点
@property (strong , nonatomic) NSDictionary *videosDic;

/// 根模型
@property (nonatomic, strong) id currentVideo;

// 记录当前子节点 转换的模型 数组
@property (strong , nonatomic) NSDictionary *tempdic ;


@end


@implementation SAXOther


+ (void)saxOtherparserWithdata:(NSData *)data videosDic : (NSDictionary*)videosDic finished:(void (^)(NSArray *))finished  {
    
    NSAssert(finished != nil, @"必须传入回调");
    
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
    
    SAXOther *sax = [[SAXOther alloc] init];
    
    // 记录回调 block，要设置在前面！
    sax.finishedBlock = finished;
    
    // 传入节点
    sax.videosDic = videosDic ;
    
    // 指定解析器的代理
    parser.delegate = sax;
    
    // 解析器开始解析 － 是一个`同步`方法，会到所有的代理方法执行完成后，才会执行后续的语句
    [parser parse];
    
}





#pragma mark - <NSXMLParserDelegate>


// 1. 开始文档
- (void)parserDidStartDocument:(NSXMLParser *)parser {
    
    //    NSLog(@"%@" , [NSThread currentThread]);
    // 每次开始解析 先清空数组
    [self.videos removeAllObjects];
}

// 2/3/4 循环执行 开始节点 内容  结束

// 2. 开始节点 Element 元素，节点 内容及属性

- (void)parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName
    attributes:(NSDictionary *)attributeDict {

    // 根模型创建转换
    if ([elementName isEqual:self.videosDic[JYmainClassNode]]) {
        self.currentVideo = [[self.videosDic[elementName] alloc] init];
        [self.currentVideo setValuesForKeysWithDictionary:attributeDict];
        
    } else {
    // 遍历子模型 按对应类转换
        
        [[self.videosDic allKeys] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            if ([elementName isEqual:obj]) {
                
                id city = [[self.videosDic[obj] alloc] init];
                
                [city setValuesForKeysWithDictionary:attributeDict];
                
                // 加入对应obj  的数组内
                [self.tempdic[obj] addObject:city];
    
                *stop = YES ;
            }
        }];
    
    }
    
}


// 4. 结束节点，elementName 没有 /
- (void)parser:(NSXMLParser *)parser
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName {
    
    // 如果是根类模型就表示结束
    if ([elementName isEqual:self.videosDic[JYmainClassNode]]) {
        
        [self.currentVideo setValuesForKeysWithDictionary:self.tempdic];
        
        self.tempdic = nil;
        
        [self.videos addObject:self.currentVideo];
    }
    
}

// 5. 文档结束
- (void)parserDidEndDocument:(NSXMLParser *)parser {
    // 解析结束后操作
    dispatch_async(dispatch_get_main_queue(), ^{

        self.finishedBlock(self.videos.copy);
    });
    
}

//6 .报告不可恢复的解析错误
- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError{
    
    NSLog(@"报告不可解析错误 , 正确解析不会执行");
}



#pragma mark - 懒加载
- (NSMutableArray *)videos
{
    if (_videos == nil) {
        _videos = [NSMutableArray array];
    }
    return _videos;
}

- (NSDictionary *)tempdic
{
    if (_tempdic == nil) {
        
        NSMutableDictionary *dicM = [NSMutableDictionary dictionary];
      [[self.videosDic allKeys] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) { // 为每个key 加一个可变数组 记录key 对应的模型数据
          if (![obj isEqual:JYmainClassNode] && ![obj isEqual:self.videosDic[JYmainClassNode]]) {
              NSMutableArray *temparray = [NSMutableArray array];
              [dicM setValue:temparray forKey:obj];
          }
          _tempdic = dicM.copy;
      }];
    }
    return _tempdic ;
}

@end