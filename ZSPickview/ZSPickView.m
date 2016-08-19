//
//  ZSPickView.m
//  ZSPickView
//
//  Created by Tony on 16/8/19.
//  Copyright © 2016年 Tony. All rights reserved.
//

#import "ZSPickView.h"

@interface ZSPickView()<UIPickerViewDelegate,UIPickerViewDataSource>
@property(nonatomic,strong)UIPickerView *pickview;
@property(nonatomic,strong)NSArray *oneArr;
@property(nonatomic,strong)NSArray *twoArr;
@property(nonatomic,strong)NSArray *threeArr;
@property(nonatomic,assign)NSInteger isNum;
@end
@implementation ZSPickView
#define screenH [UIScreen mainScreen].bounds.size.height
#define screenW [UIScreen mainScreen].bounds.size.width

-(instancetype)initWithComponentArr:(NSArray *)Arr{
    self = [super init];
    if (self) {
        self.componentArr = Arr;
        [self setupUI];
    }
    return self;
}



-(UIPickerView *)pickview{
    if (_pickview == nil) {
        _pickview = [[UIPickerView alloc]init];
        _pickview.delegate = self;
        _pickview.dataSource = self;
        _pickview.frame = CGRectMake(0, screenH - 216.0/667.0*screenH, screenW, 216.0/667.0*screenH);
        _pickview.backgroundColor = [UIColor whiteColor];
    }
    return _pickview;
}

-(void)setComponentArr:(NSArray *)componentArr{
    _componentArr = componentArr;
    for (int i=0; i<componentArr.count; i++) {
        id sub = componentArr[i];
        if ([sub isKindOfClass:[NSArray class]]) {
            self.isNum = componentArr.count;
            if (i == 0) {
                self.oneArr = sub;
            }
            if (i == 1) {
                self.twoArr = sub;
            }
            if (i == 2) {
                self.threeArr = sub;
            }
        }else{
            self.oneArr = componentArr;
        }
    }
    [self.pickview reloadAllComponents];
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    if (self.isNum) {
        return self.isNum;
    }else{
        return 1;
    }
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (self.isNum) {
        if (component == 0) {
            return self.oneArr.count;
        }
        if (component == 1) {
            return self.twoArr.count;
        }
        if (component == 2) {
            return self.threeArr.count;
        }
    }else{
        return self.oneArr.count;
    }
    return 0;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (self.isNum) {
        if (component == 0) {
            return [NSString stringWithFormat:@"%@",self.oneArr[row]];
        }
        if (component == 1) {
            return [NSString stringWithFormat:@"%@",self.twoArr[row]];
        }
        if (component == 2) {
            return [NSString stringWithFormat:@"%@",self.threeArr[row]];
        }
    }else{
        return [NSString stringWithFormat:@"%@",self.oneArr[row]];
    }
    return nil;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
}

-(void)setupUI{
    self.frame = CGRectMake(0, 0, screenW, screenH);
    [self addSubview:self.pickview];
}

@end
