//
//  MainViewController.m
//  MediaShower
//
//  Created by Ben J Brown on 4/17/10.
//  Copyright Telestream 2010. All rights reserved.
//

#import "MainViewController.h"


@implementation MainViewController
@synthesize landscapeViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
		{
			[self initURLs];
			isShowing = NO;
			isShowingLandscapeView = NO;
			self.landscapeViewController = [[[ThumbNailViewController alloc]
											 initWithNibName:@"ThumbNailView" bundle:nil] autorelease];
			self.landscapeViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
			
		}
    }
    return self;
}

- (void)initURLs
{
	arrayOfURLs = [[NSMutableArray alloc] initWithCapacity:6];
	
	[arrayOfURLs addObject:[self bundleURLWithMovieName:@"dv_iPhone_320x240" ofType:@"m4v"]];
	[arrayOfURLs addObject:[self bundleURLWithMovieName:@"720p5994-prores-hq_iPhone_320x240" ofType:@"m4v"]];
	[arrayOfURLs addObject:[self bundleURLWithMovieName:@"ranajune-iPhone-cell" ofType:@"3gp"]];
	[arrayOfURLs addObject:[self bundleURLWithMovieName:@"Heron-iPhone-cell" ofType:@"3gp"]];
	[arrayOfURLs addObject:[self bundleURLWithMovieName:@"Tahoe" ofType:@"3gp"]];
	[arrayOfURLs addObject:[self bundleURLWithMovieName:@"Piano_Player" ofType:@"3gp"]];
	
}	



- (void)viewWillAppear:(BOOL)animated
{
	
	NSURL* url = [arrayOfURLs objectAtIndex:0];
	NSString* str = [url path];
	textField1.text = str;

	url = [arrayOfURLs objectAtIndex:1];
	str = [url path];
	textField2.text = str;
	
	url = [arrayOfURLs objectAtIndex:2];
	str = [url path];
	textField3.text = str;
	
	url = [arrayOfURLs objectAtIndex:3];
	str = [url path];
	textField4.text = str;
	
	url = [arrayOfURLs objectAtIndex:4];
	str = [url path];
	textField5.text = str;
	
	url = [arrayOfURLs objectAtIndex:5];
	str = [url path];
	textField6.text = str;
	
	isShowing = YES;
}

- (void)viewDidDisappear:(BOOL)animated
{
	isShowing = NO;
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];
 [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
 [[NSNotificationCenter defaultCenter] addObserver:self
 selector:@selector(orientationChanged:)
 name:UIDeviceOrientationDidChangeNotification
 object:nil];
 }






- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc. that aren't in use.
}


- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


- (void)dealloc {
    [super dealloc];
}


- (void)orientationChanged:(NSNotification *)notification
{
    UIDeviceOrientation deviceOrientation = [UIDevice currentDevice].orientation;
    if (UIDeviceOrientationIsLandscape(deviceOrientation) &&
        !isShowingLandscapeView && isShowing)
    {
		self.landscapeViewController.arrayOfURLS = arrayOfURLs;
        [self presentModalViewController:self.landscapeViewController
                                animated:YES];
        isShowingLandscapeView = YES;
    }
    else if (deviceOrientation == UIDeviceOrientationPortrait &&
             isShowingLandscapeView)
    {
        [self dismissModalViewControllerAnimated:YES];
        isShowingLandscapeView = NO;
    }
}





-(NSURL *)bundleURLWithMovieName:(NSString*)name ofType:(NSString*)type
{
	NSBundle *bundle = [NSBundle mainBundle];
	NSString *moviePath = [bundle pathForResource:name ofType:type];
		
	if (moviePath) {
		return [NSURL fileURLWithPath:moviePath];
		//return [NSURL URLWithString:moviePath];
		
	} else {
		return nil;
	}
}


- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
	//NSString* type = [textField.text lastPathComponent];
	//NSString* name = [textField.text stringByDeletingPathExtension];
	NSString* text = textField.text;
	NSString* pref = nil;
	if ([text length] >6)
		pref = [text substringToIndex:7];
	
	NSURL* url;
	if ([pref isEqualToString:@"http://"])
		url = [NSURL URLWithString:text];
	else
		url = [NSURL fileURLWithPath:text];
	
	if (url != nil) {
		if (textField == textField1) {
			[arrayOfURLs replaceObjectAtIndex:0 withObject:url];
		}
		else if (textField == textField2) {
			[arrayOfURLs replaceObjectAtIndex:1 withObject:url];
		}
		else if (textField == textField3) {
			[arrayOfURLs replaceObjectAtIndex:2 withObject:url];
		}
		else if (textField == textField4) {
			[arrayOfURLs replaceObjectAtIndex:3 withObject:url];
		}
		else if (textField == textField5) {
			[arrayOfURLs replaceObjectAtIndex:4 withObject:url];
		}
		else if (textField == textField6) {
			[arrayOfURLs replaceObjectAtIndex:5 withObject:url];
		}
	}
	return YES;
}





@end
