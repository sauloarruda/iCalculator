//
//  ICBrain.m
//  iCalculator
//
//  Created by Saulo Arruda Coelho on 6/30/12.
//  Copyright (c) 2012 Jera. All rights reserved.
//

#import "ICBrain.h"

@interface ICBrain () {
    NSMutableArray* _stack;
}

@property (nonatomic, strong, readonly) NSMutableArray* stack;

@end

@implementation ICBrain

- (NSMutableArray*)stack
{
    if (!_stack) _stack = [[NSMutableArray alloc] init];
    return _stack;
}

- (void)pushOperand:(double)number
{
    [self.stack addObject:[NSNumber numberWithDouble:number]];
}

- (double)popOperand
{
    NSNumber* operand = [self.stack lastObject];
    if (operand) [self.stack removeLastObject];
    return [operand doubleValue];
}

- (double)performOperation:(NSString *)operation
{
    double result;
    double operand = [self popOperand];
    if ([@"+" isEqualToString:operation]) {
        result = [self popOperand] + operand;
    }
    else if ([@"-" isEqualToString:operation]) {
        result = [self popOperand] - operand;
    }
    else if ([@"*" isEqualToString:operation]) {
        result = [self popOperand] * operand;
    }
    else if ([@"/" isEqualToString:operation]) {
        result = [self popOperand] / operand;
    }
    [self pushOperand:result];
    return result;
}

@end
