//
//  CYAlertView.h
//  Ape_uni
//
//  Created by Chenyu Lan on 8/21/13.
//  Copyright (c) 2013 Fenbi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CYAlertView : UIAlertView

- (id)initWithTitle:(NSString *)title
            message:(NSString *)message
         clickedBlock:(void (^)(CYAlertView *alertView, BOOL cancelled, NSInteger buttonIndex))clickedBlock
  cancelButtonTitle:(NSString *)cancelButtonTitle
  otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;


@end
