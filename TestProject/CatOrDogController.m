//
//  ViewController.m
//  TestProject
//
//  Created by Bitcats on 13/08/15.
//  Copyright (c) 2015 TWalenciak. All rights reserved.
//

#import "CatOrDogController.h"

#import "FibonnacciTableController.h"

#import <UIImageView+WebCache.h>


@interface CatOrDogController () <FibonacciTableDelegate, UITextFieldDelegate> {
}



@end

@implementation CatOrDogController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.catDogImageView.layer.cornerRadius = 10;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (self.textField.isFirstResponder) {
        [self.textField resignFirstResponder];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString: @"TableFib"]) {
        FibonnacciTableController *fibCtrl = (FibonnacciTableController *)segue.destinationViewController;
        fibCtrl.eventDelegate = self;
    }
}

-(void)fibonacciTableDidSelectIndex:(int)index
{
    [self.navigationController popViewControllerAnimated:YES];
    
    NSString *url;
    if (index % 2 == 0) {
        url = @"http://animalia-life.com/data_images/cat/cat7.jpg";
    } else {
        url = @"http://petsubjectsrescue.petethevet.com/wp-content/uploads/2013/11/Guide-Dogs_025-11.jpg";
    }
    NSURL *imgUrl = [NSURL URLWithString:url];
    
    [self.catDogImageView sd_setImageWithURL:imgUrl];
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSString *text = textField.text;
    
    
}


- (IBAction)rightAction:(id)sender {
    [self animateContainerWithCenterDiff:-30];
}

- (IBAction)leftAction:(id)sender {
    [self animateContainerWithCenterDiff:30];
}

- (void)animateContainerWithCenterDiff:(CGFloat)horizontalDiff
{
    [UIView animateWithDuration:0.5 animations:^{
        self.centerAlignConstr.constant = horizontalDiff;
        [self.view layoutIfNeeded];
    }];
}

@end
