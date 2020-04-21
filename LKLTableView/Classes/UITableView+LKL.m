//
//  UITableView+LKL.m
//  LookingEdu
//
//  Created by Genie Sun on 2019/10/24.
//  Copyright © 2019 LookingEdu. All rights reserved.
//

#import "UITableView+LKL.h"
#import "LKLTableViewDataSource.h"
#import "LKLTableViewDelegate.h"
#import "LKLTableViewRow.h"
#import "LKLTableViewSection.h"
#import <objc/runtime.h>

static void *LKLTableViewDataSourceKey = @"lklTableViewDataSourceKey";
static void *LKLTableViewDelegateKey = @"lklTableViewDelegateKey";

@interface UITableView ()

@property (nonatomic, strong) LKLTableViewDataSource *lklDataSource;
@property (nonatomic, strong) LKLTableViewDelegate *lklDelegate;

@end

@implementation UITableView (LKL)

#pragma mark - set data source and delegate
- (void)setupProtocol {
    [self setupDataSource];
    [self setupDelegate];
}

- (void)setupDataSource {
    LKLTableViewDataSource *dataSource = [LKLTableViewDataSource new];
    [self configDataSource:dataSource];
}

- (void)setupDelegate {
    LKLTableViewDelegate *delagate = [LKLTableViewDelegate new];
    [self configDelegate:delagate];
}

- (void)configDataSource:(LKLTableViewDataSource *)dataSource {
    self.lklDataSource = dataSource;
}

- (void)configDelegate:(LKLTableViewDelegate *)delegate {
    self.lklDelegate = delegate;
}

#pragma mark - populate sections
- (void)configureTableViewWithSection:(LKLTableViewSection *)section {
    if (section == nil) return;

    [self.lklDataSource configureTableViewWithSection:section];
}

- (void)configureTableViewWithSections:(NSArray<LKLTableViewSection *> *)sections {
    if (sections == nil) return;

    if (sections.count == 1) {
        [self configureTableViewWithSection:sections.firstObject];
    }

    [self.lklDataSource configureTableViewWithSections:sections];
}

- (LKLTableViewRow *)rowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.lklDataSource rowAtIndexPath:indexPath];
}

#pragma mark - setter&getter
- (void)setLklDataSource:(LKLTableViewDataSource *)lklDataSource {
    objc_setAssociatedObject(self, &LKLTableViewDataSourceKey, lklDataSource, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.dataSource = lklDataSource;
}

- (LKLTableViewDataSource *)lklDataSource {
    return objc_getAssociatedObject(self, &LKLTableViewDataSourceKey);
}

- (void)setLklDelegate:(LKLTableViewDelegate *)lklDelegate {
    objc_setAssociatedObject(self, &LKLTableViewDelegateKey, lklDelegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.delegate = lklDelegate;
}

- (LKLTableViewDelegate *)lklDelegate {
    return objc_getAssociatedObject(self, &LKLTableViewDelegateKey);
}

@end
