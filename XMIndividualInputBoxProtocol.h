//
//  XMIndividualInputBoxProtocol.h
//  Pods-XMVerificationCodeInputView_Example
//
//  Created by 李明 on 2020/12/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol XMIndividualInputBoxProtocol <NSObject>

@required
- (void)setInputBoxText:(NSString *)text;

- (void)deleteInputBoxText;

- (NSString *)boxContent;

@end

NS_ASSUME_NONNULL_END
