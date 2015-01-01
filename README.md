# DeceptionAlertViews

[![CI Status](http://img.shields.io/travis/Anonymous/DeceptionAlertViews.svg?style=flat)](https://travis-ci.org/Anonymous/DeceptionAlertViews)
[![Version](https://img.shields.io/cocoapods/v/DeceptionAlertViews.svg?style=flat)](http://cocoadocs.org/docsets/DeceptionAlertViews)
[![License](https://img.shields.io/cocoapods/l/DeceptionAlertViews.svg?style=flat)](http://cocoadocs.org/docsets/DeceptionAlertViews)
[![Platform](https://img.shields.io/cocoapods/p/DeceptionAlertViews.svg?style=flat)](http://cocoadocs.org/docsets/DeceptionAlertViews)

## Usage

Provide the following line in any classes that will be presenting a type of alertview -> #import "AlertView.h".
The method you will use for showing your alertviews will be :
+ (void)returnAlertWithTitle:(NSString *)title  
                message:(NSString *)message  
             cancelBlock:(AlertCancelBlock)alertCancelBlock  
         completionBlocks:(NSArray *)completionBlocks  
         cancelButtonTitle:(NSString *)cancelButtonTitle  
         otherButtonTitles:(NSArray *)otherButtonTitles  
   presentingViewController:(UIViewController *)presentingViewController  
               animated:(BOOL)animated  
          completionBlock:(AlertCompletionBlock)alertCompletionBlock;  
Note : the alertCancelBlock is an actual block or ^{} that you will provide as the parameter and completionBlocks is an array of blocks you will pass in with the index corresponding the index of the button in the otherButtonTitles array.  
An example implementation :  
    [AlertView returnAlertWithTitle:@"A Title" message:@"A Message" cancelBlock:^{  
        NSLog(@"cancel block called");  
    } completionBlocks:@[^{  
        NSLog(@"block one called"); 
    },^{  
        NSLog(@"block two called");  
    },^{  
        NSLog(@"block three called");  
    }] cancelButtonTitle:@"cancel" otherButtonTitles:@[@"one", @"two", @"three"] presentingViewController:self animated:YES completionBlock:^{  
        NSLog(@"completion block called");  
    }];  

## Requirements

This is designed to be used with apps that support iOS 4.3 thru iOS 8. Please use the latest commit (preferred) or latest version. It is back supported to iOS 4.3 but the class uses arc and currently doesn not support pre-arc apps.

## Installation

DeceptionAlertViews is available through [CocoaPods](http://cocoapods.org). To install it, simply add the following line to your Podfile:  
    pod 'DeceptionAlertViews', :git => 'https://github.com/2020Deception/DeceptionAlertViews.git', :commit => '7a75bfdce57004e9240cccd6ba5b7f5aca52e187' (or latest commit number)

## Author

Anonymous, 2020deception@gmail.com

## License

DeceptionAlertViews is available under the MIT license. See the LICENSE file for more info.

