//
//  ViewController.m
//  作业3
//
//  Created by gongwenkai on 2016/12/13.
//  Copyright © 2016年 gongwenkai. All rights reserved.
//

#import "ViewController.h"
#import "ControlPanel.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat panelHight = self.view.frame.size.height - self.view.frame.size.height * 0.6 - 64;
    ControlPanel *view = [[ControlPanel alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-panelHight, self.view.frame.size.width, panelHight)];
    [self.view addSubview:view];


}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
