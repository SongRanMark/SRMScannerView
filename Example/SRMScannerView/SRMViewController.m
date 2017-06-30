//
//  SRMViewController.m
//  SRMScannerView
//
//  Created by githubsr on 06/30/2017.
//  Copyright (c) 2017 githubsr. All rights reserved.
//

#import "SRMViewController.h"
#import "SRMScannerView.h"
#import "UIView+SRMFrame.h"
#import "UIScreen+SRMExtension.h"

@interface SRMViewController () <SRMScannerViewDelegate>

@property (weak, nonatomic) IBOutlet SRMScannerView *scannerView;

@end

@implementation SRMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scannerView.scanRect = [self scanRect];
    self.scannerView.delegate = self;
    [self.scannerView startScanning];
}

- (void)scannerView:(SRMScannerView *)scannerView didCaptureResult:(NSString *)result {
    NSLog(@"%@", result);
}

- (CGRect)scanRect {
    CGFloat width = [UIScreen srm_mainWidth] / 2;
    CGFloat height = width;
    CGFloat originX = ([UIScreen srm_mainWidth] - width) / 2;
    CGFloat originY = ([UIScreen srm_mainHeight] - height) / 2;

    return CGRectMake(originX, originY, width, height);
}

@end
