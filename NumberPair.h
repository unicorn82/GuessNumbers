//
//  NumberPair.h
//  GuessNumber
//
//  Created by Eason Yin on 4/17/19.
//  Copyright © 2019 Eason Yin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NumberPair : NSObject

@property (assign) int num1;
@property (assign) int num2;

- (int) getSum;

- (int) getMultiply;

-(bool) isEqual:(NumberPair*) pair;

@property (assign) int sameSumCount;

- (void) increSumCount;
@property (assign) int sameMultiplyCount;

-(void) increMultiplyCount;


@end

NS_ASSUME_NONNULL_END
