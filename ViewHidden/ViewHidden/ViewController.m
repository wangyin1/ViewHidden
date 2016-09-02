//
//  ViewController.m
//  ViewHidden
//
//  Created by 王印 on 16/8/31.
//  Copyright © 2016年 王印. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Hidden.h"

@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)buttonPressed:(UIButton *)sender {
    UILabel *lable = [self.view viewWithTag:sender.tag-100];
    lable.text = lable.text.length>0?@"":[NSString stringWithFormat:@"testLabel%ld",sender.tag-200];
    lable.blHidden = lable.text.length==0;
}

@end
