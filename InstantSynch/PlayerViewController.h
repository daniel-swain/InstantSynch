//
//  PlayerViewController.h
//  InstantSynch
//
//  Created by danny on 11/6/14.
//  Copyright (c) 2014 Daniel Swain Jr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "YTPlayerView.h"

@interface PlayerViewController : UIViewController<YTPlayerViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *videoTitle;
@property (weak, nonatomic) IBOutlet UIButton *playToggle;
@property (weak, nonatomic) IBOutlet UIButton *stop;
@property (weak, nonatomic) IBOutlet UIButton *sync;
@property (weak, nonatomic) IBOutlet UIButton *unsync;
@property (weak, nonatomic) IBOutlet UITextField *address;
@property (weak, nonatomic) IBOutlet UITextField *startLoop;
@property (weak, nonatomic) IBOutlet UITextField *endLoop;
@property (weak, nonatomic) IBOutlet YTPlayerView *playerView;
-(IBAction)togglePlayPause:(id)sender;
@end
