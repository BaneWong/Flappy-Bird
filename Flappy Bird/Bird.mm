//
//  Bird.m
//  Flappy Bird
//
//  Created by newpolaris on 2/23/14.
//  Copyright 2014 newpolaris. All rights reserved.
//

#import "Bird.h"
#import "CCAnimation.h"

@implementation Bird

- (id)init {
    self = [super initWithSpriteFrameName:@"bird_normal.png"];
    if (!self) return nil;
    
    NSArray *birdSpriteNames = [NSArray arrayWithObjects:
                               @"bird_normal.png",
                               @"bird_up_0.png",
                               @"bird_up_1.png",
                               nil];
    
    NSMutableArray *frames = [[NSMutableArray alloc] init];
    
    for (id object in birdSpriteNames)
        [frames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache]
                          spriteFrameByName:object]];
    
    CCAnimation *animation = [CCAnimation animationWithSpriteFrames:frames delay:0.2];
    
    [self runAction:[CCRepeatForever actionWithAction
                     :[CCAnimate actionWithAnimation:animation]]];
    
    return self;
}
@end
