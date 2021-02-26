//
//  XMBaseInputBox.m
//  XMVerificationCodeInputView
//
//  Created by 李明 on 2020/12/25.
//

#import "XMBaseInputBox.h"


@interface XMBaseInputBox()

@property(nonatomic) UIView *contentView;

@end

@implementation XMBaseInputBox

@synthesize cleared = _cleared;

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _contentView = [self prepareView];
        [self addSubview:_contentView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.contentView.frame = self.bounds;
}

//子类实现
- (UIView *)prepareView {
    NSAssert(NO, @"请由子类实现这个方法");
    return nil;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    return self;
}

#pragma mark XMIndividualInputBoxProtocol

- (void)setInputBoxText:(NSString *)text {
    NSAssert(NO, @"请由子类实现这个方法");
}

- (void)deleteInputBoxText {
    NSAssert(NO, @"请由子类实现这个方法");
}

- (NSString *)boxContent {
    NSAssert(NO, @"请由子类实现这个方法");
    return nil;
}


@end
