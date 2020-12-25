//
//  XMVerificationCodeInputView.m
//  Pods-XMVerificationCodeInputView_Example
//
//  Created by 李明 on 2020/12/22.
//

#import "XMVerificationCodeInputView.h"
#import "XMIndividualInputBoxProtocol.h"
#import "XMUnderlienInputBox.h"

@interface XMVerificationCodeInputView ()<UITextFieldDelegate>

@property(nonatomic) UITextField *textField;

@property(nonatomic) NSMutableArray<id<XMIndividualInputBoxProtocol>> *inputBoxs;



@end

@implementation XMVerificationCodeInputView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
        _inputBoxs = [[NSMutableArray alloc] init];
        self.textCount = 4;
        self.text = @"";
    }
    return self;
    
}

- (void)initUI {
    
    self.textField = [[UITextField alloc] initWithFrame:self.bounds];
    //隐藏field光标
    [self.textField setTintColor:[UIColor clearColor]];
    self.textField.keyboardType = UIKeyboardTypeNumberPad;
    self.textField.delegate = self;
    [self addSubview:self.textField];
}

- (void)setTextCount:(NSInteger)textCount {
    
    _textCount = textCount;
    
    for (id<XMIndividualInputBoxProtocol> inputBox in self.inputBoxs) {
        if ([inputBox isKindOfClass:[UIView class]]) {
            [(UIView *)inputBox removeFromSuperview];
        }
    }
    
    [self.inputBoxs removeAllObjects];

    for (int i = 0; i < textCount; i++) {
        
        switch (self.boxType) {
            case XMVerificationCodeInputViewUnderline:{
                XMUnderlienInputBox *underlineBox =  [[XMUnderlienInputBox alloc] init];
                underlineBox.textColor = self.textColor;
                underlineBox.textFont = self.textFont;
                underlineBox.boxTintColor = self.boxTintColor;
                underlineBox.boxTinetHilightedColor = self.boxTinetHilightedColor;
                [self addSubview:underlineBox];
                [self.inputBoxs addObject:underlineBox];
            }
                break;
                
            default:
                break;
        }
    }
    
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    self.textField.frame = self.bounds;
    
    CGFloat boxWidth = (self.bounds.size.width - (self.textCount - 1) * self.inputBoxSpace)/self.textCount;
    
    for (int i = 0; i < self.textCount; i++) {
        id<XMIndividualInputBoxProtocol> inputBox = self.inputBoxs[i];
        
        if ([inputBox isKindOfClass:[UIView class]]) {
            [(UIView *)inputBox setFrame:CGRectMake(i*(boxWidth+24), 0, boxWidth, self.bounds.size.height)];
        }
    }
    
}

- (void)deleteAllInputBox {
    
    for (int i = 0;i < self.textCount; i++) {
        id<XMIndividualInputBoxProtocol> inputBox = self.inputBoxs[i];
        [inputBox deleteInputBoxText];
    }
}

#pragma mark firstResponder

- (void)becomeFirstResponder {
    [super becomeFirstResponder];
    [self.textField becomeFirstResponder];
}

- (void)resignFirstResponder {
    [super resignFirstResponder];
    [self.textField resignFirstResponder];
}

#pragma mark UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    if (string.length > 0) {
        for (int i = 0;i < self.textCount; i++) {
            
            id<XMIndividualInputBoxProtocol> inputBox = self.inputBoxs[i];
            if ([inputBox boxContent].length == 0) {
                [inputBox setInputBoxText:[string substringWithRange:NSMakeRange(i, 1)]];
                self.text = [self.text stringByAppendingFormat:@"%@",string];
                if (self.text.length == self.textCount && self.textDidInputComplete) {
                    self.textDidInputComplete(self.text);
                }
            }
        }
    }
    //此时为删除
    if (string.length == 0) {
        //倒序遍历
        for (int i = (int)self.textCount-1;i >= 0; i--) {
            id<XMIndividualInputBoxProtocol> inputBox = self.inputBoxs[i];
            
            if ([inputBox boxContent].length > 0) {
                [inputBox deleteInputBoxText];
                if (self.text.length > 0) {
                    self.text = [self.text substringWithRange:NSMakeRange(0, self.text.length - 1)];
                }
                break;
            }
        }
    }
    return NO;
}








@end
