//
//  CCLoadingBar.h
//  HideAndSeek
//
//  Created by Aram Miquel on 06/04/14.
//
//

#import "CCNode.h"
#import "cocos2d.h"

@interface CCLoadingBar : CCSprite

/**
 * Will initialize a CCLoadingBar using an image
 * @param pos The position of the CCLoadingBar
 * @param image The image to be used as CCLoadingBar
 * @param max The total of steps that CCLoadingBar will make.
 * @return CCLoadingBar
 */
-(id)initWithImage:(NSString*) image andMax:(int) max;

/**
 * Will initialize a CCLoadingBar using a color
 * @param pos The position of the CCLoadingBar
 * @param color The color to be used in CCLoadingBar
 * @param max The total of steps that CCLoadingBar will make.
 * @return CCLoadingBar
 */
-(id)initWithColor:(ccColor3B)color andMax:(int) max;

/**
 *  Will set the color to change when the bar is completed. Should only be used when it's initiated with color not with image.
 *  @param color The color CCLoadingBar will change to once completed.
 */
-(void)setOnCompletitionColor:(ccColor3B)color;

/**
 *  Will set the image to change once the bar is completed. Should only be used when it's initiated with image not with color.
 *  @param image The CCsprite to be used as completition.
 */
-(void)setOnCompletitionImage:(NSString*)image;
/**
 *  Will make the loadingBar load one step more. Once it completes, it changes the color/image to its final color/image.
 */
-(void)makeStep;

/**
 *  Setter for time to remove CCloadingbar once is 100% loaded.
 */
-(void)setTimeToDisappear:(float)timeToDisappear;

@end
