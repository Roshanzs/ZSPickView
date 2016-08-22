# ZSPickView
选择器

可以自定义的pickview选择器,支持无联动的一到三级选择和有联动的二级联动选择器,适合做性别,班级,城市等场景,使用时导入ZSPickView.h"到所需要的控制器,在点击需要弹出选择器的地方创建并设置相应属性,然后添加到view上即可,点击确认会回调sureBlock,在回调的sureBlock里面即可处理选择出的结果.

#import "ZSPickView.h"
//无联动的pickview
-(void)norelationPickView{
ZSPickView *pick = [[ZSPickView alloc]initWithComponentArr:nil];
pick.componentArr = @[self.arr1,self.arr2];
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
