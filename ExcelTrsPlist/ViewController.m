//
//  ViewController.m
//  ExcelTrsPlist
//
//  Created by HaoSun on 16/9/29.
//  Copyright © 2016年 MaiTian. All rights reserved.
//

#import "ViewController.h"

#define  ScreenWidth [UIScreen mainScreen].bounds.size.width
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"点击按钮进行excel转换为plist文件" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor redColor]];
    [button setFrame:CGRectMake(0, 100, ScreenWidth, ScreenWidth)];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];


}

- (void)buttonClick{

    NSString *schoolsPath = [[NSBundle mainBundle] pathForResource:@"im" ofType:@"txt"];
    NSString *schoolsContent = [[NSString alloc] initWithContentsOfFile:schoolsPath encoding:NSUTF8StringEncoding error:nil];
    NSArray *schoolsArray = [schoolsContent componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];

    NSString *plistPath = [NSHomeDirectory() stringByAppendingPathComponent:@"School.plist"];
    NSLog(@"%@",plistPath);
    NSMutableArray *resultsArr = [[NSMutableArray alloc] initWithCapacity:0];
    for (NSInteger j = 0; j < schoolsArray.count; j++){
        NSString *schoolStr = [schoolsArray objectAtIndex:j];
        NSArray *schoolArr = [schoolStr componentsSeparatedByString:@"\t"];
        [resultsArr addObject:@{@"schoolCode":[schoolArr objectAtIndex:0],@"schoolName":[schoolArr objectAtIndex:1],@"schoolother":[schoolArr objectAtIndex:2]}];
    }
    [resultsArr writeToFile:plistPath atomically:YES];
}

@end
