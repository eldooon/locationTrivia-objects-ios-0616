//
//  FISLocation.h
//  locationTrivia-Objects
//
//  Created by Eldon Chan on 6/13/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISTrivium.h"

@interface FISLocation : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) CGFloat latitude;
@property (nonatomic) CGFloat longitude;
@property (nonatomic) NSMutableArray *trivia;

-(instancetype)init;
-(instancetype)initWithName:(NSString *)name
                   latitude:(CGFloat)latitude
                  longitude:(CGFloat)longtitude;
-(NSString *)stringByTruncatingNameToLength:(NSUInteger)length;
-(BOOL)hasValidData;
-(FISTrivium *)triviumWithMostLikes;

@end
