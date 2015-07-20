//
//  AlertView.h
//  2DAlertViews
//
//  Created by 2020Deceptiononymous on 12/14/14.
//  Copyright (c) 2014 2020. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^AlertCancelBlock)();
typedef void (^AlertCompletionBlock)();

@interface AlertView : UIAlertView

/*!
 * shows a basic AlertView style controller with one button
 */
+ (void)showAlertWithTitle:(NSString *)title
                   message:(NSString *)message
         cancelButtonTitle:(NSString *)cancelButtonTitle
  presentingViewController:(UIViewController *)presentingViewController
                  animated:(BOOL)animated;

/*!
 * shows a basic AlertView style controller with one button
 */
+ (void)showAlertWithTitle:(NSString *)title
                   message:(NSString *)message
               cancelBlock:(AlertCancelBlock)alertCancelBlock
         cancelButtonTitle:(NSString *)cancelButtonTitle
  presentingViewController:(UIViewController *)presentingViewController
                  animated:(BOOL)animated
           completionBlock:(AlertCompletionBlock)alertCompletionBlock;

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
+ (void)showAlertWithTitle:(NSString *)title
                   message:(NSString *)message
               cancelBlock:(AlertCancelBlock)alertCancelBlock
          completionBlocks:(NSArray *)completionBlocks
         cancelButtonTitle:(NSString *)cancelButtonTitle
         otherButtonTitles:(NSArray *)otherButtonTitles
  presentingViewController:(UIViewController *)presentingViewController
                      type:(UIAlertControllerStyle)type
                  animated:(BOOL)animated
           completionBlock:(AlertCompletionBlock)alertCompletionBlock;

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
+ (id)returnAlertWithTitle:(NSString *)title
                   message:(NSString *)message
               cancelBlock:(AlertCancelBlock)alertCancelBlock
          completionBlocks:(NSArray *)completionBlocks
         cancelButtonTitle:(NSString *)cancelButtonTitle
         otherButtonTitles:(NSArray *)otherButtonTitles
  presentingViewController:(UIViewController *)presentingViewController
                      type:(UIAlertControllerStyle)type
                  animated:(BOOL)animated
           completionBlock:(AlertCompletionBlock)alertCompletionBlock;

@end