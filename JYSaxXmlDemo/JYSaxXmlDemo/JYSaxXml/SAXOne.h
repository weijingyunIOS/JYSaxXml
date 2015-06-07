//
//  SAXOne.h
/*
 <videos>
 <video videoId="1">
 <name>01.C语言-语法预览</name>
 <length>320</length>
 <videoURL>/itcast/videos/01.C语言-语法预览.mp4</videoURL>
 <imageURL>/itcast/images/head1.png</imageURL>
 <desc>C语言-语法预览</desc>
 <teacher>大湿</teacher>
 </video>
 
 <video videoId="2">
 <name>02.C语言-第一个C程序</name>
 <length>2708</length>
 <videoURL>/itcast/videos/02.C语言-第一个C程序.mp4</videoURL>
 <imageURL>/itcast/images/head2.png</imageURL>
 <desc>C语言-第一个C程序</desc>
 <teacher>大湿</teacher>
 </video>
 
 
 <videos>
 
 */

#import <Foundation/Foundation.h>


@interface SAXOne : NSObject

/**
 *  解析 数组包含字典的 Xml  调用时让该方法在后台线程执行
 *
 *  @param data     xml 二进制数
 *  @param finished 解析完成后回传 解析好的数组
 */
+ (void)saxOneparserWithdata:(NSData *)data videosDic : (NSDictionary*)videosDic finished:(void (^)(NSArray *dataList))finished;
@end
