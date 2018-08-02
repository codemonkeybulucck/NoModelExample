//
//  ViewController.m
//  TestNoModel
//
//  Created by lemon on 2018/8/1.
//  Copyright © 2018年 Lemon. All rights reserved.
//

#import "ViewController.h"
#import "LMProductionViewController.h"

@interface ViewController ()
- (IBAction)goToNextController:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"首控制器";
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)goToNextController:(id)sender {
    LMProductionViewController *vc = [[LMProductionViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
