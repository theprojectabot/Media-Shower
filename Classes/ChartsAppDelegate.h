//
//  ChartsAppDelegate.h
//  MediaShower
//
//  Created by Ben J Brown on 4/17/10.
//  Copyright Telestream 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainViewController;

@interface ChartsAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MainViewController *mainViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) MainViewController *mainViewController;

@end

