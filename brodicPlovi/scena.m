//
//  scena.m
//  brodicPlovi
//
//  Created by Anton Orzes on 27/03/16.
//  Copyright © 2016 Anton Orzes. All rights reserved.
//

#import "scena.h"
#import "kolekcijas.h"


@implementation scena

-(void)spremisve{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:pokupio forKey:@"pokupio"];
    [userDefaults synchronize];
}

-(void)ucitajsve{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    pokupio=[userDefaults objectForKey:@"pokupio"];
    NSLog(@"%@",pokupio);
}


-(void)didMoveToView:(SKView *)view {
    
    NSURL *Zvuk = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"zPada" ofType:@"mp3"]];
    zvuk1 = [[AVAudioPlayer alloc]initWithContentsOfURL:Zvuk error:nil];
    [zvuk1 setVolume: 1];
    [zvuk1 prepareToPlay];
    [self ucitajsve];
    if (pokupio.length<22) {
        pokupio=@"";
        for (int i=0; i<22; i++) {
            pokupio = [pokupio stringByAppendingString:@"0"];
        }
    }
    ma=0;
    tragovi= [[NSMutableArray alloc]init];
   
    more = [SKSpriteNode spriteNodeWithImageNamed:@"more3"];
    more.position = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    more.size = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height+20);
    more.zPosition=0;
    [self addChild:more];
  
    brod = [SKSpriteNode spriteNodeWithImageNamed:@"brododozgo"];
    brod.position = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    brod.size=CGSizeMake(self.size.height/6*0.37, self.size.height/6);
    brod.zPosition=5;
    [self addChild:brod];
    
    kontakt = [SKSpriteNode spriteNodeWithImageNamed:@"bomba"];
    kontakt.size = CGSizeMake(10, brod.size.height/3);
    kontakt.position = CGPointMake(0, 0);
    kontakt.zPosition=-1;
    [brod addChild:kontakt];
    
    osovina = [SKSpriteNode spriteNodeWithImageNamed:@"bomba"];
    osovina.size = CGSizeMake(5, 5);
    osovina.position = CGPointMake(0, brod.size.height/2);
    osovina.zPosition=1;
    [brod addChild:osovina];
    
    kormilo=[SKSpriteNode spriteNodeWithImageNamed:@"kazaljka"];
    kormilo.size=CGSizeMake(3, brod.size.height/5);
    kormilo.position = CGPointMake(0, kormilo.size.height/2);
    kormilo.zPosition=1;
    [osovina addChild:kormilo];
    
    propeler = [[SKNode alloc]init];
    propeler.position = CGPointMake(0, brod.size.height/2.5);
    [brod addChild:propeler];

    
    svijet = [[SKNode alloc]init];
    svijet.position = CGPointMake(self.size.width/2, self.size.height/2);
    [self addChild:svijet];
    kutkormila=0;
    dx=0;
    dy=0;
    double dimenzijeTipke = (self.size.width-60)/5;
    SKSpriteNode *tipka1 = [SKSpriteNode spriteNodeWithImageNamed:@"left"];
    tipka1.position = CGPointMake(10+dimenzijeTipke/2, 50);
    tipka1.size = CGSizeMake(dimenzijeTipke, dimenzijeTipke/1.4);
    tipka1.name=@"tipka1";
    tipka1.zPosition = 4;
    [self addChild:tipka1];
    zutatipka1 = [SKSpriteNode spriteNodeWithImageNamed:@"zutaTipka"];
    zutatipka1.position = CGPointMake(tipka1.position.x, tipka1.position.y+dimenzijeTipke/2.3);
    zutatipka1.size = CGSizeMake(dimenzijeTipke/2.5, dimenzijeTipke/2.5);
    zutatipka1.name=@"tipka1";
    zutatipka1.zPosition = 4;
    [self addChild:zutatipka1];
    
    SKSpriteNode *tipka2 = [SKSpriteNode spriteNodeWithImageNamed:@"right"];
    tipka2.position = CGPointMake(tipka1.position.x+dimenzijeTipke+10, 50);
    tipka2.size = CGSizeMake(dimenzijeTipke, dimenzijeTipke/1.4);
    tipka2.name=@"tipka2";
    tipka2.zPosition = 4;
    [self addChild:tipka2];
    zutatipka2 = [SKSpriteNode spriteNodeWithImageNamed:@"zutaTipka"];
    zutatipka2.position = CGPointMake(tipka2.position.x, tipka2.position.y+dimenzijeTipke/2.3);
    zutatipka2.size = CGSizeMake(dimenzijeTipke/2.5, dimenzijeTipke/2.5);
    zutatipka2.name=@"tipka2";
    zutatipka2.zPosition = 4;
    [self addChild:zutatipka2];
    
    SKSpriteNode *tipka3 = [SKSpriteNode spriteNodeWithImageNamed:@"on"];
    tipka3.position = CGPointMake(tipka2.position.x+dimenzijeTipke+10, 50);
    tipka3.size = CGSizeMake(dimenzijeTipke, dimenzijeTipke/1.4);
    tipka3.name=@"tipka3";
    tipka3.zPosition = 4;
    [self addChild:tipka3];
    crvenatipka = [SKSpriteNode spriteNodeWithImageNamed:@"crvenaTipka"];
    crvenatipka.position = CGPointMake(tipka3.position.x, tipka3.position.y+dimenzijeTipke/2.3);
    crvenatipka.size = CGSizeMake(dimenzijeTipke/2.5, dimenzijeTipke/2.5);
    crvenatipka.name=@"tipka3";
    crvenatipka.zPosition = 4;
    [self addChild:crvenatipka];
    
    SKSpriteNode *tipka4 = [SKSpriteNode spriteNodeWithImageNamed:@"off"];
    tipka4.position = CGPointMake(tipka3.position.x+dimenzijeTipke+10, 50);
    tipka4.size = CGSizeMake(dimenzijeTipke, dimenzijeTipke/1.4);
    tipka4.name=@"tipka4";
    tipka4.zPosition = 4;
    [self addChild:tipka4];
    zelenatipka = [SKSpriteNode spriteNodeWithImageNamed:@"zelenaTipka"];
    zelenatipka.position = CGPointMake(tipka4.position.x, tipka4.position.y+dimenzijeTipke/2.3);
    zelenatipka.size = CGSizeMake(dimenzijeTipke/2.5, dimenzijeTipke/2.5);
    zelenatipka.name=@"tipka4";
    zelenatipka.zPosition = 4;
    [self addChild:zelenatipka];

    
    SKSpriteNode *tipka5 = [SKSpriteNode spriteNodeWithImageNamed:@"collection"];
    tipka5.position = CGPointMake(tipka4.position.x+dimenzijeTipke+10, 50);
    tipka5.size = CGSizeMake(dimenzijeTipke, dimenzijeTipke/1.2);
    tipka5.name=@"tipka5";
    tipka5.zPosition = 4;
    [self addChild:tipka5];
    
    labela= [SKLabelNode labelNodeWithText:@"0"];
    labela.position  = CGPointMake(tipka5.position.x+60, 50);
    labela.fontSize = 20;
    [self addChild:labela];
    
    int n=1;
    NSArray *popisOtoka =@[@"otok1",@"otok2",@"otok3",@"otok4",@"otok5",@"otok6"];
    double r=self.frame.size.width/2;
    for (double a=0;a<21 ;a+=0.5) {
        NSString *imeOtoka= [popisOtoka objectAtIndex:arc4random()%popisOtoka.count];
        SKSpriteNode *otok = [SKSpriteNode spriteNodeWithImageNamed:imeOtoka];
        otok.size =CGSizeMake(self.size.width/3, self.size.width/3);
        otok.name = @"otok";
        otok.zPosition=1;
        otok.position = CGPointMake(sin(a)*r, cos(a)*r);
        otok.accessibilityLabel=[NSString stringWithFormat:@"%d",n];
        [svijet addChild:otok];
        
        SKLabelNode *mlabela= [SKLabelNode labelNodeWithText:[NSString stringWithFormat:@"%d",n++]];
        mlabela.position  = CGPointMake(0, 0);
        mlabela.fontSize = 20;
        mlabela.fontName = @"AmericanTypewriter-Bold";
        mlabela.fontColor =[UIColor redColor];
        mlabela.zPosition=1;
        [otok addChild:mlabela];
        
        r+= otok.size.width/2;
        if(n>21) break;
    }
   
  
    [self startK];
    [self startM];
}


-(void)startK{
    
    if(!timerK)
    { timerK = [NSTimer scheduledTimerWithTimeInterval:0.02
                                                 target:self
                                               selector:@selector(kretanje)
                                               userInfo:nil
                                                repeats:YES];
        
    }
    
}

-(void)startM{
    
    if(!timerM)
    { timerM = [NSTimer scheduledTimerWithTimeInterval:0.1
                                                target:self
                                              selector:@selector(ljuljaj)
                                              userInfo:nil
                                               repeats:YES];
        
    }
    
}
-(void)ljuljaj{

    ma+=0.1;
    more.position=CGPointMake(self.size.width/2, self.size.height/2+sin(ma)*10);



}

-(void)kretanje{

    kutBroda-=kutkormila*brzina/50;
    brod.zRotation=kutBroda;
    labela.text= [NSString stringWithFormat:@"%.3f",brzina];
    CGPoint pp= svijet.position;
    pp.x+=sin(-kutBroda)*brzina;
    pp.y+=cos(kutBroda)*brzina;
    svijet.position=pp;
    
    if(brzina!=0){
        crvenatipka.texture=[SKTexture textureWithImageNamed:@"crvenaTipkaS"];
    }
    else
    {
        crvenatipka.texture=[SKTexture textureWithImageNamed:@"crvenaTipka"];
    }
    
    for (SKSpriteNode *nod in svijet.children ) {
        
        if ([nod.name isEqualToString:@"otok"] && [kontakt intersectsNode:nod]) {
            pp.x+=sin(-kutBroda+M_PI)*brzina;
            pp.y+=cos(kutBroda+M_PI)*brzina;
            svijet.position=pp;
            brzina=-0.2;
            break;
        }
        if ([nod.name isEqualToString:@"otok"] && [brod intersectsNode:nod]) {
            NSInteger b=[nod.accessibilityLabel integerValue];
            NSRange range= NSMakeRange(b-1, 1);
            if ([[pokupio substringWithRange:range] isEqualToString:@"0"]) {
                CGPoint mjestoOtoka = [self convertPoint:nod.position fromNode:svijet];
                [self baciInstrument:mjestoOtoka brod:brod.position];
                [zvuk1 play] ;
            }
            
            pokupio = [pokupio stringByReplacingCharactersInRange:range withString:@"1"];
            
           
        }

    }
    
    //ostavi trag

    CGPoint mjesto1 = [svijet convertPoint:propeler.position fromNode:brod];
    double d=hypotf(mjesto1.x-stariP.x, mjesto1.y -stariP.y);
    if(brzina>0 && d>10){
        
        SKSpriteNode *trag = [SKSpriteNode spriteNodeWithImageNamed:@"spark"];
        trag.position = mjesto1;
        trag.size = CGSizeMake(30, 30);
        trag.name=@"trag";
        trag.zPosition = 1;
        trag.alpha=0.1;
        [svijet addChild:trag];
        [tragovi addObject:trag];
        stariP=mjesto1;
    }
    
    if (tragovi.count>(brzina*30+1)) {
        
        for (double i=0; i<tragovi.count; i++) {
            [[tragovi objectAtIndex:i] setAlpha:i/(tragovi.count*5)];
            [[tragovi objectAtIndex:i] setSize:CGSizeMake(i/tragovi.count*30, i/tragovi.count*30)];
            //[[tragovi objectAtIndex:i] setSize:CGSizeMake(tragovi.count-i+20, tragovi.count-i+20)];
            }
        if (tragovi.count>0) {
            [[tragovi objectAtIndex:0] removeFromParent];
            [tragovi removeObjectAtIndex:0];
        }
    }else{
        for (double i=0; i<tragovi.count; i++) {
            [[tragovi objectAtIndex:i] setAlpha:i/(tragovi.count*5)];
            [[tragovi objectAtIndex:i] setSize:CGSizeMake(i/tragovi.count*30, i/tragovi.count*30)];
            //[[tragovi objectAtIndex:i] setSize:CGSizeMake(tragovi.count-i+20, tragovi.count-i+20)];
        }
    }
    
}

-(void)baciInstrument:(CGPoint)otokP brod:(CGPoint)brodP {

    SKSpriteNode *instrument = [SKSpriteNode spriteNodeWithImageNamed:@"instrumentt1"];
    instrument.position = otokP;
    instrument.size = CGSizeMake(30, 30);
    instrument.name=@"inst";
    instrument.zPosition = 4;
    [self addChild:instrument];
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, otokP.x, otokP.y);
    CGPathAddLineToPoint(path, NULL, (brodP.x+otokP.x)/2, brodP.y+100);
    CGPathAddLineToPoint(path, NULL, brodP.x, brodP.y);
    SKAction *followline = [SKAction followPath:path asOffset:NO orientToPath:NO duration:2.0];
    SKAction *removeNode = [SKAction removeFromParent];
    SKAction *sequence = [SKAction sequence:@[followline, removeNode]];
    [instrument runAction:sequence];
    [self spremisve];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
   
    for (UITouch *touch in touches) {
        CGPoint touchLocation = [touch locationInNode:self];
        SKSpriteNode *touchedNode = (SKSpriteNode *)[self nodeAtPoint:touchLocation];
        if([touchedNode.name isEqualToString:@"tipka1"])
        {
            zutatipka1.texture = [SKTexture textureWithImageNamed:@"zutaTipkaS"];
            if (kutkormila>-0.5) {
                kutkormila-=0.1;
                osovina.zRotation=kutkormila;
            }

        }
        if([touchedNode.name isEqualToString:@"tipka2"])
        {
            zutatipka2.texture = [SKTexture textureWithImageNamed:@"zutaTipkaS"];
            if (kutkormila<0.5) {
                kutkormila+=0.1;
                osovina.zRotation=kutkormila;
            }

        }
        if([touchedNode.name isEqualToString:@"tipka3"])
        {
            if (brzina<2) {
                brzina+=0.2;
            }
        }
        if([touchedNode.name isEqualToString:@"tipka4"])
        {
            zelenatipka.texture = [SKTexture textureWithImageNamed:@"zelenaTipkaS"];
            if (brzina>0) {
                brzina-=0.2;
            }
            else
            {
                brzina=0;
                crvenatipka.texture = [SKTexture textureWithImageNamed:@"crvenaTipka"];
            }
        }
        if([touchedNode.name isEqualToString:@"tipka5"])
        {
            [timerK invalidate];
            timerK = nil;
            [self spremisve];
            SKScene *kolekcijaScene = [[kolekcijas alloc]initWithSize:self.size];
            kolekcijaScene.scaleMode = SKSceneScaleModeAspectFill;
            SKTransition *tranzicija = [SKTransition pushWithDirection:SKTransitionDirectionDown duration:0.4];
            [self.view presentScene:kolekcijaScene transition:tranzicija];
            
        }

    }
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    zutatipka1.texture = [SKTexture textureWithImageNamed:@"zutaTipka"];
    zutatipka2.texture = [SKTexture textureWithImageNamed:@"zutaTipka"];
    zelenatipka.texture = [SKTexture textureWithImageNamed:@"zelenaTipka"];
}



@end
