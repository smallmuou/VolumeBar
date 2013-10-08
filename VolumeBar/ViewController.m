//
//  ViewController.m
//  VolumeBar
//
//  Created by luyf on 13-2-28.
//  Copyright (c) 2013年 luyf. All rights reserved.
//

#import "ViewController.h"
#import "VolumeBar.h"

@interface ViewController ()
{
    UILabel *_label;
}
@end

@implementation ViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    CGRect frame = CGRectMake(100, 100, 0, 0);/* 大小由背景图决定 */
    VolumeBar *bar = [[VolumeBar alloc] initWithFrame:frame minimumVolume:0 maximumVolume:10];
    
    [bar addTarget:self action:@selector(onVolumeBarChange:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:bar];
    bar.currentVolume = 4;
    
    //label
    frame = bar.frame;
    frame.origin.y += frame.size.height+10;
    frame.size.height = 30;
    
    _label = [[UILabel alloc] initWithFrame:frame];
    [_label setTextAlignment:NSTextAlignmentCenter];
    [_label setBackgroundColor:[UIColor clearColor]];
    [_label setTextColor:[UIColor whiteColor]];
    
    [_label setText:[NSString stringWithFormat:@"Volume: %d", bar.currentVolume]];
    [self.view addSubview:_label];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Event
- (void)onVolumeBarChange:(id)sender
{
    VolumeBar *bar = sender;
    [_label setText:[NSString stringWithFormat:@"Volume: %d", bar.currentVolume]];
}

- (void)dealloc
{
    [_label release];
    _label = nil;
    
    [super dealloc];
}

@end
