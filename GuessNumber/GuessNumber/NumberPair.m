//
//  NumberPair.m
//  GuessNumber
//
//  Created by Eason Yin on 4/17/19.
//  Copyright © 2019 Eason Yin. All rights reserved.
//

#import "NumberPair.h"

@implementation NumberPair

- (instancetype)init {
    self = [super init];
    self.sameSumCount = 0;
    self.sameMultiplyCount = 0;
    return self;
    
}

- (int) getSum{
    return self.num1+self.num2;
}

- (int) getMultiply{
    return self.num1*self.num2;
}

-(bool) isEqual:(NumberPair*) pair{
    return self.num1==pair.num1&&self.num2==pair.num2;
}

- (void) increSumCount {
    self.sameSumCount++;
}

-(void) increMultiplyCount{
    self.sameMultiplyCount++;
}



@end
