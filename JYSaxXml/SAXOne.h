//
//  SAXOne.h
//  05 -  SAX 解析 git分支管理
//
//  Created by wei_jingyun on 15/6/7.
//  Copyright (c) 2015年 wei_jingyun. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SAXOne : NSObject

/**
 *  解析 数组包含字典的 Xml  调用时让该方法在后台线程执行
 *
 *  @param data     xml 二进制数
 *  @param finished 解析完成后回传 解析好的数组
 */
+ (void)saxparserWithdata:(NSData *)data videosDic : (NSDictionary*)videosDic modelClass : (Class) modelClass finished:(void (^)(NSArray *dataList))finished;
@end
