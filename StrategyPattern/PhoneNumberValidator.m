//
//  PhoneNumberValidator.m
//  StrategyPattern
//
//  Created by Monstar on 16/8/4.
//  Copyright © 2016年 Monstar. All rights reserved.
//

#import "PhoneNumberValidator.h"

@implementation PhoneNumberValidator
- (BOOL)validateInput:(UITextField *)input {
    
    if (input.text.length <= 0) {
        
        self.errorMessage = @"没有输入";
        
    } else {
        NSString * MOBILE = @"^((13[0-9])|(15[^4])|(18[0-9])|(1[4,7][0-9]))\\d{8}$";
        
        NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
        if ([regextestmobile evaluateWithObject:input.text] == NO)
        {
            self.errorMessage = @"请输入正确的手机号码";
        }
        else
        {
            self.errorMessage = nil;
        }
       
       
    }
    
    return self.errorMessage == nil ? YES : NO;
}
@end
