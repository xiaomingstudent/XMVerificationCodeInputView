//
//  XMUnderlienInputBox.h
//  Pods-XMVerificationCodeInputView_Example
//
//  Created by 李明 on 2020/12/22.
//

#import <UIKit/UIKit.h>
#import "XMIndividualInputBoxProtocol.h"
#import "XMBaseInputBox.h"


NS_ASSUME_NONNULL_BEGIN

@interface XMUnderlienInputBox : XMBaseInputBox

@property(nonatomic) UIColor *textColor;

@property(nonatomic) UIFont *textFont;

@property(nonatomic) UIColor *boxTintColor;

@property(nonatomic) UIColor *boxTinetHilightedColor;

@property(nonatomic) CGFloat boxLineWidth;

@end

NS_ASSUME_NONNULL_END
