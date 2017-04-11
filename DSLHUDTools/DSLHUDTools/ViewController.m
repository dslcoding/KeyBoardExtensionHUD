//
//  ViewController.m
//  DSLHUDTools
//
//  Created by 董诗磊 on 2017/4/10.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import "ViewController.h"

#import "KeyBoardFramework.h"

#import "DSLHUD.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)fontAction:(id)sender {
    
    [[DSLHUD shareDSLHUD] showHUDWithLable:@"我爱提示框" SuperView:self.view FontSize:13 HudDismissTiem:2 HudDismissBlock:^{
       
        NSLog(@"=====%@",@"我爱提示框");
        
    }];
    
   
}
- (IBAction)picAndtext:(id)sender {
    
     [[DSLHUD shareDSLHUD] showHUDWithImageAndLabel:IMAGEANDTEXT Text:@"让移动开发更简单" SuperView:self.view FontSize:20 HudImage:[UIImage imageNamed:@"correct"] HudDismissTiem:1.5 HudDismissBlock:^{
         
         NSLog(@"====让移动开发更简单");
         
     }] ;
   
}
- (IBAction)picAction:(id)sender {
    
    [[DSLHUD shareDSLHUD] showHUDWithImage:[UIImage imageNamed:@"correct"] SuperView:self.view HudDismissTiem:0 HudDismissBlock:^{
        
         NSLog(@"====correct");
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
  
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
