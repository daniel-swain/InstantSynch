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

@property (weak, nonatomic) IBOutlet UIView *videoView;

@end

@implementation PlayerViewController

@synthesize videoTitle, playToggle, stop, sync, unsync, address, playerView;

- (void)viewDidLoad {
    [super viewDidLoad];
    isPlaying = NO;
    
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

- (void)setVideoSourceType: (VideoSource) newSource {
    videoSourceType = newSource;
}

#pragma mark - Youtube Videos



/**
 *  Changes the icon for the playPause button.
 */
- (IBAction)togglePlayPause: (id) sender {
    if(!isPlaying) {
        [sender setBackgroundImage: [UIImage imageNamed:@"Play"] forState:UIControlStateNormal];
        isPlaying = YES;
    } else {
        [sender setBackgroundImage: [UIImage imageNamed:@"Pause"] forState:UIControlStateNormal];
        [videoTitle setText:@"Playing something."];
        isPlaying = NO;
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
