//
//  NSObject+JYSaxOne.h
//  05 -  SAX 解析 git分支管理
//
//  Created by wei_jingyun on 15/6/7.
//  Copyright (c) 2015年 wei_jingyun. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSObject (JYSaxOne)

+ (void)saxparserWithdata:(NSData *)data videosDic : (NSDictionary*)videosDic finished:(void (^)(NSArray *dataList))finished;


@end
