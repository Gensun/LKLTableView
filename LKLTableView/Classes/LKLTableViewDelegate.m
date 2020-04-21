//
//  LKLTableViewDelegate.m
//  LookingEdu
//
//  Created by Genie Sun on 2019/10/29.
//  Copyright © 2019 LookingEdu. All rights reserved.
//

#import "LKLTableViewDelegate.h"
#import "LKLTableViewRow.h"
#import "UITableView+LKL.h"

@implementation LKLTableViewDelegate

#pragma mark - UITableViewDelegate
//optional
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    LKLTableViewRow *row = [tableView rowAtIndexPath:indexPath];
    return row.height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    LKLTableViewRow *row = [tableView rowAtIndexPath:indexPath];
    if (row.didSelect) {
        row.didSelect(row, tableView, indexPath);
    }
}

@end
