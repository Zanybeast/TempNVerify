//
//  MPAdvertiseModel.h
//  testForClicked
//
//  Created by carl on 2021/5/5.
//

//#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, MPAdType) {
    MPAdTypeTop = 0,      ///< 顶部广告
    MPAdTypeList,         ///< 列表广告
    MPAdTypeBottom,       ///< 底部广告
    MPAdTypeBox,          ///< 专栏推荐滑动的Box广告
    MPAdTypeFULL,         ///< 启动广告
    MPAdTypeFLIP,         ///< 翻页广告
    MPAdTypePREROLL,      ///< 视频广告
    MPAdTypeSMALLEXPANDAD,///< 新闻详情先弹出 再缩回的 广告（小）
    MPAdTypeBIGEXPANDAD   ///< 新闻详情先弹出 再缩回的 广告（大）
};

NS_ASSUME_NONNULL_BEGIN

@interface MPAdvertiseModel : NSObject<NSCopying>

@property(nonatomic,copy)NSString * title;
@property(nonatomic,copy)NSString * source;
@property(nonatomic,copy)NSString * publisher;

@property(nonatomic,assign)MPAdType adType;
@property(nonatomic,copy)NSString * position;
@property(nonatomic,copy)NSString * adslot;
@property(nonatomic,copy)NSString * landing;
@property(nonatomic,assign)NSInteger index; //本地 list 广告所在数组的位置

@property(nonatomic,copy)NSString * testAdslot;
@property(nonatomic,copy)NSString * adLabel;
 
@property(nonatomic,assign)CGFloat width;
@property(nonatomic,assign)CGFloat height;
@property(nonatomic,copy)NSMutableArray * msize; // 只存在于DFPAD  [{"width": "300", "height": "250"},{"width": "300", "height": "250"}],
@property(nonatomic,copy)NSString * startDate;
@property(nonatomic,copy)NSString * endDate;
@property(nonatomic,copy)NSString * articleId; //新增加广告投放的文章的id
@property(nonatomic,copy)NSString * addCustomTargeting;  //列表的DFPAD广告 统计用
@property(nonatomic,copy)MPAdvertiseModel *passbackModel ; //备用广告

+ (id)advertiseModelWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
