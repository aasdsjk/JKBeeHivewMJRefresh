//
//  JKViewController.m
//  JKBeeHivewMJRefresh
//
//  Created by aasdsjk on 05/12/2020.
//  Copyright (c) 2020 aasdsjk. All rights reserved.
//

#import "JKViewController.h"
#import <JKAppRefreshProtocol.h>
@interface JKViewController ()

@end

@implementation JKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UITableView *tab = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:tab];
    
    id<JKAppRefreshProtocol> refresh = [[BeeHive shareInstance] createService:@protocol(JKAppRefreshProtocol) ];
    [refresh addPullRefreshForScrollView:tab pullRefreshCallBack:^{
        
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
