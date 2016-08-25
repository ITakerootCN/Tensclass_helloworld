//
//  ViewController.m
//  02时钟
//
//  Created by tens04 on 16/8/24.
//  Copyright © 2016年 tens十安科技. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    CALayer *layer_1;
    CALayer *layer_2;
    CALayer *layer_3;
    NSInteger a;
    NSInteger b;
}
@property(strong,nonatomic)NSDateComponents *comps;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self Time];
    CALayer *layer = [[CALayer alloc] init];
    layer.frame = CGRectMake(0, 0, 400, 400);
    // 2、将图层添加到父图层
    //       layer_1.anchorPoint = CGPointMake(1, 0.5);
    layer.position = self.view.center;
    [self.view.layer addSublayer:layer];
    layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"dial"].CGImage);
    
    
    layer_1 = [[CALayer alloc] init];
    layer_1.frame = CGRectMake(0, 0, 20, 150);
    // 2、将图层添加到父图层
    
    layer_1.position = self.view.center;
    layer_1.anchorPoint = CGPointMake(0.5, 1);
    [self.view.layer addSublayer:layer_1];
    layer_1.contents = (__bridge id _Nullable)([UIImage imageNamed:@"secondHand"].CGImage);
    
    layer_2 = [[CALayer alloc] init];
    layer_2.frame = CGRectMake(0, 0, 20, 150);
    // 2、将图层添加到父图层
    
    layer_2.position = self.view.center;
    layer_2.anchorPoint = CGPointMake(0.5, 1);
    [self.view.layer addSublayer:layer_2];
    layer_2.contents = (__bridge id _Nullable)([UIImage imageNamed:@"minuteHand"].CGImage);
    
    
    layer_3 = [[CALayer alloc] init];
    layer_3.frame = CGRectMake(0, 0, 20, 150);
    // 2、将图层添加到父图层
    
    layer_3.position = self.view.center;
    layer_3.anchorPoint = CGPointMake(0.5, 1);
    [self.view.layer addSublayer:layer_3];
    layer_3.contents = (__bridge id _Nullable)([UIImage imageNamed:@"hourHand"].CGImage);
    
    
    layer_1.transform = CATransform3DRotate(layer_1.transform, (M_PI/30)*self.comps.second, 0, 0, 1);
    layer_2.transform = CATransform3DRotate(layer_2.transform, (M_PI/30)*self.comps.minute, 0, 0, 1);
    layer_3.transform = CATransform3DRotate(layer_3.transform, (M_PI/6)*self.comps.hour, 0, 0, 1);
    
    a = self.comps.second;
    b = self.comps.minute;
    layer_3.transform = CATransform3DRotate(layer_3.transform, (M_PI/360)*b, 0, 0, 1);
    
    [NSTimer  scheduledTimerWithTimeInterval:1  //多久后再次运行
                                      target:self                     //在什么类中实现方法
                                    selector:@selector(toMedicine:) //调用的方法
                                    userInfo:nil                 //是否传值
                                     repeats:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)toMedicine:(NSTimer*)timer{
    a++;
    if (a == 60) {
        a = 0;
    }
    layer_1.transform = CATransform3DRotate(layer_1.transform, (M_PI/30), 0, 0, 1);
    if (a == 0) {
        layer_3.transform = CATransform3DRotate(layer_3.transform, (M_PI/360), 0, 0, 1);
        
        layer_2.transform = CATransform3DRotate(layer_2.transform, (M_PI/30), 0, 0, 1);
        if (b == 60) {
            b = 0;
        }
    }

}


-(void)Time{
    NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    // 指定日历的算法 NSCalendarIdentifierGregorian,NSGregorianCalendar
    
    // NSDateComponent 可以获得日期的详细信息，即日期的组成
    self.comps = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit|NSWeekCalendarUnit|NSWeekdayCalendarUnit fromDate:[NSDate date]];
    
    //    NSLog(@"年 = year = %ld",comps.year);
    //    NSLog(@"月 = month = %ld",comps.month);
    //    NSLog(@"日 = day = %ld",comps.day);
    //    NSLog(@"时 = hour = %ld",comps.hour);
    //    NSLog(@"分 = minute = %ld",comps.minute);
    //    NSLog(@"秒 = second = %ld",comps.second);
    //    NSLog(@"星期 =weekDay = %ld ",comps.weekday);
    //
 
}

@end
