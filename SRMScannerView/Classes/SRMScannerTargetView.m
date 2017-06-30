//
//  SRMScannerTargetView.m
//  Pods
//
//  Created by marksong on 30/06/2017.
//
//

#import "SRMScannerTargetView.h"

@implementation SRMScannerTargetView

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

- (void)drawRect:(CGRect)rect {
    [self drawCornerWithRect:rect];
    [self drawBorderWithRect:rect];
}

#pragma mark - Private

- (void)initialize {
    self.backgroundColor = [UIColor clearColor];
}

- (void)drawCornerWithRect:(CGRect)rect {
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(contextRef, self.cornerWidth);
    CGContextSetStrokeColorWithColor(contextRef, self.cornerColor.CGColor);
    CGFloat inset = self.cornerWidth / 2;
    // Top Left
    [self addLineStartPoint:CGPointMake(inset, 0) endPoint:CGPointMake(inset, self.cornerLength) contextRef:contextRef];
    [self addLineStartPoint:CGPointMake(0, inset) endPoint:CGPointMake(self.cornerLength , inset) contextRef:contextRef];
    // Bottom Left
    [self addLineStartPoint:CGPointMake(inset, CGRectGetMaxY(rect)) endPoint:CGPointMake(inset, CGRectGetMaxY(rect) - self.cornerLength) contextRef:contextRef];
    [self addLineStartPoint:CGPointMake(0, CGRectGetMaxY(rect) - inset) endPoint:CGPointMake(self.cornerLength, CGRectGetMaxY(rect) - inset) contextRef:contextRef];
    // Top Right
    [self addLineStartPoint:CGPointMake(CGRectGetMaxX(rect), inset) endPoint:CGPointMake(CGRectGetMaxX(rect) - self.cornerLength, inset) contextRef:contextRef];
    [self addLineStartPoint:CGPointMake(CGRectGetMaxX(rect) - inset, 0) endPoint:CGPointMake(CGRectGetMaxX(rect) - inset, self.cornerLength) contextRef:contextRef];
    // Bottom Right
    [self addLineStartPoint:CGPointMake(CGRectGetMaxX(rect) - inset, CGRectGetMaxY(rect)) endPoint:CGPointMake(CGRectGetMaxX(rect) - inset, CGRectGetMaxY(rect) - self.cornerLength) contextRef:contextRef];
    [self addLineStartPoint:CGPointMake(CGRectGetMaxX(rect), CGRectGetMaxY(rect) - inset) endPoint:CGPointMake(CGRectGetMaxX(rect) - self.cornerLength, CGRectGetMaxY(rect) - inset) contextRef:contextRef];
    CGContextStrokePath(contextRef);
}

- (void)drawBorderWithRect:(CGRect)rect {
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(contextRef, self.borderWidth);
    CGContextSetStrokeColorWithColor(contextRef, self.borderColor.CGColor);
    CGRect borderRect = CGRectMake(rect.origin.x + self.cornerWidth, rect.origin.y + self.cornerWidth, rect.size.width - self.cornerWidth * 2, rect.size.height - self.cornerWidth * 2);
    CGContextAddRect(contextRef, borderRect);
    CGContextStrokePath(contextRef);
}

- (void)addLineStartPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint contextRef:(CGContextRef)contextRef{
    CGContextMoveToPoint(contextRef, startPoint.x, startPoint.y);
    CGContextAddLineToPoint(contextRef, endPoint.x, endPoint.y);
}

#pragma mark - Setter

- (void)setCornerColor:(UIColor *)cornerColor {
    _cornerColor = cornerColor;
    [self setNeedsDisplay];
}

- (void)setCornerWidth:(CGFloat)cornerWidth {
    _cornerWidth = cornerWidth;
    [self setNeedsDisplay];
}

- (void)setCornerLength:(CGFloat)cornerLength {
    _cornerLength = cornerLength;
    [self setNeedsDisplay];
}

- (void)setBorderColor:(UIColor *)borderColor {
    _borderColor = borderColor;
    [self setNeedsDisplay];
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    _borderWidth = borderWidth;
    [self setNeedsDisplay];
}

@end
