//
//  SAXOne.m
//  05 -  SAX 解析 git分支管理
//
//  Created by wei_jingyun on 15/6/7.
//  Copyright (c) 2015年 wei_jingyun. All rights reserved.
//

#import "SAXOne.h"
#import "JYSaxConst.h"

@interface SAXOne ()<NSXMLParserDelegate>

/// 目标数组
@property (nonatomic, strong) NSMutableArray *videos;

/// 当前拼接的字符串
@property (nonatomic, strong) NSMutableString *elementString;

// 记录回调block
@property (nonatomic, copy) void (^finishedBlock)(NSArray *);

// 节点
@property (strong , nonatomic) NSDictionary *videosDic;

/// 当前正在解析的模型
@property (nonatomic, strong) id currentVideo;

// 记录第一个节点
@property (copy , nonatomic) NSString *fistCode ;





@end


@implementation SAXOne

+ (void)saxOneparserWithdata:(NSData *)data videosDic : (NSDictionary*)videosDic finished:(void (^)(NSArray *))finished  {
    
    NSAssert(finished != nil, @"必须传入回调");
    
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
    
    SAXOne *sax = [[SAXOne alloc] init];
    
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
    
    // 判断字典key 值是否有该节点
    if ([[ self.videosDic allKeys] indexOfObject:elementName] < 1000 ) {
        
        self.currentVideo = [[self.videosDic[elementName] alloc] init];
        
       // <video videoId="1"> 设置描述数据
        [self.currentVideo setValuesForKeysWithDictionary:attributeDict];
        
    } else if (self.fistCode == nil){
       self.fistCode = elementName ;
    }
    
    // 清空缓存的拼接字符串
    [self.elementString setString:@""] ;
    
    
}

/**
 *  3. 发现文字 － 一个节点内容，方法会执行多次 所以需要拼接
 *  @param string 当前发现的字符串
 */
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    // 拼接文字
    [self.elementString appendString:string];
}

// 4. 结束节点，elementName 没有 /
- (void)parser:(NSXMLParser *)parser
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName {
    
        
    if ([[ self.videosDic allKeys] indexOfObject:elementName] < 1000  ) {
        
        [self.videos addObject:self.currentVideo];
        
    } else  if (![elementName isEqual:self.fistCode]) {
    
        // 使用KVC给模型传值
        [self.currentVideo setValue:self.elementString forKey:elementName];
    
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

- (NSMutableString *)elementString
{
    if (!_elementString) {
        _elementString = [[NSMutableString alloc] init];
    }
    
    return _elementString ;
}

@end
