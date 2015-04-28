//
//  BallViewController.m
//  Rolling_Ball
//
//  Created by Nathan Bisson on 2015-03-19.
//  Copyright (c) 2015 Nathan Bisson. All rights reserved.
//

#import "BallViewController.h"

// Make a define for the amount of time in seconds until the timer fires
#define SECONDS_UNTIL_FIRED 0.01

@interface BallViewController ()

// Make an integer to hold how many times the timer fired
@property int cycleCount;

// Make an NSTimer object for our timer
@property NSTimer * timer;


@end

@implementation BallViewController

CGPoint position;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _cycleCount = 0;
    _touchOnRight = false;
    _touchOnLeft = false;
    _touchOnDown = false;
    _touchOnUp = false;
    
    if (_timer == nil)
    {
        // Initialize, and start the timer to run the callbackFunction when fired.
        // The time interval is a float value representing seconds until fired.
        // This can aslo be fractions of a second
        
        _timer = [NSTimer scheduledTimerWithTimeInterval:SECONDS_UNTIL_FIRED
                                                  target:self
                                                selector:@selector(callbackFunction)
                                                userInfo:nil
                                                 repeats:YES];
    }
    
    _screenRect = [[UIScreen mainScreen] bounds];
    _screenWidth = _screenRect.size.width;
    _screenHeight = _screenRect.size.height;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)callbackFunction
{
    // Add code to be executed when timer fires here
    _cycleCount ++;
    //NSString * cycleCountText = [[NSString alloc] initWithFormat:@"%i",_cycleCount];
    //NSLog(@"%@", cycleCountText);
    
    if(_touchOnRight == true) {
        if(_ballPicture.center.x < [[UIScreen mainScreen] bounds].size.width) {
            _ballPicture.center = CGPointMake(_ballPicture.center.x+position.x, _ballPicture.center.y+position.y);
            position = CGPointMake(2.5, 0.0);
        }
    } else if (_touchOnLeft == true) {
        if(_ballPicture.center.x > 0) {
            _ballPicture.center = CGPointMake(_ballPicture.center.x+position.x, _ballPicture.center.y+position.y);
            position = CGPointMake(-2.5, 0.0);
        }
    } else if (_touchOnUp == true) {
        if(_ballPicture.center.y > 0) {
            _ballPicture.center = CGPointMake(_ballPicture.center.x+position.x, _ballPicture.center.y+position.y);
            position = CGPointMake(0.0, -2.5);
        }
    } else if (_touchOnDown == true) {
        if(_ballPicture.center.y < [[UIScreen mainScreen] bounds].size.height) {
            _ballPicture.center = CGPointMake(_ballPicture.center.x+position.x, _ballPicture.center.y+position.y);
            position = CGPointMake(0.0, 2.5);
        }
        
    }
}

- (IBAction)stopTimer:(id)sender {
    // To stop the timer from running you must first make the timer invalid
    [_timer invalidate];
    
    // Then set the pointer to equal nil to show it is not in use
    _timer = nil;
}

- (IBAction)rightHold:(id)sender {
    _touchOnRight = true;
}

- (IBAction)rightRelease:(id)sender {
    _touchOnRight = false;
}

- (IBAction)leftHold:(id)sender {
    _touchOnLeft = true;
}

- (IBAction)leftRelease:(id)sender {
    _touchOnLeft = false;
}

- (IBAction)upHold:(id)sender {
    _touchOnUp = true;
}

- (IBAction)upRelease:(id)sender {
    _touchOnUp = false;
}

- (IBAction)downHold:(id)sender {
    _touchOnDown = true;
}

- (IBAction)downRelease:(id)sender {
    _touchOnDown = false;
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
