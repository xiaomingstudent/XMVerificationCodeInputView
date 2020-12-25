//
//  XMSquareInputBox.m
//  XMVerificationCodeInputView
//
//  Created by 李明 on 2020/12/25.
//

#import "XMRectangleInputBox.h"

@interface XMRectangleInputBox ()

@property(nonatomic) UILabel* textLabel;

@end

@implementation XMRectangleInputBox

- (UIView *)prepareView {
    return self.textLabel;
}

- (UILabel *)textLabel {
    if (!_textLabel) {
        _textLabel = [[UILabel alloc] init];
        _textLabel.textColor = self.textColor;
        _textLabel.font = self.textFont;
        _textLabel.layer.borderWidth = 1.0;
        _textLabel.layer.borderColor = self.boxTintColor.CGColor;
        _textLabel.textAlignment = NSTextAlignmentCenter;
        _textLabel.layer.borderWidth = self.boxBorderWidth;
    }
    return _textLabel;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.textLabel.frame = self.bounds;
}

#pragma mark XMIndividualInputBoxProtocol

- (void)setInputBoxText:(NSString *)text {
    self.textLabel.text = text;
    self.textLabel.layer.borderColor = self.boxTinetHilightedColor.CGColor;
}

- (void)deleteInputBoxText {
    self.textLabel.text = @"";
    self.textLabel.layer.borderColor = self.boxTintColor.CGColor;
}

- (NSString *)boxContent {
    return self.textLabel.text;
}

#pragma mark setter

- (void)setTextFont:(UIFont *)textFont {
    _textFont = textFont;
    self.textLabel.font = textFont;
}

- (void)setTextColor:(UIColor *)textColor {
    _textColor = textColor;
    self.textLabel.textColor = textColor;
}

- (void)setBoxTintColor:(UIColor *)boxTintColor {
    _boxTintColor = boxTintColor;
    self.textLabel.layer.borderColor = boxTintColor.CGColor;
}

- (void)setBoxBorderWidth:(CGFloat)boxBorderWidth {
    _boxBorderWidth = boxBorderWidth;
    self.textLabel.layer.borderWidth = boxBorderWidth;
}

@end
