//
//  FISLocation.m
//  locationTrivia-Objects
//
//  Created by Eldon Chan on 6/13/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISLocation.h"

@implementation FISLocation

-(instancetype)init{
    self = [self initWithName:@"" latitude:0 longitude:0];
    return self;
}

-(instancetype)initWithName:(NSString *)name
                   latitude:(CGFloat)latitude
                  longitude:(CGFloat)longtitude{
    
    self = [super init];
    
    if (self){
        _name = name;
        _latitude = latitude;
        _longitude = longtitude;
        _trivia = [[NSMutableArray alloc]init];
    }
    return self;
}

-(NSString *)stringByTruncatingNameToLength:(NSUInteger)length{
    
    NSString *truncatedString =[self.name substringToIndex:MIN (length, [self.name length])];
    
    return truncatedString;
}

-(BOOL)hasValidData{
    
    if ([self.name isEqualToString:@""] || self.name.length == 0){
        return NO;
    }
    
    if (self.latitude > 90.0 || self.latitude < -90.0 || self.longitude >= 180.0 || self.longitude <= -180.0){
        return NO;
    }
    
    return YES;
}

-(FISTrivium *)triviumWithMostLikes{
    
    if (self.trivia.count == 0){
        return nil;
    }
    
    
    NSSortDescriptor *sortTrivia = [NSSortDescriptor sortDescriptorWithKey:@"likes" ascending:NO];
    [self.trivia sortUsingDescriptors:@[sortTrivia]];
    return self.trivia[0];
    
    
}

@end
