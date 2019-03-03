//
//  ViewController.m
//  YZMUserDefaultMaster
//
//  Created by yangzhenmin on 2019/3/3.
//  Copyright © 2019年 yangzhenmin. All rights reserved.
//

#import "ViewController.h"
#import "YZMUserDefault.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [[YZMUserDefault shareInstance] yzmUserDefault_setObject:@"12131444444455" forKey:@"ab23234c666677"];
//    [[YZMUserDefault shareInstance] yzmUserDefault_setObject:@"12131422244444455" forKey:@"123"];
//    [[YZMUserDefault shareInstance] yzmUserDefault_synchronize];
    NSDictionary *data = [[YZMUserDefault shareInstance] getAllEntities];
    NSLog(@"%@",data);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
