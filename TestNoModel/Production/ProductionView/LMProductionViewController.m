//
//  LMProductionViewController.m
//  TestNoModel
//
//  Created by lemon on 2018/8/1.
//  Copyright © 2018年 Lemon. All rights reserved.
//

#import "LMProductionViewController.h"
#import "LMProductionAPIManager.h"
#import "LMProductReformer.h"
#import "MBProgressHUD+LKZ.h"

@interface LMProductionViewController ()<APIResponseProtocol,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) LMProductionAPIManager *productionAPIManager;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *productionArr;
@end

@implementation LMProductionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"产品列表";
    [self.view addSubview:self.tableView];
    [MBProgressHUD showMessage:@"正在加载数据"];
    [self.productionAPIManager startRequest];
    
}

#pragma mark - 返回数据
- (void)apiResponseSuccess:(id<APIRequestProtocol>)request{
    [MBProgressHUD hideHUD];
    self.productionArr =  [request fetchDataWithReformer:[LMProductReformer new]];
    [self.tableView reloadData];
}

#pragma mark - tableview delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.productionArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dict = self.productionArr[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"productionCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"productionCell"];
    }
    cell.textLabel.text = dict[kLMProductionVer];
    cell.detailTextLabel.text = dict[kLMProductionVerDesc];
    return cell;
}


#pragma mark - lazy load

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.rowHeight = 64;
    }
    return _tableView;
}

- (LMProductionAPIManager *)productionAPIManager{
    if(!_productionAPIManager){
        _productionAPIManager = [[LMProductionAPIManager alloc]init];
        _productionAPIManager.response = self;
    }
    return _productionAPIManager;
}

@end
