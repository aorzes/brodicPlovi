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

@interface scena : SKScene
{
    SKNode *svijet;
    SKSpriteNode *brod;
    SKSpriteNode *kontakt;
    SKSpriteNode *osovina;
    SKSpriteNode *kormilo;
    SKNode *propeler;
    double dx,dy;
    double kutkormila;
    double kutBroda;
    double brzina;
    CGPoint stariP;
    NSTimer *timerK;
    SKLabelNode *labela;
    NSMutableArray *tragovi;
    AVAudioPlayer *zvuk1;
    NSString *pokupio;
}
@end
