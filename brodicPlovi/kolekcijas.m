//
//  scena.m
//  brodicPlovi
//
//  Created by Anton Orzes on 27/03/16.
//  Copyright © 2016 Anton Orzes. All rights reserved.
//

#import "scena.h"
#import "kolekcijas.h"


@implementation kolekcijas

-(void)ucitajsve{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    pokupio=[userDefaults objectForKey:@"pokupio"];
    NSLog(@"%@",pokupio);
}

-(void)didMoveToView:(SKView *)view {
    [self ucitajsve];
    NSLog(@"%@",pokupio);
    double dimenzija= (self.size.width-80)/3;
    double visinaPodloge = (dimenzija+20) * 7+40;
    podloga = [SKSpriteNode spriteNodeWithImageNamed:@"sivaPodloga"];
    podloga.size = CGSizeMake(self.view.frame.size.width, visinaPodloge);
    podloga.position = CGPointMake(self.view.frame.size.width/2, visinaPodloge/2);
    podloga.zPosition=2;
    [self addChild:podloga];
    //add scroll
    swipeDownRecognizer= [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
    swipeUpRecognizer= [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
    swipeUpRecognizer.direction     = UISwipeGestureRecognizerDirectionUp;
    swipeDownRecognizer.direction   = UISwipeGestureRecognizerDirectionDown;
    [self.view addGestureRecognizer:swipeDownRecognizer];
    [self.view addGestureRecognizer:swipeUpRecognizer];
    
    NSArray *imenamjesta=@[@"mjestaInstrumenta2",@"mjestaInstrumenta2",@"mjestaInstrumenta2",
                           @"mjestaInstrumenta2",@"mjestaInstrumenta1",@"mjestaInstrumenta2",
                           @"mjestaInstrumenta2",@"mjestaInstrumenta2",@"mjestaInstrumenta2",
                           @"mjestaInstrumenta3",@"mjestaInstrumenta4",@"mjestaInstrumenta5",
                           @"mjestaInstrumenta5",@"mjestaInstrumenta2",@"mjestaInstrumenta3",
                           @"mjestaInstrumenta3",@"mjestaInstrumenta2",@"mjestaInstrumenta1",
                           @"mjestaInstrumenta2",@"mjestaInstrumenta4",@"mjestaInstrumenta4"];
    
    NSArray *imenainstrumenata=@[@"instrumentt1",@"instrumentt2",@"instrumentt3",
                                 @"instrumentt4",@"instrumentt5",@"instrumentt6",
                                 @"instrumentt7",@"instrumentt8",@"instrumentt9",
                                 @"instrumentt10",@"instrumentt11",@"instrumentt12",
                                 @"instrumentt13",@"instrumentt14",@"instrumentt15",
                                 @"instrumentt16",@"instrumentt17",@"instrumentt18",
                                 @"instrumentt19",@"instrumentt20",@"instrumentt21"];
    int n=0;
    CGPoint polozaj;
    for (int i=0; i<7; i++) {
        for (int j=0; j<3; j++) {
            polozaj= CGPointMake((dimenzija+20)*j-self.size.width/2+dimenzija/2+20, (dimenzija+20)*i-visinaPodloge/2+dimenzija/2+30);
            SKSpriteNode *mjesto = [SKSpriteNode spriteNodeWithImageNamed:[imenamjesta objectAtIndex:n]];
            mjesto.size = CGSizeMake(dimenzija, dimenzija);
            mjesto.name = [NSString stringWithFormat:@"mj%d",n];
            mjesto.position = polozaj;
            mjesto.zPosition=2;
            [podloga addChild:mjesto];
            NSRange range= NSMakeRange(n, 1);
            if([[pokupio substringWithRange:range] isEqualToString:@"1"] ){
                SKSpriteNode *instrument = [SKSpriteNode spriteNodeWithImageNamed:[imenainstrumenata objectAtIndex:n]];
                instrument.size = CGSizeMake(dimenzija, dimenzija);
                instrument.name = [NSString stringWithFormat:@"in%d",n];
                instrument.zPosition=1;
                [mjesto addChild:instrument];
                SKSpriteNode *shadow = [SKSpriteNode spriteNodeWithImageNamed:[imenamjesta objectAtIndex:n]];
                shadow.size = mjesto.size;
                shadow.position = CGPointMake(mjesto.position.x-dimenzija/8, mjesto.position.y-dimenzija/8);
                shadow.blendMode = SKBlendModeAlpha;
                shadow.colorBlendFactor = 0.5;
                shadow.color = [SKColor blackColor];
                shadow.zPosition=1;
                shadow.alpha = 0.5;
                [podloga addChild:shadow];
                
            }
        
            n++;
        }
    }
    
    
}

- (void) handleSwipes: (UISwipeGestureRecognizer *)sender
{
    if (sender.direction == UISwipeGestureRecognizerDirectionDown && podloga.position.y>0)
    {
        CGFloat moveUp = -100.0f;
        [podloga runAction:[SKAction moveByX:0.0f y:moveUp duration:0.2]];
    }
    else if (sender.direction == UISwipeGestureRecognizerDirectionUp && podloga.position.y<self.size.height)
    {
        CGFloat moveDown = 100.0f;
        [podloga runAction:[SKAction moveByX:0.0f y:moveDown duration:0.2]];
    }
}



@end
