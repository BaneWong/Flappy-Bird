//
//  Ground.m
//  Flappy Bird
//
//  Created by newpolaris on 2/26/14.
//  Copyright 2014 newpolaris. All rights reserved.
//

#import "Ground.h"
#import "GlobalVariable.h"

@implementation Ground

-(id)init {
    self = [super init];
    if (!self) return nil;
    
    // 백그라운드 앞의 땅을 설정한다.
    _ground1 = [CCSprite spriteWithSpriteFrameName:@"ground.png"];
    _ground1.anchorPoint = CGPointZero;
    
    // 가로 화면에 맞춰서 늘린다.
    [_ground1 setScale:gScale];
    
    [self addChild:_ground1];
    
    _ground2 = [CCSprite spriteWithSpriteFrameName:@"ground.png"];
    _ground2.anchorPoint = CGPointZero;
    
    // 가로 화면에 맞춰서 늘린다.
    [_ground2 setScale:gScale];
    [_ground2 setPosition:ccp([_ground1 boundingBox].size.width, 0)];
    
    [self addChild:_ground2];
    
    return self;
}

- (void)update:(ccTime)dt {
    // 화면 움직이는 속도, 현재 위치에 이동할 위치를 ccpAdd로 더하는 방식
    CGPoint groundScrollVel = ccp(-100, 0);
    
    // 현재 이미지1의 위치 값을 불러온다.
    CGPoint currentPos = [_ground1 position];
    
    // 1번 이미지가 스크롤 되서 사라지고, 2번 이미지가 1번 이미지의 초기 위치에 오면 최초위치로 이동
    if (currentPos.x < -[_ground1 boundingBox].size.width) {
        [_ground1 setPosition:CGPointZero];
        currentPos = ccp([_ground2 boundingBox].size.width, 0);
        [_ground2 setPosition:currentPos];
    // 현재 위치에서 groundScrollVel를 더한다.
    } else {
        _ground1.position = ccpAdd(ccpMult(groundScrollVel, dt),
                                   _ground1.position);
        _ground2.position = ccpAdd(ccpMult(groundScrollVel, dt),
                                   _ground2.position);
    }
}
- (void)onEnter {
    [super onEnter];
    [self scheduleUpdate];
}

@end
