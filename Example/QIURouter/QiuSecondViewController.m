//
//  QIUSecondViewController.m
//  QIURouter
//
//  Created by QiuFeng on 21/11/2016.
//  Copyright © 2016 www.qiufeng.me. All rights reserved.
//

#import "QIUSecondViewController.h"

@interface QIUSecondViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation QIUSecondViewController

//+ (instancetype)loadFromStoryboard
//{
//    
//}
//

+ (instancetype)loadFromStoryboard:(NSDictionary *)parms
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    QIUSecondViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"QIUSecondViewController"];
    viewController.label.text = parms[@"text"];
    return viewController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
