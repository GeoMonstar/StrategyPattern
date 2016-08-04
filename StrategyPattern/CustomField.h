//
//  CustomField.h
//  StrategyPattern
//
//  Created by Monstar on 16/8/4.
//  Copyright © 2016年 Monstar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InputValidator.h"
@interface CustomField : UITextField


/**
 *  抽象的策略
 */
@property (nonatomic, strong) InputValidator *validator;

- (instancetype)initWithFrame:(CGRect)frame;

- (BOOL)validate;

@end
