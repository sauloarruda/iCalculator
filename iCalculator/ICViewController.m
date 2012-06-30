//
//  ICViewController.m
//  iCalculator
//
//  Created by Saulo Arruda Coelho on 6/30/12.
//  Copyright (c) 2012 Jera. All rights reserved.
//

#import "ICViewController.h"
#import "ICBrain.h"

@interface ICViewController () {
    BOOL _isEnteringNumber;
}

- (IBAction)numberPressed:(UIButton *)sender;
- (IBAction)enterPressed;
- (IBAction)operationPressed:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UILabel *displayLabel;
@property (strong, nonatomic) ICBrain* brain;

@end

@implementation ICViewController
@synthesize displayLabel;
@synthesize brain = _brain;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setDisplayLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (ICBrain*)brain 
{
    if (!_brain) _brain = [[ICBrain alloc] init];
    return _brain;
}

- (IBAction)enterPressed {
    _isEnteringNumber = NO;
    [self.displayLabel setHighlighted:YES];
    [self.brain pushOperand:[self.displayLabel.text doubleValue]];
}

- (IBAction)operationPressed:(UIButton *)sender {
    [self enterPressed];
    double result = [self.brain performOperation:sender.currentTitle];
    self.displayLabel.text = [NSString stringWithFormat:@"%g", result];
}

- (IBAction)numberPressed:(UIButton *)sender {
    NSString* digit = sender.currentTitle;
    if (_isEnteringNumber) 
        self.displayLabel.text = [self.displayLabel.text stringByAppendingString:digit];
    else {
        self.displayLabel.text = digit;
        [self.displayLabel setHighlighted:NO];
        _isEnteringNumber = YES;
    }
}
@end
