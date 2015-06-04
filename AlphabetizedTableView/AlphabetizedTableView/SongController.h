//
//  SongController.h
//  AlphabetizedTableView
//
//  Created by Ethan Hess on 6/2/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SongController : NSObject

@property (strong, nonatomic, readonly) NSArray *songs;

+ (SongController *)sharedInstance;

- (NSDictionary *)indexedSongs;

@end
