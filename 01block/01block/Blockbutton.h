//
//  Blockbutton.h
//  01block
//
//  Created by tens04 on 16/8/23.
//  Copyright © 2016年 tens十安科技. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^HandleBlock)();
@interface Blockbutton : UIButton
-(void)tens:(HandleBlock)Tensbutton;
@end
