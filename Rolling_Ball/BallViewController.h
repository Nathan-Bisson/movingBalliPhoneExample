//
//  BallViewController.h
//  Rolling_Ball
//
//  Created by Nathan Bisson on 2015-03-19.
//  Copyright (c) 2015 Nathan Bisson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BallViewController : UIViewController

@property BOOL touchOnRight;
@property BOOL touchOnLeft;
@property BOOL touchOnDown;
@property BOOL touchOnUp;

@property (weak, nonatomic) IBOutlet UIImageView *ballPicture;

@property CGRect screenRect;
@property CGFloat screenWidth;
@property CGFloat screenHeight;

@end
