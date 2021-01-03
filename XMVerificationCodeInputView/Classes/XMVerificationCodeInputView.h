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
    XMVerificationCodeInputViewRetangle, //输入框为矩形框(如果需要为正方形 需自己计算boxspace)
    XMVerificationCodeInputViewCustom, //自定义输入框样式
};

@interface XMVerificationCodeInputView : UIView

@property (nonatomic) NSInteger textCount;

@property (nonatomic) XMVerificationCodeInputViewType boxType;
/**
 两个输入框之间的间距
 */
@property (nonatomic) CGFloat inputBoxSpace;
/**
输入以密码的形式展示
*/
@property(nonatomic) BOOL secureEntry;
/**
 输入完成之后的回调
 */

@property (nonatomic) void(^textDidInputComplete)(NSString *text);
/**
当前输入文本 可以利用KVO进行观察
 */
@property (nonatomic,readonly) NSString *text;

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
 下划线粗细 或者border粗细
 */
@property(nonatomic) CGFloat boxLineWidth;

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
