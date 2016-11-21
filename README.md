# QIURouter

[![CI Status](http://img.shields.io/travis/QiuFeng/QIURouter.svg?style=flat)](https://travis-ci.org/QiuFeng/QIURouter)
[![Version](https://img.shields.io/cocoapods/v/QIURouter.svg?style=flat)](http://cocoapods.org/pods/QIURouter)
[![License](https://img.shields.io/cocoapods/l/QIURouter.svg?style=flat)](http://cocoapods.org/pods/QIURouter)
[![Platform](https://img.shields.io/cocoapods/p/QIURouter.svg?style=flat)](http://cocoapods.org/pods/QIURouter)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

AppDelegate 

```
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {      
    [QIURouter map:@"second" toController:[QIUSecondViewController class]];
}
```
    
Your ViewController


```
@interface QIUSecondViewController ()
@end
    
@implementation QIUSecondViewController

//+ (instancetype)loadFromStoryboard
//{
//    
//}

// or

+ (instancetype)loadFromStoryboard:(NSDictionary *)parms
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    QIUSecondViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"QIUSecondViewController"];
    viewController.label.text = parms[@"text"];
    return viewController;
}
    
@end
```

Then, you can use


```
[QIURouter open:@"second" params:@{@"text": @"Param from ViewControlelr",
                                       @"viewControllerTitle": @"titleFromFirstViewController"} withViewController:self];
```



## Requirements

iOS 8.0

Xcode 8

## Installation

QIURouter is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "QIURouter"
```

## Author

QiuFeng, qfviolethill@163.com

## License

QIURouter is available under the MIT license. See the LICENSE file for more info.
