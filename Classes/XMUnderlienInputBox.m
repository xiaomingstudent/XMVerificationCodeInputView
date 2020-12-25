//
//  XMUnderlienInputBox.m
//  Pods-XMVerificationCodeInputView_Example
//
//  Created by 李明 on 2020/12/22.
//

#import "XMUnderlienInputBox.h"

@interface XMUnderlienInputBox ()

@property(nonatomic) UILabel *textLabel;

@property(nonatomic) UIView *underLineView;

@end

@implementation XMUnderlienInputBox

//- (instancetype)initWithFrame:(CGRect)frame {
//    self = [super initWithFrame:frame];
//    if (self) {
//        
//    }
//    return self;
//}


- (void)layoutSubviews {
    
    self.textLabel.frame = self.bounds;
    self.underLineView.frame = CGRectMake(0, self.bounds.size.height-1, self.bounds.size.width, 1);
    
}


- (UIView *)underLineView {
    
    if (!_underLineView) {
        _underLineView = [[UIView alloc] init];
        _underLineView.backgroundColor = self.boxTintColor;
    }
    return _underLineView;
}


- (UILabel *)textLabel {
    
    if (!_textLabel) {
        _textLabel = [[UILabel alloc] init];
        _textLabel.textAlignment = NSTextAlignmentCenter;
        _textLabel.font = self.textFont;
        _textLabel.textColor = self.textColor;
    }
    return _textLabel;
    
}

#pragma mark XMIndividualInputBoxProtocol

- (void)setInputBoxText:(NSString *)text {
    
    self.textLabel.text = text;
    self.underLineView.backgroundColor = self.boxTinetHilightedColor;
}

- (void)deleteInputBoxText {
    
    self.textLabel.text = nil;
    self.underLineView.backgroundColor = self.boxTintColor;
    
}

- (NSString *)boxContent {
    return self.textLabel.text;
}


@end
