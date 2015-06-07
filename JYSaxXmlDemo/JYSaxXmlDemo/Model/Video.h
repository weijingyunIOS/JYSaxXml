//
//  Video.h
//  05 -  SAX 解析 git分支管理
//
//  Created by wei_jingyun on 15/6/7.
//  Copyright (c) 2015年 wei_jingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Video : NSObject

// strong 在设置数值的时候，引用计数＋1
// copy 属性，在设置数值的时候，如果有一方是可变的，会copy一个不可变的副本，在setter方法中执行的

///  视频代号
@property (nonatomic, copy) NSNumber *videoId;
///  视频名称
@property (nonatomic, copy) NSString *name;
///  视频长度
@property (nonatomic, copy) NSNumber *length;
///  视频URL
@property (nonatomic, copy) NSString *videoURL;
///  图像URL
@property (nonatomic, copy) NSString *imageURL;
///  介绍
@property (nonatomic, copy) NSString *desc;
///  讲师
@property (nonatomic, copy) NSString *teacher;


@end
