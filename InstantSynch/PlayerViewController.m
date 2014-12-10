//
//  PlayerViewController.m
//  InstantSynch
//
//  Created by danny on 11/6/14.
//  Copyright (c) 2014 Daniel Swain Jr. All rights reserved.
//

#import "PlayerViewController.h"

typedef enum {
    kYOUTUBE = 0,
    kVIMEO,
    kDAILYMOTION
} VideoSource;

@interface PlayerViewController ()
{
    VideoSource videoSourceType;
    BOOL isPlaying;
}


@end

@implementation PlayerViewController

@synthesize videoTitle, playToggle, stop, sync, unsync, startLoop, endLoop, address, playerView;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.playerView.delegate = self;
    isPlaying = NO;
    NSString *sample = @"lrNH6pRDgpk";
    
    // Setup Title and Address
    [videoTitle setEditable:NO];
    [videoTitle setBackgroundColor:[UIColor clearColor]];
    [videoTitle setTextColor: [UIColor whiteColor]];
    
    [address setBackgroundColor: [UIColor clearColor]];
    [address setTextColor: [UIColor whiteColor]];
    
    address.clearsOnBeginEditing = YES;
    address.layer.cornerRadius=8.0f;
    address.layer.masksToBounds=YES;
    address.layer.borderColor=[[UIColor whiteColor]CGColor];
    address.layer.borderWidth= 1.0f;
    
    // Setup Buttons
    [playToggle setTitle:@"" forState:UIControlStateNormal];
    [stop setTitle:@"" forState:UIControlStateNormal];
    [sync setTitle:@"" forState:UIControlStateNormal];
    [unsync setTitle:@"" forState:UIControlStateNormal];
    
    [playToggle setBackgroundImage:[UIImage imageNamed:@"Play"] forState:UIControlStateNormal];
    [stop setBackgroundImage:[UIImage imageNamed:@"Stop"] forState:UIControlStateNormal];
    [sync setBackgroundImage:[UIImage imageNamed:@"Sync"] forState:UIControlStateNormal];
    [unsync setBackgroundImage:[UIImage imageNamed:@"Unsync"] forState:UIControlStateNormal];
    
    
    // Setup PlayerView
    NSDictionary *playerVars = @{
                                 @"controls" : @0,
                                 @"playsinline" : @1,
                                 @"autohide" : @1,
                                 @"showinfo" : @0,
                                 @"modestbranding" : @1
                                 };
    
    [playerView setPlaybackQuality:kYTPlaybackQualityHD1080];
    bool success = [playerView loadWithVideoId:sample playerVars:playerVars];
    
    if(!success) {
        NSLog(@"Failed to load video. ");
    } else if(startLoop.text.length != 0){
        isPlaying = YES;
        [address setText: sample];
        //[self loopVideo];
    } else {
        isPlaying = YES;
        [address setText: sample];
        [playerView playVideo];
    }
    
    if(!isPlaying) {
        [videoTitle setText:@"Nothing is playing."];
        [address setText:@"Enter a Youtube id."];
        [playerView setBackgroundColor: [UIColor clearColor]];
    }
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"BackgroundNoise"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Youtube Videos

/**
 *  Changes the icon for the playPause button.
 */
- (IBAction)togglePlayPause: (id) sender {
    if(!isPlaying) {
        [self setToPlay: sender];
    } else {
        [self setToPause: sender];
    }
}

/**
 *  Plays the video and sets the text.
 **/
-(void)setToPlay: (id) sender {
    
    NSString *title = address.text;
    [sender setBackgroundImage: [UIImage imageNamed:@"Play"] forState:UIControlStateNormal];
    NSString *paused = @"Paused:";
    [videoTitle setText:[paused stringByAppendingString:title]];
    if(playerView.playerState != kYTPlayerStatePaused)
    {
        [playerView pauseVideo];
    }
    isPlaying = YES;
}

/**
 *  Pauses the video and sets the text.
 **/
-(void)setToPause: (id) sender {
    
    NSString *title = address.text;
    [sender setBackgroundImage: [UIImage imageNamed:@"Pause"] forState:UIControlStateNormal];
    NSString *playing = @"Playing:";
    [videoTitle setText: [playing stringByAppendingString:title]];
    if(playerView.playerState != kYTPlayerStatePlaying) {
        [playerView playVideo];
    }
    isPlaying = NO;
}

/**
 *  Functionality for other buttons.
 **/
- (IBAction)buttonPressed:(id)sender {
    if(sender == self.stop) {
        [self.playerView stopVideo];
        isPlaying = NO;
        [videoTitle setText: @"Stopped."];
    } else if(sender == self.sync || sender == self.unsync) {
        //[self loopVideo];
        
    }
}


/**
 *  Loops the video at the given points. Currently not working.
 **/
/*
- (void) loopVideo {
    // call the same method on a background thread
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        if(self.playerView.playerState == kYTPlayerStatePlaying) {
            if(self.playerView.currentTime > endLoop.text.floatValue) {
                [self.playerView playVideoAt: startLoop.text.floatValue];
            }
        }
        dispatch_async(dispatch_get_main_queue(), ^(void) {
            
            //Stop your activity indicator or anything else with the GUI
            //Code here is run on the main thread
            
        });
    });
} 
 */


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
