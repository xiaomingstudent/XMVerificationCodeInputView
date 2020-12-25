//
//  XMRhombusInputBox.m
//  XMVerificationCodeInputView_Example
//
//  Created by 李明 on 2020/12/25.
//  Copyright © 2020 402187526@qq.com. All rights reserved.
//

#import "XMRhombusInputBox.h"

@interface XMRhombusInputBox ()

@property(nonatomic) UILabel *textLabel;

@end

@implementation XMRhombusInputBox

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(context, 0.0, 0.0, 0.0, 1.0);
    CGContextSetLineWidth(context, 1.0);
    CGPoint aPoints[5];
    aPoints[0] =CGPointMake(0, rect.size.height/2.0);
    aPoints[1] =CGPointMake(rect.size.width/2.0, 0);
    aPoints[2] =CGPointMake(rect.size.width, rect.size.height/2.0);
    aPoints[3] =CGPointMake(rect.size.width/2.0 , rect.size.height);
    aPoints[4] =CGPointMake(0, rect.size.height/2.0);
    CGContextAddLines(context, aPoints, 5);
    CGContextDrawPath(context, kCGPathStroke);
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.textLabel.frame = self.bounds;
    [self setNeedsDisplay];
}

- (UIView *)prepareView {
    return self.textLabel;
}

- (UILabel *)textLabel {
    if (!_textLabel) {
        _textLabel = [[UILabel alloc] init];
        _textLabel.font = [UIFont boldSystemFontOfSize:20];
        _textLabel.textColor = [UIColor blackColor];
        _textLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _textLabel;
}

#pragma mark XMIndividualInputBoxProtocol

- (void)setInputBoxText:(NSString *)text {
    self.textLabel.text = text;
}

- (void)deleteInputBoxText {
    self.textLabel.text = @"";
}

- (NSString *)boxContent {
    return self.textLabel.text;
}


@end
