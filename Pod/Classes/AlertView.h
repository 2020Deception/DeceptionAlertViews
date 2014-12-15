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
typedef void (^TestBlock)(BOOL cancelled, NSInteger buttonIndex);

@interface AlertView : UIAlertView

- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)message
                 ccancelBlock:(AlertCancelBlock)alertCancelBlock
             completionBlocks:(NSArray *)completionBlocks
            cancelButtonTitle:(NSString *)cancelButtonTitle
            otherButtonTitles:(NSArray *)otherButtonTitles;
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
                                    otherButtonTitles:(NSArray *)otherButtonTitles;

/*!
 * returns UIAlertController or UIAlertView based on OS version in the alertReturnBlock
 @param title title
 @param message message
 @param alertCancelBlock the block called if the cancel button is pressed
 @param completionBlocks array of completion blocks should go in order from the otherButtonTitles array. These are actual blocks in the array - > ^{}
 @param cancelButtonTitle cancel button title
 @param otherButtonTitles other button titles
 @param presentingViewController the presenting view controller
 @param animated determines if the presentation should be animated for UIAlertController <- does nothing for UIAlertView currently
 @param alertCompletionBlock completion handler once UIAlertController is dismissed <- does nothing for UIAlertView currently
 */
+ (void)returnAlertWithTitle:(NSString *)title
                     message:(NSString *)message
                 cancelBlock:(AlertCancelBlock)alertCancelBlock
            completionBlocks:(NSArray *)completionBlocks
           cancelButtonTitle:(NSString *)cancelButtonTitle
           otherButtonTitles:(NSArray *)otherButtonTitles
    presentingViewController:(UIViewController *)presentingViewController
                    animated:(BOOL)animated
             completionBlock:(AlertCompletionBlock)alertCompletionBlock;

@end