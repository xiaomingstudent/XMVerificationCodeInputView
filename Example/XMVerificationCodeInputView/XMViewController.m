//
//  XMViewController.m
//  XMVerificationCodeInputView
//
//  Created by 402187526@qq.com on 12/25/2020.
//  Copyright (c) 2020 402187526@qq.com. All rights reserved.
//

#import "XMViewController.h"
#import <XMVerificationCodeInputView/XMVerificationCodeInputView.h>
#import "XMRhombusInputBox.h"

@interface XMViewController ()

@end

@implementation XMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    __weak typeof(self) weakself = self;
    //下划线类型
    XMVerificationCodeInputView *underLineView = [[XMVerificationCodeInputView alloc] initWithFrame:CGRectMake(50, 100, self.view.bounds.size.width-100, 50)];
    underLineView.textCount = 6;
    underLineView.boxType = XMVerificationCodeInputViewUnderline;
    [self.view addSubview:underLineView];
    underLineView.textDidInputComplete = ^(NSString * _Nonnull text) {
        [weakself showAlertWithText:text];
    } ;
    
    //矩形带边框类型
    XMVerificationCodeInputView *retangleInputView = [[XMVerificationCodeInputView alloc] initWithFrame:CGRectMake(50, CGRectGetMaxY(underLineView.frame)+50, self.view.bounds.size.width-100, 40)];
    retangleInputView.textCount = 5;
    retangleInputView.boxType = XMVerificationCodeInputViewRetangle;
    [self.view addSubview:retangleInputView];
    retangleInputView.textDidInputComplete = ^(NSString * _Nonnull text) {
        [weakself showAlertWithText:text];
    } ;
    
    //自定义类型
    XMVerificationCodeInputView *customInputView = [[XMVerificationCodeInputView alloc] initWithFrame:CGRectMake(50, CGRectGetMaxY(retangleInputView.frame)+50, self.view.bounds.size.width-100, 50)];
    customInputView.boxType = XMVerificationCodeInputViewCustom;
    customInputView.customInputBox = [XMRhombusInputBox class];
    [self.view addSubview:customInputView];
    customInputView.textDidInputComplete = ^(NSString * _Nonnull text) {
        [weakself showAlertWithText:text];
    } ;
    
	
}

- (void)showAlertWithText:(NSString *)text {
    
    UIAlertController *vc = [UIAlertController alertControllerWithTitle:nil message:[NSString stringWithFormat:@"输入的文本为:%@",text] preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    
    [vc addAction:sure];
    
    [self presentViewController:vc animated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
