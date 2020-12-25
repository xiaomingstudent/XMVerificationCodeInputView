//
//  XMVerificationCodeInputView.h
//  Pods-XMVerificationCodeInputView_Example
//
//  Created by 李明 on 2020/12/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, XMVerificationCodeInputViewType) {
    XMVerificationCodeInputViewUnderline, //输入框为下划线样式
    XMVerificationCodeInputViewSquare, //输入框为正方形框
    XMVerificationCodeInputViewCustom, //自定义输入框样式
};

@interface XMVerificationCodeInputView : UIView

@property (nonatomic) NSInteger textCount;

@property (nonatomic) XMVerificationCodeInputViewType boxType;
/**
 两个输入框之间的间距
 */
@property (nonatomic) CGFloat inputBoxSpace;

@property (nonatomic) void(^textDidInputComplete)(NSString *text);
/**
当前输入文本 可以利用KVO进行观察
 */
@property (nonatomic) NSString *text;

//以下为输入框的UI设置 当type == XMVerificationCodeInputViewCustom不生效

@property(nonatomic) UIColor *textColor;

@property(nonatomic) UIFont *textFont;

/**
 输入框的下划线 或者border的颜色
 */
@property(nonatomic) UIColor *boxTintColor;

/**
 输入框高亮下下划线或者border的颜色
 */
@property(nonatomic) UIColor *boxTinetHilightedColor;

/**
 自定义输入框的类 需要遵守XMIndividualInputBoxProtocol协议 当type == XMVerificationCodeInputViewCustom生效
 */
@property(nonatomic) Class customInputBox;

- (void)becomeFirstResponder;

- (void)resignFirstResponder;
/**
 删除所有输入框
 */
- (void)deleteAllInputBox;





@end

NS_ASSUME_NONNULL_END
