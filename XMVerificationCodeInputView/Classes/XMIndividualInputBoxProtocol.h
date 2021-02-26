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
//是否已被清除掉
@property(nonatomic) BOOL cleared;

- (void)setInputBoxText:(NSString *)text;

- (void)deleteInputBoxText;

- (NSString *)boxContent;

@end

NS_ASSUME_NONNULL_END
