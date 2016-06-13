//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

-(NSArray *) allLocationNames{

    NSMutableArray *nameLocations = [[NSMutableArray alloc]init];
    
    for (FISLocation *location in self.locations){
        
        [nameLocations addObject:location.name];
    }
    
    return nameLocations;
}

-(FISLocation *) locationNamed:(NSString *)name{
    
    FISLocation *matchLocation = [[FISLocation alloc]init];
    
    for (FISLocation *location in self.locations){
        
        if ([location.name isEqualToString: name]){
            return matchLocation = location;
        }
        
    }
    
    return nil;
}
-(NSArray *) locationsNearLatitude:(CGFloat)latitude
                         longitude:(CGFloat)longitude
                            margin:(CGFloat)margin{
    
    NSMutableArray *matchLocation = [[NSMutableArray alloc]init];
    
    for (FISLocation *location in self.locations){
        
        if (location.latitude <= latitude + margin &&
            location.latitude >= latitude - margin &&
            location.longitude <= longitude + margin &&
            location.longitude >= longitude - margin){
            [matchLocation addObject:location];
        }
        
    }
    
    return matchLocation;
}

@end
