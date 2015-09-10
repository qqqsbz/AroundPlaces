//
//  ViewController.m
//  GaoDeMap
//
//  Created by coder on 15/8/26.
//  Copyright (c) 2015年 coder. All rights reserved.
//
#import "ViewController.h"
#import "AroundPlacesViewController.h"
#import <CoreLocation/CoreLocation.h>
@interface ViewController ()<CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
}
@property (strong, nonatomic) NSIndexPath *indexPath;
@property (strong, nonatomic) UIButton *aroundPlaceBtn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(selectPlace:) name:@"kAROUNDPLACE" object:nil];
    
    [self buildView];
    
//    locationManager                     = [[CLLocationManager alloc] init];
//    locationManager.desiredAccuracy     = kCLLocationAccuracyNearestTenMeters;
//    locationManager.distanceFilter      = 10.f;
//    locationManager.delegate            = self;
//    [locationManager startUpdatingLocation];
//    
//    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
//        [locationManager requestWhenInUseAuthorization];
//    }
    
}

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"coordinate  %f,%f",newLocation.coordinate.latitude, newLocation.coordinate.longitude);
}


- (void)selectPlace:(NSNotification *)notification
{
    NSString *name = notification.userInfo[@"name"];
    if (name) {
        [self.aroundPlaceBtn setTitle:notification.userInfo[@"name"] forState:UIControlStateNormal];
    }
    self.indexPath = notification.userInfo[@"indexPath"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)buildView
{
    self.aroundPlaceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.aroundPlaceBtn.frame = CGRectMake(0, CGRectGetMidY(self.view.bounds), CGRectGetWidth(self.view.bounds), 60);
    [self.aroundPlaceBtn setTitle:@"所在位置" forState:UIControlStateNormal];
    [self.aroundPlaceBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.aroundPlaceBtn addTarget:self action:@selector(pushAroundView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.aroundPlaceBtn];
}

- (void)pushAroundView
{
    AroundPlacesViewController *aroundPlacesVC = [[AroundPlacesViewController alloc] init];
    aroundPlacesVC.indexPath = self.indexPath;
    [self.navigationController pushViewController:aroundPlacesVC animated:YES];
}



@end
