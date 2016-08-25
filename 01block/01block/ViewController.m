//
//  ViewController.m
//  01block
//
//  Created by tens04 on 16/8/23.
//  Copyright © 2016年 tens十安科技. All rights reserved.
//

#import "ViewController.h"
#import "Blockbutton.h"
@interface ViewController (){

    Blockbutton *button;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    //因为block是完全引入C的方法，所谓的block即使用一个变量来接收一个代码块，而不再单纯的接收一个值。
    //接收之后用C的方法，直接用变量名对函数进行直接调用就行了
    void (^block_1)(int a ,int b) = ^(int a,int b){
      
        NSLog(@"a+b = %d",a+b);
        
    };
    
    block_1(10,20);
    
    
    //将block整块代码块，进行传递，直接传递到下面的方法，进行接收，并在方法里直接使用这个函数
    [self sumblock:(block_1)]; //OC里的调用，直接用self调用自身方法
    sum_block(block_1); //C里的调用，直接用函数名，对函数进行调用
    
    button = [[Blockbutton alloc]initWithFrame:CGRectMake(20, 100, 300, 50)];
    button.backgroundColor = [UIColor redColor];
    [self.view addSubview:button];
    
    [button tens:^(){
        NSLog(@"点击");
    }];
    
    
    
    //int a = 1;
    __block int a = 1; //在定义时加上__block修饰，在block内部使用时就不会拷贝了，使用的是同一个变量，就能直接修改值了
    void(^ablock)() = ^{
        //a = 2    错误，block里不能直接变量进行修改，使用block时如果需要使用外部的变量，他会拷贝一份拿来使用，而不是直接使用
        //外部的变量，也就是说会变成两个值相同，但是地址不同的东西，如果直接修改，他会分辨不清修改哪一个“a”所以会报错
        
    };
    
    int b = 1;
    void(^bblock)() = ^{
        
    };
    
}
//用C里的函数的方式定义
void sum_block (void (^block)(int a,int b)){
    
    block(100,200);
    
}

//用OC里的方法的方式定义
-(void)sumblock:(void (^)(int a,int b))block{
    
    
    block(100,200);

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
