//
//  ViewController.m
//  StrategyPattern
//
//  Created by Monstar on 16/8/4.
//  Copyright © 2016年 Monstar. All rights reserved.
//

#import "ViewController.h"
#import "CustomField.h"
#import "EmailValidator.h"
#import "PhoneNumberValidator.h"
@interface ViewController ()<UITextFieldDelegate>


@property (nonatomic, strong) CustomField  *emailField;

@property (nonatomic, strong) CustomField  *phoneNumberField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 初始化按钮
    [self initButton];
    
    // 初始化验证框
    [self initCustomFields];
}
- (void)initCustomFields {
    
    
    self.emailField             = [[CustomField alloc] initWithFrame:CGRectMake(30, 80,  300, 30)];
    self.emailField.placeholder = @"请输入邮箱";
    self.emailField.delegate    = self;
    self.emailField.validator   = [EmailValidator new];
    [self.view addSubview:self.emailField];
    
    
    self.phoneNumberField             = [[CustomField alloc] initWithFrame:CGRectMake(30, 80 + 40,300, 30)];
    self.phoneNumberField.placeholder = @"请输入电话号码";
    self.phoneNumberField.delegate    = self;
    self.phoneNumberField.validator   = [PhoneNumberValidator new];
    [self.view addSubview:self.phoneNumberField];
}

#pragma mark - 初始化按钮以及按钮事件
- (void)initButton {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 300, 150, 50);
    
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:@"确定" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonsEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonsEvent:(UIButton *)button {
    
    [self.view endEditing:YES];
}
#pragma mark - 文本框代理
- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    CustomField *customField = (CustomField *)textField;
    
    if ([customField validate] == NO) {
        
//        [UIInfomationView showAlertViewWithTitle:nil
//                                         message:customField.validator.errorMessage
//                               cancelButtonTitle:nil
//                               otherButtonTitles:@[@"确定"]
//                                    clickAtIndex:^(NSInteger buttonIndex) {
//                                        
//                                    }];
        UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"" message:customField.validator.errorMessage preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *queding = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [ac addAction:queding];
        
        [self presentViewController:ac animated:YES completion:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
