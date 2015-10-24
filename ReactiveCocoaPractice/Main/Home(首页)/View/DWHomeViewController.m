//
//  DWHomeViewController.m
//  WeiiCoo
//
//  Created by SXQ on 15/10/7.
//  Copyright © 2015年 SXQ. All rights reserved.
//

#import "DWHomeViewController.h"
#import "DWHomeData.h"
#import "DGStatus.h"
#import "DGStatusCell.h"
@interface DWHomeViewController ()
@property (nonatomic,strong) DWHomeData *homeData;
@end

@implementation DWHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
    _homeData = [[DWHomeData alloc] initWithDataLoadCompletion:^(BOOL success) {
        [self.tableView reloadData];
    }];
}
- (void)setupTableView
{
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.allowsSelection = NO;
    self.tableView.estimatedRowHeight = 100;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1.0];
    [self.tableView registerClass:[DGStatusCell class] forCellReuseIdentifier:@"statusCell"];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _homeData.dwStatus.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    DWStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    DGStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:@"statusCell" forIndexPath:indexPath];
    cell.status = _homeData.dwStatus[indexPath.row];
    return cell;
}
@end
