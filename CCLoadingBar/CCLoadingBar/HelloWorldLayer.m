//
//  HelloWorldLayer.m
//  CCLoadingBar
//
//  Created by Aram Miquel on 06/04/14.
//  Copyright __MyCompanyName__ 2014. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"
#import "CCLoadingBar.h"

@interface HelloWorldLayer()

//CCLoadingBar property:
@property CCLoadingBar* myBar;

//steps CCLoadingBar will have
@property int stepsToDo;

//step counter, used for the example. Not necessary:
@property int actualSteps;

@end

// HelloWorldLayer implementation
@implementation HelloWorldLayer



+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
    
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
    //init stepsToDo:
    self.stepsToDo = 80;
    
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
		
		// create and initialize a Label
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"CCLoadingBar" fontName:@"Marker Felt" fontSize:40];
        
        CCLabelTTF *labelAutor = [CCLabelTTF labelWithString:@"By Aram Miquel - Aramusss" fontName:@"Marker Felt" fontSize:14];

		// ask director the the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
	
		// position the label on the center of the screen
		label.position =  ccp( size.width /2 , size.height/2 );
        labelAutor.position = ccp( size.width - 100 , 50);
		
		// add the label as a child to this Layer
		[self addChild: label];
        [self addChild: labelAutor];
        //create CCLoadingBar
        self.myBar = [[CCLoadingBar alloc] initWithColor:ccBLUE andMax:self.stepsToDo];
        
        //set other blue color to be used once loading is completed
        ccColor3B ccSTEELBLUE={70,130,180};
        [self.myBar setOnCompletitionColor:ccSTEELBLUE];
        
        //set 2 seconds to disappear once completed.
        [self.myBar setTimeToDisappear:2.0];
        
        //set position for CCLoadingBar component
        self.myBar.position =  ccp( size.width /2 , size.height/2 - 50);
        
        //add CCLoadingBar as a child to the layer
        [self addChild:self.myBar];
        
        //start loading stuff.. (as an example)
        [self startLoadingThings];
        
	}
	return self;
}

/**
 * Will make steps every 0.2 seconds, as an example of how it would work.
 */
-(void)startLoadingThings{
    if(self.actualSteps != self.stepsToDo){
        self.actualSteps ++;
        
        //this method makes an step to the bar.
        [self.myBar makeStep];
        [self performSelector:@selector(startLoadingThings) withObject:self afterDelay:.2f];
    }
}
// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
