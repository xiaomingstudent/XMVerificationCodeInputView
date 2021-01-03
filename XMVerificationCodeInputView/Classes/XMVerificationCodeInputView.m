//
//  XMVerificationCodeInputView.m
//  Pods-XMVerificationCodeInputView_Example
//
//  Created by 李明 on 2020/12/22.
//

#import "XMVerificationCodeInputView.h"
#import "XMIndividualInputBoxProtocol.h"
#import "XMUnderlienInputBox.h"
#import "XMRectangleInputBox.h"
#import "XMVerificationField.h"

@interface XMVerificationCodeInputView ()<UITextFieldDelegate>

@property(nonatomic) NSString *text;

@property(nonatomic) XMVerificationField *textField;

@property(nonatomic) NSMutableArray<id<XMIndividualInputBoxProtocol>> *inputBoxs;

@property(nonatomic) NSString *textFieldText;//为了解决textfield为空无法触发代理的问题

@end

@implementation XMVerificationCodeInputView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
        [self initSetting];
    }
    return self;
    
}

- (void)initSetting {
    self.inputBoxSpace = 20;
    self.inputBoxs = [[NSMutableArray alloc] init];
    self.textCount = 4;
    self.text = @"";
    self.textFieldText = @"";
    self.boxLineWidth = 1.0;
    self.textColor =
    self.boxTinetHilightedColor = [UIColor colorWithRed:236.0/255 green:50.0/255 blue:88.0/255 alpha:1.0];
    self.boxTintColor = [UIColor colorWithRed:43.0/255 green:46.0/255 blue:62.0/255 alpha:1.0];
    self.textColor = [UIColor colorWithRed:43.0/255 green:46.0/255 blue:62.0/255 alpha:1.0];
    self.textFont = [UIFont boldSystemFontOfSize:18];
}

- (void)initUI {
    
    self.textField = [[XMVerificationField alloc] initWithFrame:self.bounds];
    self.textField.hidden = YES;
    self.textField.keyboardType = UIKeyboardTypeNumberPad;
    self.textField.delegate = self;
    [self addSubview:self.textField];
}

- (void)setBoxType:(XMVerificationCodeInputViewType)boxType {
    _boxType = boxType;
    [self resetUI];
}

- (void)setTextCount:(NSInteger)textCount {
    
    _textCount = textCount;
    [self resetUI];
}

- (void)setCustomInputBox:(Class)customInputBox {
    _customInputBox = customInputBox;
    [self resetUI];
}

- (void)resetUI {
    for (id<XMIndividualInputBoxProtocol> inputBox in self.inputBoxs) {
        if ([inputBox isKindOfClass:[UIView class]]) {
            [(UIView *)inputBox removeFromSuperview];
        }
    }
    
    [self.inputBoxs removeAllObjects];

    for (int i = 0; i < self.textCount; i++) {
        
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
            case XMVerificationCodeInputViewRetangle:{
                XMRectangleInputBox *squareBox = [[XMRectangleInputBox alloc] init];
                squareBox.textColor = self.textColor;
                squareBox.textFont = self.textFont;
                squareBox.boxTintColor = self.boxTintColor;
                squareBox.boxTinetHilightedColor = self.boxTinetHilightedColor;
                squareBox.boxBorderWidth = self.boxLineWidth;
                [self addSubview:squareBox];
                [self.inputBoxs addObject:squareBox];
            }
                break;
            case  XMVerificationCodeInputViewCustom:{
                if (self.customInputBox) {
                    Class customClass = self.customInputBox;
                    id customInputView = [[customClass alloc] init];
                    if ([customInputView isKindOfClass:[UIView class]] && [customInputView conformsToProtocol:@protocol(XMIndividualInputBoxProtocol)] ) {
                        [self addSubview:customInputView];
                        [self.inputBoxs addObject:customInputView];
                    }
                    else {
                        NSAssert(NO, @"自定义输入框必须继承于UIView且遵循XMIndividualInputBoxProtocol协议");
                    }
                }
                else {
                    return;
                }
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
            [(UIView *)inputBox setFrame:CGRectMake(i*(boxWidth+self.inputBoxSpace), 0, boxWidth, self.bounds.size.height)];
        }
    }
    
}

- (void)deleteAllInputBox {
    for (int i = 0;i < self.textCount; i++) {
        id<XMIndividualInputBoxProtocol> inputBox = self.inputBoxs[i];
        [inputBox deleteInputBoxText];
        inputBox.cleared = YES;
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
        int start = 0;
        for (int i = 0;i < self.textCount; i++) {
            id<XMIndividualInputBoxProtocol> inputBox = self.inputBoxs[i];
            if ([inputBox boxContent].length == 0 && start < string.length) {
                if (start >= string.length) {
                    break;
                }
                inputBox.cleared = NO;
                [inputBox setInputBoxText:[string substringWithRange:NSMakeRange(start, 1)]];
                start++;
                self.text = [self.text stringByAppendingFormat:@"%@",string];
                self.textFieldText = [self.textFieldText stringByAppendingFormat:@" "];
                self.textField.text = self.textFieldText;
                if (self.secureEntry) {
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        [inputBox setInputBoxText:@"●"];
                    });
                }
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
                inputBox.cleared = YES;
                
                if (self.text.length > 0) {
                    self.text = [self.text substringWithRange:NSMakeRange(0, self.text.length - 1)];
                    self.textFieldText = [self.textFieldText substringWithRange:NSMakeRange(0, self.textFieldText.length - 1)];
                    self.textField.text = self.textFieldText;
                }
                break;
            }
        }
    }
    return NO;
}

#pragma mark setter

- (void)setTextColor:(UIColor *)textColor {
    
    _textColor = textColor;
    
    switch (self.boxType) {
        case XMVerificationCodeInputViewUnderline:
            for (XMUnderlienInputBox *box in self.inputBoxs ) {
                box.textColor = textColor;
            }
            break;
        case XMVerificationCodeInputViewRetangle:
            for (XMRectangleInputBox *box in self.inputBoxs ) {
                box.textColor = textColor;
            }
            break;
        default:
            break;
    }
    
}

- (void)setTextFont:(UIFont *)textFont {
    _textFont = textFont;
    
    switch (self.boxType) {
        case XMVerificationCodeInputViewUnderline:
            for (XMUnderlienInputBox *box in self.inputBoxs ) {
                box.textFont = textFont;
            }
            break;
        case XMVerificationCodeInputViewRetangle:
            for (XMRectangleInputBox *box in self.inputBoxs ) {
                box.textFont = textFont;
            }
            break;
        default:
            break;
    }
}


- (void)setBoxTinetHilightedColor:(UIColor *)boxTinetHilightedColor {
    _boxTinetHilightedColor = boxTinetHilightedColor;
    switch (self.boxType) {
        case XMVerificationCodeInputViewUnderline:
            for (XMUnderlienInputBox *box in self.inputBoxs ) {
                box.boxTinetHilightedColor = boxTinetHilightedColor;
            }
            break;
        case XMVerificationCodeInputViewRetangle:
            for (XMRectangleInputBox *box in self.inputBoxs ) {
                box.boxTinetHilightedColor = boxTinetHilightedColor;
            }
            break;
        default:
            break;
    }
    
}

- (void)setBoxTintColor:(UIColor *)boxTintColor {
    _boxTintColor = boxTintColor;
    switch (self.boxType) {
        case XMVerificationCodeInputViewUnderline:
            for (XMUnderlienInputBox *box in self.inputBoxs ) {
                box.boxTintColor = boxTintColor;
            }
            break;
        case XMVerificationCodeInputViewRetangle:
            for (XMRectangleInputBox *box in self.inputBoxs ) {
                box.boxTintColor = boxTintColor;
            }
            break;
        default:
            break;
    }
}

- (void)setBoxLineWidth:(CGFloat)boxLineWidth {
    _boxLineWidth = boxLineWidth;
    switch (self.boxType) {
        case XMVerificationCodeInputViewUnderline:
            for (XMUnderlienInputBox *box in self.inputBoxs ) {
                box.boxLineWidth = boxLineWidth;
            }
            break;
        case XMVerificationCodeInputViewRetangle:
            for (XMRectangleInputBox *box in self.inputBoxs ) {
                box.boxBorderWidth= boxLineWidth;
            }
            break;
        default:
            break;
    }
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *view = [super hitTest:point withEvent:event];
    if ([view conformsToProtocol:@protocol(XMIndividualInputBoxProtocol)]) {
        return self.textField;
    }
    return view;
}


@end
