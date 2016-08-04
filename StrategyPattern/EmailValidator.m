//
//  EmailValidator.m
//  StrategyPattern
//
//  Created by Monstar on 16/8/4.
//  Copyright © 2016年 Monstar. All rights reserved.
//

#import "EmailValidator.h"

@implementation EmailValidator
- (BOOL)validateInput:(UITextField *)input{

    if (input.text.length <= 0) {
        
        self.errorMessage = @"没有输入";
        
    } else {
        NSString * MOBILE = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
        
        NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
        if ([regextestmobile evaluateWithObject:input.text] == NO)
        {
            self.errorMessage = @"请输入正确的邮箱";
        }
        else
        {
            self.errorMessage = nil;
        }
        
        
    }
    
    return self.errorMessage == nil ? YES : NO;
}
@end
