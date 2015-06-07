//
//  NSObject+JYSaxOne.m
//  05 -  SAX 解析 git分支管理
//
//  Created by wei_jingyun on 15/6/7.
//  Copyright (c) 2015年 wei_jingyun. All rights reserved.
//

#import "NSObject+JYSaxOne.h"
#import "SAXOne.h"

@implementation NSObject (JYSaxOne)

+ (void)saxparserWithdata:(NSData *)data videosDic : (NSDictionary*)videosDic finished:(void (^)(NSArray *dataList))finished{

    [SAXOne saxparserWithdata:data videosDic:videosDic modelClass:[self class] finished:finished];
}

@end
