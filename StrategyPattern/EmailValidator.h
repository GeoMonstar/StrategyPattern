//
//  EmailValidator.h
//  StrategyPattern
//
//  Created by Monstar on 16/8/4.
//  Copyright © 2016年 Monstar. All rights reserved.
//

#import "InputValidator.h"

@interface EmailValidator : InputValidator

- (BOOL)validateInput:(UITextField *)input;

@end
