//
//  main.m
//  GuessNumber
//
//  Created by Eason Yin on 3/29/19.
//  Copyright © 2019 Eason Yin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NumberPair.h"


void checkDuplicateNum(int result, NSString *str, NSMutableArray *resultArrary, NSMutableArray *resultCountArrary, NSMutableArray *resultStrArrary){
    for(int i=0; i<[resultArrary count]; i++){
        if(result == [[resultArrary objectAtIndex:i] integerValue]){
            int newCount = [[resultCountArrary objectAtIndex:i] integerValue]+1;
            NSString *strResult = [NSString stringWithFormat:@"%@ | %@",[resultStrArrary objectAtIndex:i], str ];
            
           
            [resultCountArrary replaceObjectAtIndex:i withObject:[NSNumber numberWithInteger:newCount]];
            [resultStrArrary replaceObjectAtIndex:i withObject:strResult];
            return;
        }
        
    }
    [resultArrary addObject:[NSNumber numberWithInteger:result]];
    [resultCountArrary addObject:[NSNumber numberWithInteger:1]];
    [resultStrArrary addObject:str];
    return;
}

void countSameResult(NumberPair *pair, NSMutableArray *possibleNumberPairs){
    for(int i=0;i<[possibleNumberPairs count];i++){
        if([[possibleNumberPairs objectAtIndex:i] getSum] == [pair getSum]){
            [pair increSumCount];
        }
        
        if([[possibleNumberPairs objectAtIndex:i] getMultiply] == [pair getMultiply]){
            [pair increMultiplyCount];
        }
        
        
    }
}

bool checkExistPair(NumberPair *pair, NSMutableArray *array){
    for(int i=0;i<[array count];i++){
        if([pair isEqual:[array objectAtIndex:i]]){
            return true;
        }
    }
    return false;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        int MaxNumber = 20;
        NSMutableArray *possibleNumberPairs = [[NSMutableArray alloc] init];
        
        
        for (int i=1;i<=MaxNumber;i++){
            for (int j=i+1;j<=MaxNumber;j++){
                
                NumberPair *pair = [NumberPair alloc];
                pair.num1 = i;
                pair.num2 = j;
                [possibleNumberPairs addObject:pair];
//                NSLog(@"Number1=%d; Number2=%d; Sum=%d; Multiply=%d", pair.num1, pair.num2, [pair getSum], [pair getMultiply]);
            }
        }
        
        for(int i=0;i<[possibleNumberPairs count];i++){
            NumberPair *pair = [possibleNumberPairs objectAtIndex:i];
            countSameResult(pair, possibleNumberPairs);
        }
        
        
    
        
        //Person A didn't know which pair of numbers he got, meanning sum count is larger than one
        NSMutableArray *personAPossiblePairs = [[NSMutableArray alloc] init];
        //Person B didn't know which pair of numbers he got, meanning multipl count is larger than one
        NSMutableArray *personBPossiblePairs = [[NSMutableArray alloc] init];
        NSMutableArray *finalPairOfNum = [[NSMutableArray alloc] init];
        for(int i=0;i<[possibleNumberPairs count];i++){
            NumberPair *pair = [possibleNumberPairs objectAtIndex:i];
            if(pair.sameSumCount>1){
                [personAPossiblePairs addObject:pair];
               // NSLog(@"Person A possible pair of number  SUM = %d ", [pair getSum]);
                NSMutableArray *possiblePairWithSum = [[NSMutableArray alloc] init];
                for (int j=0;j<[possibleNumberPairs count]; j++){
                    NumberPair *comparePair = [possibleNumberPairs objectAtIndex: j];
                    if([comparePair getSum] == [pair getSum]){
                        if(comparePair.sameMultiplyCount >1){
                        [possiblePairWithSum addObject:comparePair];
//                        NSLog(@"Possible Pair %d %d and multiply count %d ",comparePair.num1, comparePair.num2, comparePair.sameMultiplyCount);
                        }
                        
                    }
                }
                //Then Person A knew the pair of number, meaning only one possible possible pair of numbers which multiply count is larger than 1
                
                if([possiblePairWithSum count] == 1){
                   
                    NumberPair * p = [possiblePairWithSum objectAtIndex:0];
                    if(!checkExistPair(p, finalPairOfNum)){
                        [finalPairOfNum addObject:p];
                    NSLog(@"==================FIND PAIR OF NUMBER===================");
                    NSLog(@"Find Pair of Number %d %d, sum count %d,  multiply count %d ",p.num1, p.num2, p.sameSumCount, p.sameMultiplyCount);
                    NSLog(@"==================END===================");
                    }
                }
            }
//            if(pair.sameMultiplyCount>1){
//                [personBPossiblePairs addObject:pair];
//            }
        }
        
    }
    return 0;
}




