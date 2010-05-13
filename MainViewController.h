//
//  MainViewController.h
//  MediaShower
//
//  Created by Ben J Brown on 4/17/10.
//  Copyright Telestream 2010. All rights reserved.
//

#import "ThumbNailViewController.h"

@interface MainViewController : UIViewController {
	BOOL isShowingLandscapeView;
	BOOL isShowing;
	ThumbNailViewController*	landscapeViewController;
	NSMutableArray* arrayOfURLs;
	IBOutlet UITextField *textField1,*textField2,*textField3,*textField4,*textField5,*textField6;
}

@property (nonatomic, retain)ThumbNailViewController* landscapeViewController;
-(NSURL *)bundleURLWithMovieName:(NSString*)name ofType:(NSString*)type;
- (void)initURLs;


@end
