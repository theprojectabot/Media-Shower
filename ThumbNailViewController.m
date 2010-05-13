//
//  ThumbNailViewController.m
//  MediaShower
//
//  Created by Ben J Brown on 4/17/10.
//  Copyright Telestream 2010. All rights reserved.
//

#import "ThumbNailViewController.h"

@implementation ThumbNailViewController

@synthesize arrayOfMoviePlayerControllers, arrayOfViews;
@synthesize thumbNailTimer, thumbNailView1, thumbNailView2, thumbNailView3, thumbNailView4, thumbNailView5, thumbNailView6 ;
@synthesize startDate;
@synthesize player1, player2, player3, player4, player5, player6;
@synthesize arrayOfURLS;

@synthesize fullscreenMoviePlayerController;
@synthesize fullscreenMovieViewController;


#define MAXCOUNT = 5;

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
	
	//arrayOfViews = [NSArray	arrayWithObjects:thumbNailView1, thumbNailView2, thumbNailView3, thumbNailView4, thumbNailView5, nil];
	// arrayOfMoviePlayerControllers = [NSMutableArray arrayWithCapacity:5];
	
	//for(int i = 0; i<6; i++){
//		[arrayOfURLS addObject:aURL];
//	}
	
		//for(int i = 0 ; i < 5; i++)
	//	{
	//		[arrayOfMoviePlayerControllers addObject:[[MPMoviePlayerController alloc] initWithContentURL:aURL]];
	//	}
	//	
	whichScreen = 0;
	
	/*
	 player1 = [[MPMoviePlayerController alloc] initWithContentURL:aURL];//[arrayOfURLS objectAtIndex:0]];
	player2 = [[MPMoviePlayerController alloc] initWithContentURL:bURL];//[arrayOfURLS objectAtIndex:1]];
	player3 = [[MPMoviePlayerController alloc] initWithContentURL:cURL];//[arrayOfURLS objectAtIndex:2]];
	player4 = [[MPMoviePlayerController alloc] initWithContentURL:dURL];//[arrayOfURLS objectAtIndex:3]];
	player5 = [[MPMoviePlayerController alloc] initWithContentURL:eURL];//[arrayOfURLS objectAtIndex:4]];
	player6 = [[MPMoviePlayerController alloc] initWithContentURL:fURL];//[arrayOfURLS objectAtIndex:5]];
	 */
	
	
	
	//	[[NSNotificationCenter defaultCenter] addObserver:self
	//											 selector:@selector(myMoviePlaybackStateChanged:)
	//												 name:MPMoviePlayerPlaybackStateDidChangeNotification
	//											   object:playerLeft];
	//	[[NSNotificationCenter defaultCenter] addObserver:self
	//											 selector:@selector(myMoviePlaybackStateChanged:)
	//												 name:MPMoviePlayerPlaybackStateDidChangeNotification
	//											   object:playerRight];
	// START_HIGHLIGHT	
	//self.playerLeft.view.frame = self.leftView.bounds;
	//self.playerLeft.view.autoresizingMask = 
	UIViewAutoresizingFlexibleWidth |
	UIViewAutoresizingFlexibleHeight;
	
	UIViewAutoresizingFlexibleWidth |
	UIViewAutoresizingFlexibleHeight;
	
	//[self.rightView addSubview:playerRight.view];
	//[self.leftView addSubview:playerLeft.view];
	//[self startTimer];
	
	//[self.playerRight play];
	
	//[self.playerLeft play];
	
	
	//[self clickedOpenMovie:nil];
	
}

// hitTest
#pragma mark Touch Methods


- (void) touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event { 
    [super touchesBegan:touches withEvent:event];
    
    NSArray *allTouches = [touches allObjects]; 
    UITouch *touch = [touches anyObject];
    
    int count = [allTouches count];
    
    if (count == 1) {
        if ([touch tapCount] < 2) {
			if (CGRectContainsPoint([thumbNailView1 frame], [[allTouches objectAtIndex:0] locationInView:self.view])) {
				//[UIView beginAnimations:@"TouchDownAnimation" context:NULL];
//				[UIView setAnimationBeginsFromCurrentState:YES];
//				[UIView setAnimationDelegate:self];
//				[UIView setAnimationDidStopSelector:@selector(finishedTouchDownAnimation:finished:context:)];
//				[UIView setAnimationCurve:UIViewAnimationCurveLinear];
//				[UIView setAnimationDuration:0.25];
//				CGAffineTransform transform = CGAffineTransformMakeScale(1.1, 1.1);
//				beachBall.transform = transform;
//				beachBall.alpha = 0.85;
//				[UIView commitAnimations];
				//[player1 setContentURL:<#(NSURL *)contentURL#>
				[self playMovieAtURL:[self.arrayOfURLS objectAtIndex:0]];
				
			}else if(CGRectContainsPoint([thumbNailView2 frame], [[allTouches objectAtIndex:0] locationInView:self.view])) {
				[self playMovieAtURL:[self.arrayOfURLS objectAtIndex:1]];
			}else if(CGRectContainsPoint([thumbNailView3 frame], [[allTouches objectAtIndex:0] locationInView:self.view])) {
				[self playMovieAtURL:[self.arrayOfURLS objectAtIndex:2]];
			}else if(CGRectContainsPoint([thumbNailView4 frame], [[allTouches objectAtIndex:0] locationInView:self.view])) {
				[self playMovieAtURL:[self.arrayOfURLS objectAtIndex:3]];
			}else if(CGRectContainsPoint([thumbNailView5 frame], [[allTouches objectAtIndex:0] locationInView:self.view])) {
				[self playMovieAtURL:[self.arrayOfURLS objectAtIndex:4]];
			}else if(CGRectContainsPoint([thumbNailView6 frame], [[allTouches objectAtIndex:0] locationInView:self.view])) {
				[self playMovieAtURL:[self.arrayOfURLS objectAtIndex:5]];
			}
        }
    }
    
    if (count > 1) {
        touch1 = [[allTouches objectAtIndex:0] locationInView:self.view]; 
        touch2 = [[allTouches objectAtIndex:1] locationInView:self.view];
    }
    
} 


/*
-(NSURL *)movieURL
{
	NSBundle *bundle = [NSBundle mainBundle];
	NSString *moviePath = [bundle pathForResource:@"dv_iPhone_320x240" ofType:@"m4v"];
	
	//NSString *moviePath = [NSString stringWithFormat:@"http://localhost:1935/live/aStream/playlist.m3u8"];
	
	if (moviePath) {
		return [NSURL fileURLWithPath:moviePath];
		//return [NSURL URLWithString:moviePath];
		
	} else {
		return nil;
	}
}

-(NSURL *)movieURL2
{
	NSBundle *bundle = [NSBundle mainBundle];
	NSString *moviePath = 
	[bundle 
	 pathForResource:@"720p5994-prores-hq_iPhone_320x240" 
	 ofType:@"m4v"];
	if (moviePath) {
		return [NSURL fileURLWithPath:moviePath];
	} else {
		return nil;
	}
}

-(NSURL *)movieURL3
{
	NSBundle *bundle = [NSBundle mainBundle];
	NSString *moviePath = 
	[bundle 
	 pathForResource:@"ranajune" 
	 ofType:@"mov"];
	if (moviePath) {
		return [NSURL fileURLWithPath:moviePath];
	} else {
		return nil;
	}
}


-(NSURL *)movieURL4
{
	NSBundle *bundle = [NSBundle mainBundle];
	NSString *moviePath = 
	[bundle 
	 pathForResource:@"Heron"
	 ofType:@"m4v"];
	if (moviePath) {
		return [NSURL fileURLWithPath:moviePath];
	} else {
		return nil;
	}
}

-(NSURL *)movieURL5
{
	NSBundle *bundle = [NSBundle mainBundle];
	NSString *moviePath = 
	[bundle 
	 pathForResource:@"dv_iPhone_320x240" 
	 ofType:@"m4v"];
	if (moviePath) {
		return [NSURL fileURLWithPath:moviePath];
	} else {
		return nil;
	}
}

-(NSURL *)movieURL6
{
	NSBundle *bundle = [NSBundle mainBundle];
	NSString *moviePath = 
	[bundle 
	 pathForResource:@"720p5994-prores-hq_iPhone_320x240"
	 ofType:@"m4v"];
	if (moviePath) {
		return [NSURL fileURLWithPath:moviePath];
	} else {
		return nil;
	}
}
*/


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}


- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	self.thumbNailView6 = nil;
	self.thumbNailView1 = nil;
	self.thumbNailView2 = nil;
	self.thumbNailView3 = nil;
	self.thumbNailView4 = nil;
	self.thumbNailView5 = nil;
	
	
	
}


/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */
//
- (IBAction)clickedOpenMovie:(id)sender {
	
	//NSString *myString = [NSString stringWithFormat:@"http://localhost:1935/live/aStream/playlist.m3u8"];
	//NSString *myString = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"720p5994-prores-hq_iPhone_320x240.m4v"];
	//NSURL *myURL = [NSURL fileURLWithPath:myString];
	
	
	
	[self playMovieAtURL:sender];
	
}

-(IBAction)playSelection:(id)sender{
	//	if ([self.playerRight playbackState] == MPMoviePlaybackStatePlaying)
	//		[self.playerRight pause];
	nowTime = 0.0;
	[self.player1 play];
}


-(void)getThumbnail:(NSTimer *)timer
{
	if (whichScreen > 5)
		whichScreen = 0;
	
	double timeSinceStartingMovie = [startDate timeIntervalSinceNow];
	//if(timeSinceStartingMovie < 0)
	//	(timeSinceStartingMovie)*-1.0;
	
	//NSLog(@"%f",timeSinceStartingMovie);
	
	//NSLog(@"[self.arrayOfMoviePlayerControllers objectAtIndex:whichScreen] %@", [arrayOfMoviePlayerControllers objectAtIndex:0]);
	UIImage *thumbNail;
	
	switch (whichScreen) 
	{
		case 0:
			thumbNail = [player1 thumbnailImageAtTime:-timeSinceStartingMovie timeOption:MPMovieTimeOptionExact];
			[thumbNailView1 setImage:thumbNail];
			break;
		case 1:
			thumbNail = [player2 thumbnailImageAtTime:-timeSinceStartingMovie timeOption:MPMovieTimeOptionExact];
			[thumbNailView2 setImage:thumbNail];
		case 2:
			//thumbNail = [player3 thumbnailImageAtTime:-timeSinceStartingMovie timeOption:MPMovieTimeOptionExact];
			thumbNail = [player3 thumbnailImageAtTime:-timeSinceStartingMovie timeOption:MPMovieTimeOptionExact];
			[thumbNailView3 setImage:thumbNail];
		case 3:
			thumbNail = [player4 thumbnailImageAtTime:-timeSinceStartingMovie timeOption:MPMovieTimeOptionExact];
			[thumbNailView4 setImage:thumbNail];
		case 4:
			thumbNail = [player5 thumbnailImageAtTime:-timeSinceStartingMovie timeOption:MPMovieTimeOptionExact];
			[thumbNailView5 setImage:thumbNail];
		case 5:
			thumbNail = [player6 thumbnailImageAtTime:-timeSinceStartingMovie timeOption:MPMovieTimeOptionExact];
			[thumbNailView6 setImage:thumbNail];
		default:
			//UIImage *thumbNail = [player1 thumbnailImageAtTime:-timeSinceStartingMovie timeOption:MPMovieTimeOptionExact];
			//[thumbNailView1 setImage:thumbNail];
			
			break;
	}
	
	//UIImage *thumbNail = [[self.arrayOfMoviePlayerControllers objectAtIndex:whichScreen] thumbnailImageAtTime:-timeSinceStartingMovie timeOption:MPMovieTimeOptionExact];
	
	
	//[[arrayOfViews objectAtIndex:whichScreen] setImage:thumbNail];
	
	
	
	
	nowTime = nowTime + [thumbNailTimer timeInterval]*2;
	whichScreen++;
	
}

-(void)playMovieAtURL:(NSURL*)theURL
{
	//CGRect moviePlayerFrame = CGRectMake(20, 33, 100, 100);
	//UIView playerView = [[[UIView alloc] initWithFrame:moviePlayerFrame] autorelease];
	
	self.fullscreenMovieViewController = [[MPMoviePlayerViewController alloc]
														initWithContentURL:theURL];
	
	self.fullscreenMoviePlayerController = 	[fullscreenMovieViewController moviePlayer];
	
	/*
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(myMoviePlaybackStateChanged:)
												 name:MPMoviePlayerPlaybackStateDidChangeNotification
											   object:fullscreenMoviePlayerController];
	*/
	[self presentMoviePlayerViewControllerAnimated:fullscreenMovieViewController];
	
	

}

/*
-(void)myMoviePlaybackStateChanged:(NSNotification*)aNotification
{
	MPMoviePlayerController * thePlayerController = [aNotification object];
	if (fullscreenMoviePlayerController == thePlayerController) {
		if ([thePlayerController playbackState] == MPMoviePlaybackStatePaused) {

			//NSLog(@"thePlayerController address %@", thePlayerController); 
			//NSLog(@"[thePlayerController playbackState]; %d", [thePlayerController playbackState]);
			
			//[fullscreenMovieViewController release];
			[self startTimer];
			//[self performSelector:@selector(startTimer) withObject:nil afterDelay:1.5];
		}
	}
}
*/


- (void)startTimer
{
	self.startDate = [NSDate date];
	NSTimer* t = [NSTimer scheduledTimerWithTimeInterval: 0.015 target:self selector:@selector(getThumbnail:) userInfo:nil repeats: YES];
	self.thumbNailTimer = t;
}

 - (void)stopTimer
{
	if(thumbNailTimer){
		[thumbNailTimer invalidate];
		thumbNailTimer = nil;
	}
}


- (void)dealloc {
	
	[self stopTimer];
    [super dealloc];
}

- (void)viewWillAppear:(BOOL)animated
{
	self.player1 = [[MPMoviePlayerController alloc] initWithContentURL:[arrayOfURLS objectAtIndex:0]];
	self.player2 = [[MPMoviePlayerController alloc] initWithContentURL:[arrayOfURLS objectAtIndex:1]];
	self.player3 = [[MPMoviePlayerController alloc] initWithContentURL:[arrayOfURLS objectAtIndex:2]];
	self.player4 = [[MPMoviePlayerController alloc] initWithContentURL:[arrayOfURLS objectAtIndex:3]];
	self.player5 = [[MPMoviePlayerController alloc] initWithContentURL:[arrayOfURLS objectAtIndex:4]];
	self.player6 = [[MPMoviePlayerController alloc] initWithContentURL:[arrayOfURLS objectAtIndex:5]];
	[super viewWillAppear:animated];
}
   
- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
	[self startTimer];
}


- (void)viewWillDisappear:(BOOL)animated
{
	[self stopTimer];
	[super viewWillDisappear:animated];
}


@end
