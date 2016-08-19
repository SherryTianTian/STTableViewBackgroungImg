//
//  ViewController.m
//  STTableBackgroungImg
//
//  Created by Sherry on 16/8/18.
//  Copyright © 2016年 Sherry. All rights reserved.
//

#import "ViewController.h"


#import "MainCell.h"


@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    UITableView *mainTable;
    NSArray *mainArr;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    mainArr = @[@[@"朋友圈"],
                @[@"扫一扫", @"摇一摇"],
                @[@"附近的人", @"漂流瓶"],
                @[@"购物", @"游戏"]
                ];
    
    
    
    mainTable = [[UITableView alloc] initWithFrame:self.view.bounds style:(UITableViewStylePlain)];
    mainTable.delegate = self;
    mainTable.dataSource = self;
    
    [mainTable registerClass:[MainCell class] forCellReuseIdentifier:@"MainCell"];
    [mainTable registerNib:[UINib nibWithNibName:@"MainCell" bundle:nil] forCellReuseIdentifier:@"MainCell"];
    
    /***
     为TableView添加背景图片，且背景不会随Tableview的滚动而动
     1.设置TableView背景色为clearColor
     2.设置TableView背景图
     3.设置cell背景色为clearColor
     ***/
    
    mainTable.backgroundColor = [UIColor clearColor];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Background"]];
    mainTable.backgroundView = imageView;
    
    
    
//    这样设置mainTable的背景图会随Tableview的滚动而动， 这种情况下背景图片像地板砖一样平铺。拉动tableView背景图片会随着动，若行数超过背景图片的高度，会接着显示下一张图片。
    
//    mainTable.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Background"]];


    
    [self.view addSubview:mainTable];
    
    mainTable.tableFooterView = [[UIView alloc] init];
    
    
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return mainArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [mainArr[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MainCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MainCell"];
    
    cell.backgroundColor = [UIColor clearColor];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.itemNameLab.text = [NSString stringWithFormat:@"%@", [mainArr[indexPath.section] objectAtIndex:indexPath.row]];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40.0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
