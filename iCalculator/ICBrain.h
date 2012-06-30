//
//  ICBrain.h
//  iCalculator
//
//  Created by Saulo Arruda Coelho on 6/30/12.
//  Copyright (c) 2012 Jera. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ICBrain : NSObject

- (void)pushOperand:(double)number;
- (double)performOperation:(NSString*)operation;

@end
