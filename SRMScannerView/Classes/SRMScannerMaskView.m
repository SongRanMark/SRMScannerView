//
//  SRMScannerMaskView.m
//  Pods
//
//  Created by marksong on 30/06/2017.
//
//

#import "SRMScannerMaskView.h"

@implementation SRMScannerMaskView

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

- (void)initialize {
    self.backgroundColor = [UIColor clearColor];
}

- (void)drawRect:(CGRect)rect {
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(contextRef, self.maskColor.CGColor);
    CGContextFillRect(contextRef, rect);
    CGContextClearRect(contextRef, self.clearRect);
}

#pragma mark - Setter

- (void)setMaskColor:(UIColor *)maskColor {
    _maskColor = maskColor;
    [self setNeedsDisplay];
}

- (void)setClearRect:(CGRect)clearRect {
    _clearRect = clearRect;
    [self setNeedsDisplay];
}
@end
