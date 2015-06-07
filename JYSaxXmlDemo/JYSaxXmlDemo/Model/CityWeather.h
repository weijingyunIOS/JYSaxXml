//
//  CityWeather.h
//  JYSaxXmlDemo
//
//  Created by wei_jingyun on 15/6/7.
//  Copyright (c) 2015年 wei_jingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CityWeather : NSObject

// <city cityX="232" cityY="190.8" cityname="延庆" centername="延庆" fontColor="FFFFFF"/>

@property (copy , nonatomic) NSNumber *cityX ;
@property (copy , nonatomic) NSNumber *cityY ;

@property (copy , nonatomic) NSString *cityname ;
@property (copy , nonatomic) NSString *centername ;

@property (copy , nonatomic) NSString *fontColor ;




@end
