//
//  SAXOther.h
//  JYSaxXmlDemo
//
//  Created by wei_jingyun on 15/6/7.
//  Copyright (c) 2015年 wei_jingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SAXOther : NSObject

+ (void)saxOtherparserWithdata:(NSData *)data videosDic : (NSDictionary*)videosDic finished:(void (^)(NSArray *dataList))finished;



@end
