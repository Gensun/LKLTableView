//
//  LKLTableViewDataSource.m
//  LookingEdu
//
//  Created by Genie Sun on 2019/10/24.
//  Copyright © 2019 LookingEdu. All rights reserved.
//

#import "LKLTableViewDataSource.h"
#import "LKLTableViewSection.h"
#import "LKLTableViewRow.h"
#import "LKLTableViewCellProtocol.h"

@interface LKLTableViewDataSource ()

@property (nonatomic, strong) NSMutableArray <LKLTableViewSection *> *sections;

@end

@implementation LKLTableViewDataSource

- (void)configureTableViewWithSection:(LKLTableViewSection *)section {
    if (section == nil) return;
    
    [self.sections removeAllObjects];
    [self.sections addObject:section];
}

- (void)configureTableViewWithSections:(NSArray<LKLTableViewSection *> *)sections {
    if (sections == nil) return;

    if (sections.count == 1) {
        [self configureTableViewWithSection:sections.firstObject];
        return;
    }
    
    [self.sections removeAllObjects];
    [self.sections addObjectsFromArray:sections];
}

- (NSArray<LKLTableViewSection *> *)allSections {
    return self.sections;
}

- (NSInteger)numberOfSections {
    return self.sections.count;
}

- (LKLTableViewRow *)rowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.sections.count <= indexPath.section) {
        return nil;
    }
    return [self.sections[indexPath.section] rowAtIndex:indexPath.row];
}

#pragma mark - UITableViewDataSource
//@required
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    LKLTableViewRow *row = [self rowAtIndexPath:indexPath];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:row.reuseIdentifier forIndexPath:indexPath];
    if ([cell respondsToSelector:@selector(configureWithData:)]) {
        [cell performSelector:@selector(configureWithData:) withObject:row.data];
    }
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    LKLTableViewSection *data = self.sections[section];
    return [data numberOfRows];
}

//@optional
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sections.count;
}

#pragma mark - getter
- (NSMutableArray<LKLTableViewSection *> *)sections {
    if (!_sections) {
        _sections = [NSMutableArray array];
    }
    return _sections;
}

@end
