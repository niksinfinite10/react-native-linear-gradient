#import "BVLinearGradient.h"
#import "RCTConvert.h"
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@implementation BVLinearGradient

+ (Class)layerClass
{
  return [CAGradientLayer class];
}

- (CAGradientLayer *)gradientLayer
{
  return (CAGradientLayer *)self.layer;
}

- (void)setColors:(NSArray *)colorStrings
{
  NSMutableArray *colors = [NSMutableArray arrayWithCapacity:colorStrings.count];
    if(colorStrings.count > 1){
  for (NSString *colorString in colorStrings) {
    [colors addObject:(id)[RCTConvert UIColor:colorString].CGColor];
  }
    }
    else{
  [colors addObject:[UIColor colorWithWhite:0 alpha: 0].CGColor];
  [colors addObject:[UIColor colorWithWhite:0 alpha: 100].CGColor];
    }
  
  self.gradientLayer.colors = colors;
}

- (void)setStart:(CGPoint)start
{
  self.gradientLayer.startPoint = start;
}

- (void)setEnd:(CGPoint)end
{
  self.gradientLayer.endPoint = end;
}

- (void)setLocations:(NSArray *)locations
{
  self.gradientLayer.locations = locations;
}

@end
