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
/*!
 * creates UIAlertView
 @param title
 @param message
 @param alertCancelBlock the block called if the cancel button is pressed
 @param completionBlocks the array of completion blocks should go in order from cancel block to each index starting @0 from the otherButtonTitles array. These are actual blocks in the array - > ^{}
 @param cancelButtonTitle the cancel button title as an NSString
 @param otherButtonTitles the array of titles as NSStrings for the other button titles
 */
- (instancetype)initWithTitle:(NSString * _Nullable)title
                      message:(NSString * _Nullable)message
                  cancelBlock:(AlertCancelBlock _Nullable)alertCancelBlock
             completionBlocks:(NSArray * _Nullable)completionBlocks
            cancelButtonTitle:(NSString * _Nullable)cancelButtonTitle
            otherButtonTitles:(NSArray * _Nullable)otherButtonTitles {
    if ((self = [self initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil])) {
        self.delegate = self;
        self.cancelBlock = alertCancelBlock ? : ^{};
        self.completionBlocks = completionBlocks ? : @[];
        __unsafe_unretained typeof(self) weakSelf = self;
        [completionBlocks enumerateObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            __strong typeof(weakSelf) strongSelf = weakSelf;
            [strongSelf addButtonWithTitle:[(NSString *)otherButtonTitles[idx] length] > 0 ? otherButtonTitles[idx] : @""];
        }];
    }
    return self;
}

#pragma mark - alert controller
/*!
 * creates UIAlertController
 @param title
 @param message
 @param alertCancelBlock the block called if the cancel button is pressed
 @param completionBlocks the array of completion blocks should go in order from cancel block to each index starting @0 from the otherButtonTitles array. These are actual blocks in the array - > ^{}
 @param cancelButtonTitle the cancel button title as an NSString
 @param otherButtonTitles the array of titles as NSStrings for the other button titles
 */
+ (UIAlertController *)createAlertControllerWithTitle:(NSString * _Nullable)title
                                              message:(NSString * _Nullable)message
                                          cancelBlock:(AlertCancelBlock _Nullable)alertCancelBlock
                                     completionBlocks:(NSArray * _Nullable)completionBlocks
                                    cancelButtonTitle:(NSString * _Nullable)cancelButtonTitle
                                    otherButtonTitles:(NSArray * _Nullable)otherButtonTitles
                                                 type:(UIAlertControllerStyle)type {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:type];
    [alert addAction:[UIAlertAction actionWithTitle:cancelButtonTitle
                                              style:UIAlertActionStyleCancel
                                            handler:alertCancelBlock]];
    [completionBlocks enumerateObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [alert addAction:[UIAlertAction actionWithTitle:[(NSString *)otherButtonTitles[idx] length] > 0 ? otherButtonTitles[idx] : @""
                                                  style:UIAlertActionStyleDefault
                                                handler:completionBlocks[idx]]];
    }];
    return alert;
}

#pragma mark - meat and potatoes

+ (void)showAlertWithMessage:(NSString * _Nullable)message
           cancelButtonTitle:(NSString * _Nullable)cancelButtonTitle
    presentingViewController:(UIViewController *)presentingViewController {
    [AlertView showAlertWithTitle:nil
                          message:message
                      cancelBlock:nil
                cancelButtonTitle:cancelButtonTitle
         presentingViewController:presentingViewController
                         animated:YES
                  completionBlock:nil];
}

+ (void)showAlertWithMessage:(NSString * _Nullable)message
           cancelButtonTitle:(NSString * _Nullable)cancelButtonTitle
    presentingViewController:(UIViewController *)presentingViewController
                    animated:(BOOL)animated {
    [AlertView showAlertWithTitle:nil
                          message:message
                      cancelBlock:nil
                cancelButtonTitle:cancelButtonTitle
         presentingViewController:presentingViewController
                         animated:animated
                  completionBlock:nil];
}

+ (void)showAlertWithTitle:(NSString * _Nullable)title
                   message:(NSString * _Nullable)message
         cancelButtonTitle:(NSString * _Nullable)cancelButtonTitle
  presentingViewController:(UIViewController *)presentingViewController
                  animated:(BOOL)animated {
    [AlertView showAlertWithTitle:title
                          message:message
                      cancelBlock:nil
                cancelButtonTitle:cancelButtonTitle
         presentingViewController:presentingViewController
                         animated:animated
                  completionBlock:nil];
}

+ (void)showAlertWithTitle:(NSString * _Nullable)title
                   message:(NSString * _Nullable)message
               cancelBlock:(AlertCancelBlock _Nullable)alertCancelBlock
         cancelButtonTitle:(NSString * _Nullable)cancelButtonTitle
  presentingViewController:(UIViewController *)presentingViewController
                  animated:(BOOL)animated
           completionBlock:(AlertCompletionBlock _Nullable)alertCompletionBlock {
    [AlertView showAlertWithTitle:title
                          message:message
                      cancelBlock:alertCancelBlock
                 completionBlocks:nil
                cancelButtonTitle:cancelButtonTitle
                otherButtonTitles:nil
         presentingViewController:presentingViewController
                             type:UIAlertControllerStyleAlert
                         animated:animated
                  completionBlock:alertCompletionBlock];
}

+ (void)showAlertWithTitle:(NSString * _Nullable)title
                   message:(NSString * _Nullable)message
               cancelBlock:(AlertCancelBlock _Nullable)alertCancelBlock
          completionBlocks:(NSArray * _Nullable)completionBlocks
         cancelButtonTitle:(NSString * _Nullable)cancelButtonTitle
         otherButtonTitles:(NSArray * _Nullable)otherButtonTitles
  presentingViewController:(UIViewController *)presentingViewController
                      type:(UIAlertControllerStyle)type
                  animated:(BOOL)animated
           completionBlock:(AlertCompletionBlock _Nullable)alertCompletionBlock {
#ifdef DEBUG
    for (NSString *title in otherButtonTitles)
        if (title.length == 0)
            NSLog(@"WARNING : there needs to be a title for every button.");
    if (cancelButtonTitle.length == 0)
        NSLog(@"WARNING : there needs to be a title for the cancel button.");
    if (completionBlocks.count != otherButtonTitles.count)
        NSLog(@"WARNING : the count of the completionBlocks array should match your count of the otherButtonTitles array.");
#endif
    dispatch_async(dispatch_get_main_queue(), ^{
        id alert = [AlertView returnAlertWithTitle:title.length > 0 ? title : kEmptyString
                                           message:message.length > 0 ? message : kEmptyString
                                       cancelBlock:alertCancelBlock
                                  completionBlocks:completionBlocks
                                 cancelButtonTitle:cancelButtonTitle.length > 0 ? cancelButtonTitle : kEmptyString
                                 otherButtonTitles:otherButtonTitles
                          presentingViewController:presentingViewController
                                              type:(UIAlertControllerStyle)type
                                          animated:animated
                                   completionBlock:alertCompletionBlock];
        
        (NSClassFromString(@"UIAlertController")) ?
        [presentingViewController presentViewController:(UIAlertController *)alert animated:animated completion:alertCompletionBlock] :
        [(UIAlertView *)alert show];
    });
}

+ (id)returnAlertWithTitle:(NSString * _Nullable)title
                   message:(NSString * _Nullable)message
               cancelBlock:(AlertCancelBlock _Nullable)alertCancelBlock
          completionBlocks:(NSArray * _Nullable)completionBlocks
         cancelButtonTitle:(NSString * _Nullable)cancelButtonTitle
         otherButtonTitles:(NSArray * _Nullable)otherButtonTitles
  presentingViewController:(UIViewController *)presentingViewController
                      type:(UIAlertControllerStyle)type
                  animated:(BOOL)animated
           completionBlock:(AlertCompletionBlock _Nullable)alertCompletionBlock {

#ifdef DEBUG
    for (NSString *title in otherButtonTitles)
        if (title.length == 0)
            NSLog(@"WARNING : there needs to be a title for every button.");
    if (cancelButtonTitle.length == 0)
        NSLog(@"WARNING : there needs to be a title for the cancel button.");
    if (completionBlocks.count != otherButtonTitles.count)
        NSLog(@"WARNING : the count of the completionBlocks array should match your count of the otherButtonTitles array.");
#endif
    return (NSClassFromString(@"UIAlertController")) ?
    [AlertView createAlertControllerWithTitle:title.length > 0 ? title : kEmptyString
                                      message:message.length > 0 ? message : kEmptyString
                                  cancelBlock:alertCancelBlock
                             completionBlocks:completionBlocks
                            cancelButtonTitle:cancelButtonTitle.length > 0 ? cancelButtonTitle : kEmptyString
                            otherButtonTitles:otherButtonTitles
                                         type:(UIAlertControllerStyle)type] :
    
    [[AlertView alloc]initWithTitle:title.length > 0 ? title : kEmptyString
                            message:message.length > 0 ? message : kEmptyString
                        cancelBlock:alertCancelBlock
                   completionBlocks:completionBlocks
                  cancelButtonTitle:cancelButtonTitle.length > 0 ? cancelButtonTitle : kEmptyString
                  otherButtonTitles:otherButtonTitles];
}

@end
