//
//  XMBaseInputBox.h
//  XMVerificationCodeInputView
//
//  Created by 李明 on 2020/12/25.
//

#import <UIKit/UIKit.h>
#import "XMIndividualInputBoxProtocol.h"


NS_ASSUME_NONNULL_BEGIN

@interface XMBaseInputBox : UIView<XMIndividualInputBoxProtocol>

- (UIView *)prepareView;

@end

NS_ASSUME_NONNULL_END
