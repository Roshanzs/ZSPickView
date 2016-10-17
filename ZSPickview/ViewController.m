//
//  ViewController.m
//  ZSPickView
//
//  Created by Tony on 16/8/19.
//  Copyright © 2016年 Tony. All rights reserved.
//

#import "ViewController.h"
#import "ZSPickView.h"

@interface ViewController ()
@property(nonatomic,strong)NSArray *arr1;
@property(nonatomic,strong)NSArray *arr2;
@property(nonatomic,strong)NSArray *arr3;
@property(nonatomic,strong)NSArray *arr4;

@end

@implementation ViewController

-(NSArray *)arr1{
    if (_arr1 == nil) {
        NSMutableArray *arr = [NSMutableArray array];
        for (int i=0; i<10; i++) {
            NSString *str = [NSString stringWithFormat:@"%d",i];
            [arr addObject:str];
        }
        _arr1 = arr.copy;
    }
    return _arr1;
}

-(NSArray *)arr2{
    if (_arr2 == nil) {
        NSMutableArray *arr = [NSMutableArray array];
        for (int i=0; i<20; i++) {
            NSString *str = [NSString stringWithFormat:@"%d",i];
            [arr addObject:str];
        }
        _arr2 = arr.copy;
    }
    return _arr2;
}

-(NSArray *)arr3{
    if (_arr3 == nil) {
        NSMutableArray *arr = [NSMutableArray array];
        for (int i=0; i<30; i++) {
            NSString *str = [NSString stringWithFormat:@"%d",i];
            [arr addObject:str];
        }
        _arr3 = arr.copy;
    }
    return _arr3;
}

-(NSArray *)arr4{
    if (_arr4 == nil) {
        _arr4 = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"city.plist" ofType:nil]];
    }
    return _arr4;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self norelationPickView];
    [self relationPickView];
}

//无联动的pickview
-(void)norelationPickView{
    ZSPickView *pick = [[ZSPickView alloc]initWithComponentArr:nil];
    pick.componentArr = @[self.arr1];
    pick.sureBlock = ^(NSArray *arr){
        for (NSString *str in arr) {
            NSLog(@"无联动   %@",str);
        }
    };
    [self.view addSubview:pick];
}

//联动的pickview
-(void)relationPickView{
    ZSPickView *pick = [[ZSPickView alloc]initWithRelationComponentArr:self.arr4 withRight:@"cities" withLeft:@"state"];
    pick.sureBlock = ^(NSArray *arr){
        for (NSString *str in arr) {
            NSLog(@"联动   %@",str);
        }
    };
    [self.view addSubview:pick];

}













@end
