封装了 Sax 解析 Xml 可以满足部分xml 解析，后期会根据遇到的情况继续添加
本例使用的xml文件都放在了xml 下。我使用配置的Apache服务器。转换后的模型我并没有打印输出，大家可以设置断点查看转换情况。

导入头文件 #import "JYSaxXml.h"


1. 解析如下xml

![xml1](http://images.cnblogs.com/cnblogs_com/weijingyun/698861/o_Snip20150608_3.png)

(1)建立模型video 按 标签节点 添加模型属性


(2) 代码
   // 重要  JYmainClassNode 表示选取的根节点内的数据转为模型
   //  @"video" :[Video class] 表示节点 @"video" 对应的模型类为 Video
   
   
        NSDictionary *dic = @{JYmainClassNode : @"video" , @"video" :[Video class] };
        [dic saxOneparserWithdata:data finished:^(NSArray *dataList) {
            // 将返回的 模型数组 传回来
             self.dataList =dataList ;
        }];




2.解析如下Xml 属性 全在标签的属性列表

![xml1](http://images.cnblogs.com/cnblogs_com/weijingyun/698861/o_Snip20150608_4.png)

(1)建立模型CityWeather 按 标签节点 添加模型属性


(2) 代码
   // 重要  JYmainClassNode 表示选取的根节点内的数据转为模型
   //   @"city" : [CityWeather class] 表示节点 @"city" 对应的模型类为 CityWeather
   
      NSDictionary *dic = @{JYmainClassNode : @"city" , @"city" : [CityWeather class] };

        [dic saxOtherparserWithdata:data finished:^(NSArray *dataList) {
            self.dataList = dataList;
            
        }];
        






3.解析软下xml 属性 全在标签的属性列表 但是属性里面 又包含了数组
![xml1](http://images.cnblogs.com/cnblogs_com/weijingyun/698861/o_Snip20150608_5.png)


(1)建立 根模型 CityDescribe   子模型 CityWeather  与   Hehe

(2) 代码
   // 重要  JYmainClassNode 表示选取的节点为根节点 根节点对应根模型
   //   @"chakan" : [CityDescribe class] , @"city" :[CityWeather class] , @"hehe" : [Hehe class] 节点与模型一一对应
   
       NSDictionary *dic = @{JYmainClassNode : @"chakan" , @"chakan" : [CityDescribe class] , @"city" :[CityWeather class] , @"hehe" : [Hehe class]};
        
        [dic saxOtherparserWithdata:data finished:^(NSArray *dataList) {
            // 主线程回调
            self.dataList = dataList;
        }];
        
