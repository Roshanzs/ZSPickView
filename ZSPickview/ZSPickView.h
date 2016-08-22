//
//  ZSPickView.h
//  ZSPickView
//
//  Created by Tony on 16/8/19.
//  Copyright © 2016年 Tony. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZSPickView : UIView
@property(nonatomic,strong)NSArray *componentArr;
//pickview的组数
-(instancetype)initWithComponentArr:(NSArray *)Arr;
//确认回调block
@property(nonatomic,copy)void(^sureBlock)(NSArray *);
//取消回调block
@property(nonatomic,copy)void(^cancelBlock)();
@end
