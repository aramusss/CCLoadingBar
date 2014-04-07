CCLoadingBar
============

This is my first public Library, hope u enjoy it!

CCLoadingBar is a simple loading bar for (exclusively) cocos2D. It's easy to undestrand and to implement (and to program aswell :)).

##Steps to use:
#####1 Add Library to your Project:
You will have to import CCLoadingBar.h and CCLoadingBar.m to your Cocos2D project. You will also have to import loadingbar.png!!

#####2 Import Library where you want to use CCLoadingBar:
You now will have to `#import "CCLoadingBar.h"` in any of your files you want to use this component.

#####3 Create your CCLoadingBar!
Where you create your component (in a Layer), you can copy and paste this to create your CCLoadingBar:
```
myLoadingBar = [[CCLoadingBar alloc] initWithColor:ccBLUE andMax: 10];
[self addChild:myLoadingBar];
```
#####4 Customize your CCLoadingBar!
You can set the color of the loading bar when it ends, aswell the time to disappear once it finished loading stuff:
```
[myLoadingBar setOnCompletitionColor:ccBLACK];
[myLoadingBar setTimeToDisappear:3.0];
```
#####5 That´s it! 
You now will have to load your things. How you make loading bar start load? You will have to make a step everytime you advance. For example, in this case when it's all correct it calls other method and then we make CCLoadingBar make an step:
```
if(isAllCorrect){
[self continueLoadingOtherStuff];
[myLoadingBar makeStep];
}
```
#####6 Please NOTE:
When you create a new CCLoadingBar, you should put in Max: parameter (`initWithColor:(color)andMax:(max)`) the same number of `[CCLoadingBar makeStep]` are in your code.
