# 类似微信所在位置 只需四个步骤 

1、添加高德地图所需的类库 以及高德地图自身的类库 如:FrameWork目录下的类库

2、apikey 申请请看这里http://lbs.amap.com/api/ios-sdk/guide/verify/
[MAMapServices sharedServices].apiKey = @"07e5f969bc576c945677abd70a093d50";
[MapAroundPlaceApi shareMapAroundPlaceApi].searchKey = @"07e5f969bc576c945677abd70a093d50";

3、坐标转换key  申请请看这里 http://lbsbbs.amap.com/forum.php?mod=viewthread&tid=724&highlight=%E5%9D%90%E6%A0%87%E8%BD%AC%E6%8D%A2
[MapAroundPlaceApi shareMapAroundPlaceApi].convertKey= @"2a0d92e09bea4b258736c90eed70e00e";

4、在Info添加 NSLocationAlwaysUsageDescription 与 NSLocationWhenInUseUsageDescription

