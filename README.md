封装了 Sax 解析 Xml 可以满足部分xml 解析，后期会根据遇到的情况继续添加

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

(1)建立模型city 按 标签节点 添加模型属性
(2) 代码
   // 重要  JYmainClassNode 表示选取的根节点内的数据转为模型
   //   @"city" : [CityWeather class] 表示节点 @"city" 对应的模型类为 CityWeather
   
      NSDictionary *dic = @{JYmainClassNode : @"city" , @"city" : [CityWeather class] };

        [dic saxOtherparserWithdata:data finished:^(NSArray *dataList) {
            self.dataList = dataList;
            
        }];
        


3. 解析如下xml  属性 全在标签的属性列表 但是属性里面 又包含了数组

![xml1](http://images.cnblogs.com/cnblogs_com/weijingyun/698861/o_Snip20150608_5.png)
