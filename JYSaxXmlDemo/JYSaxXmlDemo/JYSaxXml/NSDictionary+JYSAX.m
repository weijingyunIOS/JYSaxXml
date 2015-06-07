//
//  NSDictionary+JYSAX.m
//  JYSaxXmlDemo
//
//  Created by wei_jingyun on 15/6/7.
//  Copyright (c) 2015年 wei_jingyun. All rights reserved.
//

#import "NSDictionary+JYSAX.h"
#import "SAXOther.h"
#import "SAXOne.h"

@implementation NSDictionary (JYSAX)


- (void)saxOtherparserWithdata:(NSData *)data finished:(void (^)(NSArray *))finished{

    [SAXOther saxOtherparserWithdata:data videosDic:self finished:finished];
}

- (void)saxOneparserWithdata:(NSData *)data  finished:(void (^)(NSArray *dataList))finished{

    [SAXOne saxOneparserWithdata:data videosDic:self finished:finished];
}

@end
