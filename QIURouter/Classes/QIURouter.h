//
//  QIURouter.h
//  QIURouter
//
//  Created by QiuFeng on 21/11/2016.
//  Copyright © 2016 www.qiufeng.me. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QIURouter : NSObject


/**
 注册一个 schema

 @param format 对应的缩写
 @param controller 跳转到对应的地方
 */
+ (void)map:(NSString *)format toController:(Class)controller;


/**
 打开对应的 viewController

 @param url 上面方法对应的 format （url 简写）
 @param params 需要额外带入的参数
 @param controller 现在所在的 controller， 可以是 UINavigationViewController 或者 UIViewController (必须包含 UINavigationViewController),
 @return url 对应的 UIViewController
 */
+ (nullable __kindof UIViewController *)open:(NSString *)url params:(nullable NSDictionary *)params withViewController:(UIViewController *)controller;


/**
 获取 某个 UIViewController 对应的 schema

 @return 对应的 注册 schema
 */
+ (nullable NSString *)viewControllerClassSchema:(Class)controller;

/**
 获取 某个 UIViewController 对应的 schema
 
 @return 对应的 注册 schema
 */
+ (nullable NSString *)viewControllerSchema:(UIViewController *)controller;


/**
 判断能否打开这个 url
 */
+ (BOOL)canOpen:(NSString *)url;


@end

NS_ASSUME_NONNULL_END
