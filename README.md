# DeceptionAlertViews

[![CI Status](http://img.shields.io/travis/Anonymous/DeceptionAlertViews.svg?style=flat)](https://travis-ci.org/Anonymous/DeceptionAlertViews)
[![Version](https://img.shields.io/cocoapods/v/DeceptionAlertViews.svg?style=flat)](http://cocoadocs.org/docsets/DeceptionAlertViews)
[![License](https://img.shields.io/cocoapods/l/DeceptionAlertViews.svg?style=flat)](http://cocoadocs.org/docsets/DeceptionAlertViews)
[![Platform](https://img.shields.io/cocoapods/p/DeceptionAlertViews.svg?style=flat)](http://cocoadocs.org/docsets/DeceptionAlertViews)

## Usage

The method you will use for showing your alertviews will be :\n
+ (void)returnAlertWithTitle:(NSString *)title\n
                message:(NSString *)message\n
             cancelBlock:(AlertCancelBlock)alertCancelBlock\n
         completionBlocks:(NSArray *)completionBlocks\n
         cancelButtonTitle:(NSString *)cancelButtonTitle\n
         otherButtonTitles:(NSArray *)otherButtonTitles\n
   presentingViewController:(UIViewController *)presentingViewController\n
               animated:(BOOL)animated\n
          completionBlock:(AlertCompletionBlock)alertCompletionBlock;\n
Note : the alertCancelBlock is an actual block or ^{} that you will provide as the parameter and completionBlocks is an array of blocks you will pass in with the index corresponding the index of the button in the otherButtonTitles array.

## Requirements

This is designed to be used with apps that support iOS 4.3 thru iOS 8. Please use the latest commit (preferred) or latest version. It is back supported to iOS 4.3 but the class uses arc and currently doesn not support pre-arc apps.

## Installation

DeceptionAlertViews is available through [CocoaPods](http://cocoapods.org). To install it, simply add the following line to your Podfile:\n
    pod 'DeceptionAlertViews', :git => 'https://github.com/2020Deception/DeceptionAlertViews.git', :commit => '7a75bfdce57004e9240cccd6ba5b7f5aca52e187' (or latest commit number)

## Author

Anonymous, 2020deception@gmail.com

## License

DeceptionAlertViews is available under the MIT license. See the LICENSE file for more info.

