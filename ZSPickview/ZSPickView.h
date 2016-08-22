//
//  ZSPickView.h
//  ZSPickView
//
//  Created by Tony on 16/8/19.
//  Copyright © 2016年 Tony. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZSPickView : UIView
//pickview无关联的组数
@property(nonatomic,strong)NSArray *componentArr;
-(instancetype)initWithComponentArr:(NSArray *)Arr;
//pickview联动的数组
-(instancetype)initWithRelationComponentArr:(NSArray *)Arr withRight:(NSString *)rightStr withLeft:(NSString *)leftStr;
//确认回调block
@property(nonatomic,copy)void(^sureBlock)(NSArray *);
@end
