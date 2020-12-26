#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "XMBaseInputBox.h"
#import "XMIndividualInputBoxProtocol.h"
#import "XMRectangleInputBox.h"
#import "XMUnderlienInputBox.h"
#import "XMVerificationCodeInputView.h"
#import "XMVerificationField.h"

FOUNDATION_EXPORT double XMVerificationCodeInputViewVersionNumber;
FOUNDATION_EXPORT const unsigned char XMVerificationCodeInputViewVersionString[];

