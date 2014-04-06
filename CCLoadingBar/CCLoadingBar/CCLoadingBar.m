//
//  CCLoadingBar.m
//  HideAndSeek
//
//  Created by Aram Miquel on 06/04/14.
//
//

#import "CCLoadingBar.h"

@interface CCLoadingBar()

@property float actualPos;
@property float maxPos;
@property NSString* normalImage;
@property NSString* finishImage;
@property ccColor3B normalColor;
@property ccColor3B finishColor;
@property float timeToDisappear;

@end

@implementation CCLoadingBar

-(id)initWithImage:(NSString*) image andMax :(int)max{
    if(self = [super initWithFile:image]){
        self.normalImage = image;
        self.finishImage = image;
        self.maxPos = max;
        self.scaleX = 0;
        self.timeToDisappear = .5;
    }
    return self;
}

-(id)initWithColor:(ccColor3B)color andMax:(int)max{
    if(self = [super initWithFile:@"loadingbar.png"]){
        self.normalColor = color;
        self.finishColor = color;
        self.maxPos = max;
        self.color = color;
        self.scaleX = 0;
        self.timeToDisappear = .5;
    }
    return self;
}

-(void)setOnCompletitionColor:(ccColor3B)color{
    self.finishColor = color;
}

-(void)setOnCompletitionImage:(NSString *)image{
    self.finishImage = image;
}

-(void)makeStep{
    self.actualPos ++;
    float toScaleX =((self.actualPos*100)/self.maxPos)/100;
    NSLog(@"LOADINGBAR: %f", toScaleX);
    if(toScaleX != 1){
        self.scaleX = toScaleX;
    }else{
        self.color = self.finishColor;
        [NSTimer scheduledTimerWithTimeInterval:self.timeToDisappear target:self selector:@selector(removeSelf:) userInfo:nil repeats:NO];
    }
}

-(void)removeSelf:(NSTimer*)timer{
    [self removeFromParentAndCleanup:YES];
}

@end
