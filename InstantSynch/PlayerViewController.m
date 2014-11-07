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
}

@property (weak, nonatomic) IBOutlet UIView *videoView;

@end

@implementation PlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setVideoSourceType: (VideoSource) newSource {
    videoSourceType = newSource;
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
