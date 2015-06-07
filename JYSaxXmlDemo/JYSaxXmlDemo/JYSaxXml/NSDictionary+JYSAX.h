//
//  NSDictionary+JYSAX.h
//  JYSaxXmlDemo
//
//  Created by wei_jingyun on 15/6/7.
//  Copyright (c) 2015年 wei_jingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (JYSAX)


- (void)saxOtherparserWithdata:(NSData *)data finished:(void (^)(NSArray *dataList))finished;

- (void)saxOneparserWithdata:(NSData *)data  finished:(void (^)(NSArray *dataList))finished;

@end
