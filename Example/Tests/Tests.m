//
//  DeceptionAlertViewsTests.m
//  DeceptionAlertViewsTests
//
//  Created by Anonymous on 12/14/2014.
//  Copyright (c) 2014 Anonymous. All rights reserved.
//

#import <DeceptionAlertViews/AlertView.h>
#import <XCTest/XCTest.h>

@interface DeceptionAlertViewTests : XCTestCase

@end

@implementation DeceptionAlertViewTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testProperAlert {
    if ([UIDevice currentDevice].systemVersion.integerValue>=8.0)
        XCTAssertTrue([[AlertView returnAlertWithTitle:nil
                                               message:nil
                                           cancelBlock:nil
                                      completionBlocks:nil
                                     cancelButtonTitle:nil
                                     otherButtonTitles:nil
                              presentingViewController:[[UIViewController alloc] init]
                                                  type:UIAlertControllerStyleAlert
                                              animated:YES
                                       completionBlock:nil] isKindOfClass:[UIAlertController class]]);
    else
        XCTAssertTrue([[AlertView returnAlertWithTitle:nil
                                           message:nil
                                       cancelBlock:nil
                                  completionBlocks:nil
                                 cancelButtonTitle:nil
                                 otherButtonTitles:nil
                              presentingViewController:[[UIViewController alloc] init]
                                                  type:UIAlertControllerStyleAlert
                                          animated:YES
                                   completionBlock:nil] isKindOfClass:[UIAlertView class]]);
}

- (void)testTypicalData {
    @try {
        [AlertView returnAlertWithTitle:@"title"
                                message:@"message"
                            cancelBlock:nil
                       completionBlocks:@[^{
            NSLog(@"test block one hit");
        }, ^{
            NSLog(@"test block two hit");
        }]
                      cancelButtonTitle:@"cancel"
                      otherButtonTitles:@[@"one", @"two"]
               presentingViewController:[[UIViewController alloc]init]
                                   type:UIAlertControllerStyleAlert
                               animated:YES
                        completionBlock:nil];
    }
    @catch (NSException *exception) {
        XCTAssertNil(exception, @"there is an exception in the base case");
    }
}

- (void)testEmptyData {
    @try {
        [AlertView returnAlertWithTitle:nil
                                message:nil
                            cancelBlock:nil
                       completionBlocks:nil
                      cancelButtonTitle:nil
                      otherButtonTitles:nil
               presentingViewController:[[UIViewController alloc] init]
                                   type:UIAlertControllerStyleAlert
                               animated:YES
                        completionBlock:nil];
    }
    @catch (NSException *exception) {
        XCTAssertNil(exception, @"there is an exception in the base case");
    }
}

@end
