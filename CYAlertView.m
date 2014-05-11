//
//  CYAlertView.m
//  Ape_uni
//
//  Created by Chenyu Lan on 8/21/13.
//  Copyright (c) 2013 Fenbi. All rights reserved.
//

#import "CYAlertView.h"

@interface CYAlertView () <UIAlertViewDelegate>

@property (copy, nonatomic) void (^clickedBlock)(CYAlertView *, BOOL, NSInteger);

@end

@implementation CYAlertView

- (id)initWithTitle:(NSString *)title
            message:(NSString *)message
       clickedBlock:(void (^)(CYAlertView *alertView, BOOL cancelled, NSInteger buttonIndex))clickedBlock
  cancelButtonTitle:(NSString *)cancelButtonTitle
  otherButtonTitles:(NSString *)otherButtonTitles, ...
{

    self = [self initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil ];

    if (self) {
        _clickedBlock = clickedBlock;
        va_list _arguments;
        va_start(_arguments, otherButtonTitles);
        for (NSString *key = otherButtonTitles; key != nil; key = (__bridge NSString *)va_arg(_arguments, void *)) {
            [self addButtonWithTitle:key];
        }
        va_end(_arguments);
    }
    return self;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    _clickedBlock(self, buttonIndex==self.cancelButtonIndex, buttonIndex);
}

@end
