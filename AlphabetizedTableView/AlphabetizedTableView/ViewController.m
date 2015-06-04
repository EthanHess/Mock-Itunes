//
//  ViewController.m
//  AlphabetizedTableView
//
//  Created by Ethan Hess on 6/2/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "ViewController.h"
#import "Song.h"
#import "SongController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    
    NSString *key = [[[SongController sharedInstance] indexedSongs] allKeys][indexPath.section];
    
    Song *song = ((NSArray *)[[SongController sharedInstance] indexedSongs][key])[indexPath.row];
    
    cell.textLabel.text = song.title;
    cell.detailTextLabel.text = song.artist;
    
    return cell;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    SongController *songController = [SongController sharedInstance];
    
    NSDictionary *indexedSongs = [songController indexedSongs];
    
    NSArray *myKeys = [indexedSongs allKeys];
    
    NSString *key = myKeys[section];
    
    return [((NSArray *)[[SongController sharedInstance] indexedSongs][key]) count];

}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    return [[[SongController sharedInstance] indexedSongs] allKeys][section];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return [[[[SongController sharedInstance] indexedSongs] allKeys] count];
    
}

@end
