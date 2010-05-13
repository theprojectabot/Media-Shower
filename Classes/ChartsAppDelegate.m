//
//  ChartsAppDelegate.m
//  MediaShower
//
//  Created by Ben J Brown on 4/17/10.
//  Copyright Telestream 2010. All rights reserved.
//

#import "ChartsAppDelegate.h"
#import "MainViewController.h"

@implementation ChartsAppDelegate


@synthesize window;
@synthesize mainViewController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
	MainViewController *aController = [[MainViewController alloc] initWithNibName:@"iPadMainView" bundle:nil];
	self.mainViewController = aController;
	[aController release];
	
    mainViewController.view.frame = [UIScreen mainScreen].applicationFrame;
	[window addSubview:[mainViewController view]];
    [window makeKeyAndVisible];
	
	return YES;
}


- (void)dealloc {
    [mainViewController release];
    [window release];
    [super dealloc];
}

@end
