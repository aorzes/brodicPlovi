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
    SKSpriteNode  *more;
    SKSpriteNode  *zutatipka1;
    SKSpriteNode  *zutatipka2;
    SKSpriteNode  *zelenatipka;
    SKSpriteNode  *crvenatipka;
    double dx,dy;
    double kutkormila;
    double kutBroda;
    double brzina;
    double ma;
    CGPoint stariP;
    NSTimer *timerK;
    NSTimer *timerM;
    SKLabelNode *labela;
    NSMutableArray *tragovi;
    AVAudioPlayer *zvuk1;
    NSString *pokupio;
}
@end
