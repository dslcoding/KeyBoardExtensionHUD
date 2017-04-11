//
//  KeyboardViewController.m
//  DSLKeyBoard
//
//  Created by 董诗磊 on 2017/4/11.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import "KeyboardViewController.h"

#import "KeyBoardFramework.h"
#import "DSLHUD.h"



@interface KeyboardViewController ()
@property (nonatomic, strong) UIButton *nextKeyboardButton;
@end

@implementation KeyboardViewController

- (void)updateViewConstraints {
    [super updateViewConstraints];
    
    // Add custom view sizing constraints here
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Perform custom UI setup here
    self.nextKeyboardButton = [UIButton buttonWithType:UIButtonTypeSystem];
    
    [self.nextKeyboardButton setTitle:NSLocalizedString(@"Next Keyboard", @"Title for 'Next Keyboard' button") forState:UIControlStateNormal];
    [self.nextKeyboardButton sizeToFit];
    self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.nextKeyboardButton addTarget:self action:@selector(handleInputModeListFromView:withEvent:) forControlEvents:UIControlEventAllTouchEvents];
    
    [self.view addSubview:self.nextKeyboardButton];
    
    [self.nextKeyboardButton.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
    [self.nextKeyboardButton.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
    
    
    
    UIButton  *lableHUDBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    lableHUDBtn.frame = CGRectMake(0, 0, 80, 40);
    
    lableHUDBtn.backgroundColor = [UIColor redColor];
    
    [lableHUDBtn setTitle:@"只有文字" forState:UIControlStateNormal];
    
    lableHUDBtn.tag = 1;
    
    [lableHUDBtn addTarget:self action:@selector(hudAction: ) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton  *picHUDBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    picHUDBtn.frame = CGRectMake(82, 0, 80, 40);
    
    [picHUDBtn setTitle:@"只有图片" forState:UIControlStateNormal];
    
    picHUDBtn.backgroundColor = [UIColor yellowColor];
    
    picHUDBtn.tag = 2;
    
    [picHUDBtn addTarget:self action:@selector(hudAction: ) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton  *lableAndpicHUDBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [lableAndpicHUDBtn setTitle:@"图片和文字" forState:UIControlStateNormal];
    
    lableAndpicHUDBtn.backgroundColor = [UIColor greenColor];
    
    lableAndpicHUDBtn.frame = CGRectMake(164, 0, 100, 40);
    
    lableAndpicHUDBtn.tag = 3;
    
    [lableAndpicHUDBtn addTarget:self action:@selector(hudAction: ) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:lableHUDBtn];
    
    [self.view addSubview:picHUDBtn];
    
    [self.view addSubview:lableAndpicHUDBtn];
}

- (void)hudAction:(UIButton *)btn
{

    switch (btn.tag) {
        case 1:
            [[DSLHUD shareDSLHUD] showHUDWithLable:@"我爱提示框" SuperView:self.view FontSize:13 HudDismissTiem:2 HudDismissBlock:^{
                
                NSLog(@"=====%@",@"我爱提示框");
                
            }];

            break;
            case 2:
            [[DSLHUD shareDSLHUD] showHUDWithImage:[UIImage imageNamed:@"correct"] SuperView:self.view HudDismissTiem:0 HudDismissBlock:^{
                
                NSLog(@"====correct");
            }];

            
            break;
            
            case 3:
            
            [[DSLHUD shareDSLHUD] showHUDWithImageAndLabel:IMAGEANDTEXT Text:@"让移动开发更简单" SuperView:self.view FontSize:20 HudImage:[UIImage imageNamed:@"correct"] HudDismissTiem:1.5 HudDismissBlock:^{
                
                NSLog(@"====让移动开发更简单");
                
            }] ;
            break;
            
            
        default:
            break;
    }



}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated
}

- (void)textWillChange:(id<UITextInput>)textInput {
    // The app is about to change the document's contents. Perform any preparation here.
}

- (void)textDidChange:(id<UITextInput>)textInput {
    // The app has just changed the document's contents, the document context has been updated.
    
    UIColor *textColor = nil;
    if (self.textDocumentProxy.keyboardAppearance == UIKeyboardAppearanceDark) {
        textColor = [UIColor whiteColor];
    } else {
        textColor = [UIColor blackColor];
    }
    [self.nextKeyboardButton setTitleColor:textColor forState:UIControlStateNormal];
}

@end
