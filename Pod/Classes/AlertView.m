//
//  AlertView.m
//  2DAlertViews
//
//  Created by 2020Deceptiononymous on 12/14/14.
//  Copyright (c) 2014 2020. All rights reserved.
//

#import "AlertView.h"

static NSString * const kEmptyString = @"";

@interface AlertView()<UIAlertViewDelegate>

@property NSArray *completionBlocks;
@property (copy, nonatomic) AlertCompletionBlock dismissalBlock;
@property (copy, nonatomic) AlertCancelBlock cancelBlock;
@end

@implementation AlertView

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex==alertView.cancelButtonIndex) {
        if (self.cancelBlock) {
            void (^cancelBlock)() = self.cancelBlock;
            cancelBlock();
        }
    } else if (self.completionBlocks[buttonIndex-1]) {
        void (^completionBlock)() = self.completionBlocks[buttonIndex-1];
        completionBlock();
    }
}

#pragma mark - alert view

- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)message
                 ccancelBlock:(AlertCancelBlock)alertCancelBlock
             completionBlocks:(NSArray *)completionBlocks
            cancelButtonTitle:(NSString *)cancelButtonTitle
            otherButtonTitles:(NSArray *)otherButtonTitles {
    if ((self = [self initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil])) {
        self.delegate = self;
        self.cancelBlock = alertCancelBlock;
        self.completionBlocks = completionBlocks;
        for(NSString *otherButtonTitle in otherButtonTitles)
            [self addButtonWithTitle:otherButtonTitle];
    }
    
    return self;
}

#pragma mark - alert controller
/*!
 * creates UIAlertController
 @param title
 @param message
 @param alertCancelBlock the block called if the cancel button is pressed
 @param completionBlocks - array of completion blocks should go in order from cancel block to each index starting @0 from the otherButtonTitles array. These are actual blocks in the array - > ^{}
 @param cancelButtonTitle
 @param otherButtonTitles
 */
+ (UIAlertController *)createAlertControllerWithTitle:(NSString *)title
                                              message:(NSString *)message
                                         ccancelBlock:(AlertCancelBlock)alertCancelBlock
                                     completionBlocks:(NSArray *)completionBlocks
                                    cancelButtonTitle:(NSString *)cancelButtonTitle
                                    otherButtonTitles:(NSArray *)otherButtonTitles {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:alertCancelBlock]];
    if (completionBlocks.count > 0) {
        int i = 0;
        for (NSString *buttonTitle in otherButtonTitles) {
            [alert addAction:[UIAlertAction actionWithTitle:buttonTitle style:UIAlertActionStyleDefault handler:completionBlocks[i]]];
            i += 1;
        }
    }
    return alert;
}

#pragma mark - meat and potatoes

+ (void)returnAlertWithTitle:(NSString *)title
                     message:(NSString *)message
                 cancelBlock:(AlertCancelBlock)alertCancelBlock
            completionBlocks:(NSArray *)completionBlocks
           cancelButtonTitle:(NSString *)cancelButtonTitle
           otherButtonTitles:(NSArray *)otherButtonTitles
    presentingViewController:(UIViewController *)presentingViewController
                    animated:(BOOL)animated
             completionBlock:(AlertCompletionBlock)alertCompletionBlock {
    if (NSClassFromString(@"UIAlertController"))
        [presentingViewController presentViewController:[AlertView createAlertControllerWithTitle:title ? : kEmptyString message:message ? : kEmptyString ccancelBlock:alertCancelBlock completionBlocks:completionBlocks cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitles] animated:animated completion:alertCompletionBlock];
    else
        [[[AlertView alloc]initWithTitle:title ? : kEmptyString message:message ? : kEmptyString ccancelBlock:alertCancelBlock completionBlocks:completionBlocks cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitles] show];
    
}


@end
