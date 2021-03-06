//
//  SLCLevelSelect.m
//  GravityRunner
//
//  Created by Student on 2014-04-23.
//  Copyright (c) 2014 edu.stlawrencetech. All rights reserved.
//

#import "SLCLevelSelect.h"
#import "SLCTextButtonNode.h"
#import "SLCGameScene.h"

@implementation SLCLevelSelect

-(id)initWithSize:(CGSize)size{
    
    if(self = [super initWithSize: size]) {
        self.anchorPoint = CGPointMake(0.5, 0.5);
        self.backgroundColor = [SKColor colorWithRed:.823529412 green:.956862745 blue:.968627451 alpha:1.0];
        
        //create background frame
        SKSpriteNode *bgFrame = [self frameWithSize:CGSizeMake(self.size.width * 0.6,
                                                               self.size.height * 0.6)];
        
        //bgFrame.alpha = 0.5;
        [self addChild:bgFrame];
        
        //Create the label
        SKLabelNode *titleLabel = [SKLabelNode labelNodeWithFontNamed:@"KenPixel Blocks"];
        titleLabel.fontSize = 55;
        titleLabel.fontColor = [SKColor blackColor];
        titleLabel.text = @"Level Select";
        titleLabel.position = CGPointMake(0,125);
        [self addChild:titleLabel];
        
        __unsafe_unretained typeof(self) weakSelf = self;
        NSArray *posMod = @[@-1, @0, @1];
        
        for(NSUInteger i = 1; i <= 3; i++) {
        
            //create the level select button
            SLCTextButtonNode *button = [[SLCTextButtonNode alloc] initWithImageNamed:@"green_button08"
                                                                                       size:CGSizeMake(bgFrame.size.width  * 0.2,
                                                                                                       bgFrame.size.height * 0.25)
                                                                                       text:[NSString stringWithFormat:@"%i", i]];
            button.position = CGPointMake((bgFrame.size.width / 3) * [posMod[i-1] integerValue], 0);
            
            button.touchSound = @"button-fwd.caf";
            button.onTouch = ^{
                SKScene *scene = [[SLCGameScene alloc] initWithSize:weakSelf.scene.size level:i];
                scene.scaleMode = SKSceneScaleModeAspectFill;
                
                // Present the scene.
                [weakSelf.view presentScene:scene];
            };
            
            [self addChild:button];
        }
    }
    return self;
}
/**
 *  Creates a background frame of the given size.
 *
 *  @param size The frame size.
 *
 *  @return The initialized frame node.
 */
- (SKSpriteNode *)frameWithSize:(CGSize)size {
    SKSpriteNode *frame = [SKSpriteNode spriteNodeWithImageNamed:@"grey_panel"];
    
    frame.xScale = size.width  / frame.size.width;
    frame.yScale = size.height / frame.size.height;
    
    return frame;
}
@end
