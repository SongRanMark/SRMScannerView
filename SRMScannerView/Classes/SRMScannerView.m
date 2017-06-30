//
//  SRMScannerView.m
//  Pods
//
//  Created by marksong on 30/06/2017.
//
//

#import "SRMScannerView.h"
#import <AVFoundation/AVFoundation.h>
#import "SRMScannerTargetView.h"
#import "SRMScannerMaskView.h"
#import "UIView+SRMConstraint.h"

@interface SRMScannerView () <AVCaptureMetadataOutputObjectsDelegate>

@property (nonatomic) AVCaptureSession *session;
@property (nonatomic) AVCaptureVideoPreviewLayer *previewLayer;
@property (nonatomic) AVCaptureMetadataOutput *output;
@property (nonatomic) SRMScannerTargetView *targetView;
@property (nonatomic) SRMScannerMaskView *maskView;

@end

@implementation SRMScannerView

#pragma mark - Override

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initialize];
    }

    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self initialize];
    }

    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.previewLayer.frame = self.bounds;
    self.maskView.clearRect = self.scanRect;
    self.targetView.frame = self.scanRect;
    // AVCaptureMetadataOutput 的坐标系与 UIView 的坐标系不同，需做转换。
    [self.output setRectOfInterest:[self convertCaptureRectFromInterestRect:self.scanRect]];
}

#pragma mark - Public

- (void)startScanning {
    [self.session startRunning];
}

- (void)stopScanning {
    [self.session stopRunning];
}

#pragma mark - AVCaptureMetadataOutputObjectsDelegate

- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection {
    if (metadataObjects != nil && [metadataObjects count] > 0) {
        AVMetadataMachineReadableCodeObject * metadataObj = [metadataObjects objectAtIndex: 0];
        [self stopScanning];

        dispatch_async(dispatch_get_main_queue(), ^{
            if ([self.delegate respondsToSelector:@selector(scannerView:didCaptureResult:)]) {
                NSString *result = metadataObj.stringValue;
                [self.delegate scannerView:self didCaptureResult:result];
            }
        });
    }
}

#pragma mark - Private

- (void)initialize {
    [self initializeAV];
    [self initializeMaskView];
    [self initializeTargetView];
}

- (void)initializeAV {
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    AVCaptureSession *session = [[AVCaptureSession alloc] init];
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device error:nil];
    AVCaptureMetadataOutput *output = [[AVCaptureMetadataOutput alloc] init];

    if ([session canAddInput:input]) {
        [session addInput:input];
    }

    if ([session canAddOutput:output]) {
        [session addOutput:output];
    }

    NSMutableArray *availableMetadataObjectTypes = [NSMutableArray arrayWithArray:output.availableMetadataObjectTypes];

    if ([availableMetadataObjectTypes containsObject:AVMetadataObjectTypeFace]) {
        [availableMetadataObjectTypes removeObject:AVMetadataObjectTypeFace];
    }

    [output setMetadataObjectTypes:availableMetadataObjectTypes];
    [output setMetadataObjectsDelegate:self queue:dispatch_queue_create("SRMScannerViewQueue", NULL)];
    [output setRectOfInterest:CGRectMake(0, 0, 1, 1)];
    session.sessionPreset = AVCaptureSessionPresetHigh;
    AVCaptureVideoPreviewLayer *previewLayer = [AVCaptureVideoPreviewLayer layerWithSession:session];
    [previewLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    [self.layer addSublayer:previewLayer];
    self.session = session;
    self.output = output;
    self.previewLayer = previewLayer;
}

- (void)initializeMaskView {
    self.maskView = [[SRMScannerMaskView alloc] init];
    self.maskView.maskColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
    [self addSubview:self.maskView];
    [self.maskView srm_addEdgesConstraintsEqualToView:self];
}

- (void)initializeTargetView {
    SRMScannerTargetView *targetView = [[SRMScannerTargetView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    targetView.cornerWidth = 3;
    targetView.cornerLength = 20;
    targetView.cornerColor = [UIColor whiteColor];
    targetView.borderWidth = 1;
    targetView.borderColor = [UIColor lightGrayColor];
    [self addSubview:targetView];
    self.targetView = targetView;
}

- (CGRect)convertCaptureRectFromInterestRect:(CGRect)interestRect {
    CGFloat fullWidth = CGRectGetWidth(self.frame);
    CGFloat fullHeight = CGRectGetHeight(self.frame);
    CGFloat interestX = interestRect.origin.x;
    CGFloat interestY = interestRect.origin.y;
    CGFloat interestWidth = interestRect.size.width;
    CGFloat interestHeight = interestRect.size.height;
    CGFloat ratioX = (fullWidth - interestWidth - interestX) / fullWidth;
    CGFloat ratioY = interestY / fullHeight;
    CGFloat ratioWidth = interestWidth / fullWidth;
    CGFloat ratioHeight = interestHeight / fullHeight;

    return CGRectMake(ratioY, ratioX, ratioHeight, ratioWidth);
}

@end
