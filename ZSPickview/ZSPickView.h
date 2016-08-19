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
-(instancetype)initWithComponentArr:(NSArray *)Arr;
@end
