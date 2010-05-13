//
//  PortraitViewController.h
//  MediaShower
//
//  Created by Ben J Brown on 4/17/10.
//  Copyright Telestream 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>


@protocol FlipsideViewControllerDelegate;


@interface ThumbNailViewController : UIViewController {
	//UIView *leftView;
	
	NSTimer *thumbNailTimer;
	
	UIImageView *thumbNailView1;
	UIImageView *thumbNailView2;
	UIImageView *thumbNailView3;
	UIImageView *thumbNailView4;
	UIImageView *thumbNailView5;
	UIImageView *thumbNailView6;
	
	
	NSArray *arrayOfViews;
	NSMutableArray *arrayOfMoviePlayerControllers;
	
	double nowTime;
	NSDate *startDate;
	
	NSInteger whichScreen;
	
	MPMoviePlayerController *player1;
	MPMoviePlayerController *player2;
	MPMoviePlayerController *player3;
	MPMoviePlayerController *player4;
	MPMoviePlayerController *player5;
	MPMoviePlayerController *player6;
	
	NSMutableArray *arrayOfURLS;
	
	MPMoviePlayerController* fullscreenMoviePlayerController;
	MPMoviePlayerViewController* fullscreenMovieViewController;
	
	CGPoint touch1;
    CGPoint touch2;
	
}	

@property (nonatomic, retain) IBOutlet UIView *leftView;


@property (nonatomic, retain) NSArray *arrayOfViews;
@property (nonatomic, retain) NSMutableArray *arrayOfMoviePlayerControllers;
@property (nonatomic, retain) NSMutableArray *arrayOfURLS;


@property (nonatomic, retain) IBOutlet UIImageView *thumbNailView1;
@property (nonatomic, retain) IBOutlet UIImageView *thumbNailView2;
@property (nonatomic, retain) IBOutlet UIImageView *thumbNailView3;
@property (nonatomic, retain) IBOutlet UIImageView *thumbNailView4;
@property (nonatomic, retain) IBOutlet UIImageView *thumbNailView5;
@property (nonatomic, retain) IBOutlet UIImageView *thumbNailView6;

@property (nonatomic, retain) NSTimer *thumbNailTimer;
@property (nonatomic, retain) NSDate *startDate;


@property (nonatomic, retain) MPMoviePlayerController *player1;
@property (nonatomic, retain) MPMoviePlayerController *player2;
@property (nonatomic, retain) MPMoviePlayerController *player3;
@property (nonatomic, retain) MPMoviePlayerController *player4;
@property (nonatomic, retain) MPMoviePlayerController *player5;
@property (nonatomic, retain) MPMoviePlayerController *player6;

@property (nonatomic, retain) MPMoviePlayerController *fullscreenMoviePlayerController;
@property (nonatomic, retain) MPMoviePlayerViewController *fullscreenMovieViewController;



- (IBAction)done;
- (IBAction)clickedOpenMovie:(id)sender;

-(IBAction)playSelection:(id)sender;


-(void)getThumbnail:(NSTimer *)timer;

-(void)playMovieAtURL:(NSURL*)theURL;
-(void)myMovieFinishedCallback:(NSNotification*)aNotification;
- (void)startTimer;
- (void)stopTimer;

@end



