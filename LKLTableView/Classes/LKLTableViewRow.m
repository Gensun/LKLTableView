//
//  LKLTableViewRow.m
//  LookingEdu
//
//  Created by Genie Sun on 2019/10/24.
//  Copyright © 2019 LookingEdu. All rights reserved.
//

#import "LKLTableViewRow.h"

@implementation LKLTableViewRow

- (instancetype)initCellWithModel:(id)data
                       identifier:(NSString *)identifier
                           height:(CGFloat)height {
    self = [super init];
    if (self) {
        self.data = data;
        self.reuseIdentifier = identifier;
        self.height = height;
    }
    return self;
}

@end
