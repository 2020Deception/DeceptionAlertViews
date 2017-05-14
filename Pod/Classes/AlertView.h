//
//  AlertView.h
//  2DAlertViews
//
//  Created by 2020Deceptiononymous on 12/14/14.
//  Copyright (c) 2014 2020. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "Availability.h"

typedef void (^AlertCancelBlock)();
typedef void (^AlertCompletionBlock)();

NS_ASSUME_NONNULL_BEGIN

@interface AlertView : UIAlertController

/*!
 * shows a basic AlertView style controller with one button (animated = YES)
 */
+ (void)showAlertWithMessage:(NSString * _Nullable)message
           cancelButtonTitle:(NSString * _Nullable)cancelButtonTitle
    presentingViewController:(UIViewController *)presentingViewController;

/*!
 * shows a basic AlertView style controller with one button
 */
+ (void)showAlertWithMessage:(NSString * _Nullable)message
           cancelButtonTitle:(NSString * _Nullable)cancelButtonTitle
    presentingViewController:(UIViewController *)presentingViewController
                    animated:(BOOL)animated;

/*!
 * shows a basic AlertView style controller with one button
 */
+ (void)showAlertWithTitle:(NSString * _Nullable)title
                   message:(NSString * _Nullable)message
         cancelButtonTitle:(NSString * _Nullable)cancelButtonTitle
  presentingViewController:(UIViewController *)presentingViewController
                  animated:(BOOL)animated;

/*!
 * shows a basic AlertView style controller with one button
 */
+ (void)showAlertWithTitle:(NSString * _Nullable)title
                   message:(NSString * _Nullable)message
               cancelBlock:(AlertCancelBlock _Nullable)alertCancelBlock
         cancelButtonTitle:(NSString * _Nullable)cancelButtonTitle
  presentingViewController:(UIViewController *)presentingViewController
                  animated:(BOOL)animated
           completionBlock:(AlertCompletionBlock _Nullable)alertCompletionBlock;

/*!
 * shows a UIAlertController or UIAlertView based on OS version in the alertReturnBlock
 @param title title
 @param message message
 @param alertCancelBlock the block called if the cancel button is pressed
 @param completionBlocks array of completion blocks should go in order from the otherButtonTitles array. These are actual blocks in the array - > ^{}
 @param cancelButtonTitle cancel button title
 @param otherButtonTitles other button titles
 @param presentingViewController the presenting view controller
 @param type the type of alert
 @param animated determines if the presentation should be animated for UIAlertController <- does nothing for UIAlertView currently
 @param alertCompletionBlock completion handler once UIAlertController is dismissed <- does nothing for UIAlertView currently
 */
+ (void)showAlertWithTitle:(NSString * _Nullable)title
                   message:(NSString * _Nullable)message
               cancelBlock:(AlertCancelBlock _Nullable)alertCancelBlock
          completionBlocks:(NSArray * _Nullable)completionBlocks
         cancelButtonTitle:(NSString * _Nullable)cancelButtonTitle
         otherButtonTitles:(NSArray * _Nullable)otherButtonTitles
  presentingViewController:(UIViewController *)presentingViewController
                      type:(UIAlertControllerStyle)type
                  animated:(BOOL)animated
           completionBlock:(AlertCompletionBlock _Nullable)alertCompletionBlock;

/*!
 * returns a UIAlertController or UIAlertView based on OS version in the alertReturnBlock
 @param title title
 @param message message
 @param alertCancelBlock the block called if the cancel button is pressed
 @param completionBlocks array of completion blocks should go in order from the otherButtonTitles array. These are actual blocks in the array - > ^{}
 @param cancelButtonTitle cancel button title
 @param otherButtonTitles other button titles
 @param presentingViewController the presenting view controller
 @param type the type of alert
 @param animated determines if the presentation should be animated for UIAlertController <- does nothing for UIAlertView currently
 @param alertCompletionBlock completion handler once UIAlertController is dismissed <- does nothing for UIAlertView currently
 */
+ (id)returnAlertWithTitle:(NSString * _Nullable)title
                   message:(NSString * _Nullable)message
               cancelBlock:(AlertCancelBlock _Nullable)alertCancelBlock
          completionBlocks:(NSArray * _Nullable)completionBlocks
         cancelButtonTitle:(NSString * _Nullable)cancelButtonTitle
         otherButtonTitles:(NSArray * _Nullable)otherButtonTitles
  presentingViewController:(UIViewController *)presentingViewController
                      type:(UIAlertControllerStyle)type
                  animated:(BOOL)animated
           completionBlock:(AlertCompletionBlock _Nullable)alertCompletionBlock;

@end

NS_ASSUME_NONNULL_END
