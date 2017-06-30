//
//  SRMScannerView.h
//  Pods
//
//  Created by marksong on 30/06/2017.
//
//

#import <UIKit/UIKit.h>
@protocol SRMScannerViewDelegate;

@interface SRMScannerView : UIView

/**
 指定扫描框的位置及大小
 */
@property (nonatomic) CGRect scanRect;
@property (nonatomic, weak) id<SRMScannerViewDelegate> delegate;

/**
 开始扫描
 */
- (void)startScanning;
/**
 停止扫描
 */
- (void)stopScanning;

@end

@protocol SRMScannerViewDelegate <NSObject>

@optional
- (void)scannerView:(SRMScannerView *)scannerView didCaptureResult:(NSString *)result;

@end
