# DeceptionAlertViews

[![CI Status](http://img.shields.io/travis/Anonymous/DeceptionAlertViews.svg?style=flat)](https://travis-ci.org/Anonymous/DeceptionAlertViews)
[![Version](https://img.shields.io/cocoapods/v/DeceptionAlertViews.svg?style=flat)](http://cocoadocs.org/docsets/DeceptionAlertViews)
[![License](https://img.shields.io/cocoapods/l/DeceptionAlertViews.svg?style=flat)](http://cocoadocs.org/docsets/DeceptionAlertViews)
[![Platform](https://img.shields.io/cocoapods/p/DeceptionAlertViews.svg?style=flat)](http://cocoadocs.org/docsets/DeceptionAlertViews)

## Usage

Provide the following line in any classes that will be presenting a type of alertview ->  

```Objective-C
#import <DeceptionAlertViews/AlertView.h>
```  

The method you will use for showing a UIAlertView/UIAlertController will be :  
  
```Objective-C
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
```
  
To return an UIAlertView/UIAlertController use the following :  
  
```Objective-C
+ (void)returnAlertWithTitle:(NSString *)title  
                message:(NSString *)message  
            cancelBlock:(AlertCancelBlock)alertCancelBlock  
        completionBlocks:(NSArray *)completionBlocks  
        cancelButtonTitle:(NSString *)cancelButtonTitle  
        otherButtonTitles:(NSArray *)otherButtonTitles  
    presentingViewController:(UIViewController *)presentingViewController  
                type:(UIAlertControllerStyle)type
            animated:(BOOL)animated  
        completionBlock:(AlertCompletionBlock)alertCompletionBlock;  
```
  
Note : the alertCancelBlock is an actual block or ^{} that you will provide as the parameter and completionBlocks is an array of blocks you will pass in with the index corresponding the index of the button in the otherButtonTitles array.  
An example implementation :  

```Objective-C
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
```
  
## Requirements

This is designed to be used with apps that support iOS 4.3 thru iOS 8. Please use the latest commit (preferred) or latest version. It is back supported to iOS 4.3 but the class uses arc and currently does not support non-arc apps.

## Installation

DeceptionAlertViews is available through [CocoaPods](http://cocoapods.org). To install it, simply add the following line to your Podfile:  
pod 'DeceptionAlertViews', '~> 0.6.0'

## Author

Anonymous, 2020deception@gmail.com

## License

DeceptionAlertViews is available under the MIT license. See the LICENSE file for more info.

