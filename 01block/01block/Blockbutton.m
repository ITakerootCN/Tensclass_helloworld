//
//  Blockbutton.m
//  01block
//
//  Created by tens04 on 16/8/23.
//  Copyright © 2016年 tens十安科技. All rights reserved.
//

#import "Blockbutton.h"
@interface Blockbutton(){
    HandleBlock _block;
}

@end
@implementation Blockbutton

-(void)tens:(HandleBlock)Tensbutton{
    _block = Tensbutton;
    [self addTarget:self action:@selector(buttonaction) forControlEvents:UIControlEventTouchUpInside];
}


-(void)buttonaction{
    if (_block) {
        _block();
    }
}


@end

