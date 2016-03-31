//
//  scena.h
//  brodicPlovi
//
//  Created by Anton Orzes on 27/03/16.
//  Copyright © 2016 Anton Orzes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>
#import <AVFoundation/AVFoundation.h>
#import "brodicView.h"

@interface kolekcijas : SKScene
{
    SKSpriteNode *podloga;
    NSString *pokupio;
    UISwipeGestureRecognizer *swipeDownRecognizer;
    UISwipeGestureRecognizer *swipeUpRecognizer;
}

@end
