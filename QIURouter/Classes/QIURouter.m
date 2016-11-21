//
//  QIURouter.m
//  QIURouter
//
//  Created by QiuFeng on 21/11/2016.
//  Copyright © 2016 www.qiufeng.me. All rights reserved.
//

#import "QIURouter.h"

@interface QIURouter ()

@property (nonatomic, strong, class) NSMutableDictionary<NSString *, Class> *mapController;

@end

@implementation QIURouter

static NSMutableDictionary<NSString *, Class> *_mapController = nil;

+ (NSString *)viewControllerSchema:(UIViewController *)controller {
    return [self viewControllerClassSchema:[controller class]];
}

+ (NSString *)viewControllerClassSchema:(Class)controller {
    __block NSString *schema = nil;
    if (controller) {
        [self.mapController enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, Class  _Nonnull obj, BOOL * _Nonnull stop) {
            if ([NSStringFromClass(controller) isEqualToString:NSStringFromClass(obj)]) {
                schema = key;
                *stop = YES;
            }
        }];
    }
    return schema;
}

#pragma mark - Accessors

+ (NSMutableDictionary<NSString *, Class> *)mapController {
    if (_mapController == nil) {
        _mapController = [NSMutableDictionary dictionary];
    }
    return _mapController;
}

+ (void)map:(NSString *)format toController:(Class)controllerClass {
    self.mapController[format] = controllerClass;
}

+ (BOOL)canOpen:(NSString *)url {
    if (url) {
        if ([self.mapController.allKeys containsObject:url]) {
            return YES;
        }
    }
    return NO;
}

+ (UIViewController *)open:(NSString *)url params:(NSDictionary *)params withViewController:(UIViewController *)controller {
    if (url == nil) {
        return nil;
    }
    
    if (self.mapController[url]) {
        SEL controllerSelector = sel_registerName("loadFromStoryboard");
        SEL controllerParamsSelector = sel_registerName("loadFromStoryboard:");
        SEL select = controllerSelector;
        
        NSString *title = params[@"viewControllerTitle"];
        if (params) {
            select = controllerParamsSelector;
            if (title) {
                params = [params mutableCopy];
                [(NSMutableDictionary *)params removeObjectForKey:@"viewControllerTitle"];
            }
        }
        
        Class nextControllerClass = self.mapController[url];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        if ([nextControllerClass respondsToSelector:select]) {
            UIViewController *pushController = [nextControllerClass performSelector:select withObject:params];
            if (title) {
                pushController.title = title;
            }
            
            UIViewController *nav = controller;
            if ([nav isKindOfClass:[UINavigationController class]]) {
                [(UINavigationController *)nav pushViewController:pushController animated:YES];
                return pushController;
            } else {
                while (nav.navigationController == nil) {
                    nav = pushController.parentViewController;
                    if (nav == nil) {
                        NSAssert(NO, @"Must have NavigationViewController");
                        return nil;
                    }
                }
                [nav.navigationController pushViewController:pushController animated:YES];
                return pushController;
            }
        } else {
            NSAssert(NO, @"no register for url %@", url);
            return nil;
        }
    } else {
        NSURL *applicationUrl = [NSURL URLWithString:url];
        if ([[UIApplication sharedApplication] canOpenURL:applicationUrl]) {
            if ([[UIDevice currentDevice].systemVersion floatValue] >= 10.0) {
                [[UIApplication sharedApplication] openURL:applicationUrl options:params completionHandler:nil];
            } else {
                [[UIApplication sharedApplication] openURL:applicationUrl];
            }
            return nil;
        } else {
            NSAssert(NO, @"no map found");
            return nil;
        }
    }
#pragma clang diagnostic ppo
}

@end
