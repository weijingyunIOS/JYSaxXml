//
//  NSString+SEL.m
//  JYSaxXmlDemo
//
//  Created by wei_jingyun on 15/6/7.
//  Copyright (c) 2015年 wei_jingyun. All rights reserved.
//

#import "NSString+SEL.h"

@implementation NSString (SEL)

- (SEL) getSetterWay {

    [self capitalizedString];
    
    NSString *str = [NSString stringWithFormat:@"set%@:" ,[self capitalizedString] ];
    
    return NSSelectorFromString(str);

}


@end
