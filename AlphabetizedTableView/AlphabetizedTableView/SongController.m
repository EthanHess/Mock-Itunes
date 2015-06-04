//
//  SongController.m
//  AlphabetizedTableView
//
//  Created by Ethan Hess on 6/2/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "SongController.h"
#import "Song.h"

@implementation SongController

+ (SongController *)sharedInstance {
    static SongController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [SongController new];
    });
    
    return sharedInstance;
    
}

- (NSArray *)songs {
    
    NSMutableArray *array = [NSMutableArray new];
    
    Song *songOne = [Song new];
    songOne.title = @"Stairway To Heaven";
    songOne.artist = @"Led Zeppelin";
    [array addObject:songOne];
    
    Song *songTwo = [Song new];
    songTwo.title = @"Battle of Evermore";
    songTwo.artist = @"Led Zeppelin";
    [array addObject:songTwo];
    
    Song *songThree = [Song new];
    songThree.title = @"Californication";
    songThree.artist = @"Red Hot Chili Peppers";
    [array addObject:songThree];
    
    Song *songFour = [Song new];
    songFour.title = @"Under The Bridge";
    songFour.artist = @"Red Hot Chili Peppers";
    [array addObject:songFour];
    
    Song *songFive = [Song new];
    songFive.title = @"Layla";
    songFive.artist = @"Eric Clapton";
    [array addObject:songFive];
    
    Song *songSix = [Song new];
    songSix.title = @"Ecstacy";
    songSix.artist = @"ATB";
    [array addObject:songSix];
    
    return [array copy];
    
}

- (NSDictionary *)indexedSongs {
    
    NSMutableDictionary *indexedSongs = [NSMutableDictionary new];
    
    for (Song *song in self.songs) {
        
        NSString *sortString = song.artist;
        
        NSString *sortLetter = [sortString substringToIndex:1];
        
        BOOL foundKey = NO;
        
        for (NSString *key in [indexedSongs allKeys]) {
            
            if ([key isEqualToString:sortLetter]) {
                
                foundKey = YES;
            }
        }
        
        NSMutableArray *valueArray;
        
        if (foundKey) {
            valueArray = [((NSArray *)indexedSongs[sortLetter]) mutableCopy];
        }
        
        else {
            
            valueArray = [NSMutableArray new];
        }
        
        [valueArray addObject:song];
        indexedSongs[sortLetter] = [valueArray copy];
    }
    
    return [indexedSongs copy];
    
}
    
    
    
    




@end
