//
//  XMUnderlienInputBox.h
//  Pods-XMVerificationCodeInputView_Example
//
//  Created by 李明 on 2020/12/22.
//

#import <UIKit/UIKit.h>
#import "XMIndividualInputBoxProtocol.h"


NS_ASSUME_NONNULL_BEGIN

@interface XMUnderlienInputBox : UIView<XMIndividualInputBoxProtocol>

@property(nonatomic) UIColor *textColor;

@property(nonatomic) UIFont *textFont;

@property(nonatomic) UIColor *boxTintColor;

@property(nonatomic) UIColor *boxTinetHilightedColor;

@end

NS_ASSUME_NONNULL_END
