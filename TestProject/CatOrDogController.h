//
//  ViewController.h
//  TestProject
//
//  Created by Bitcats on 13/08/15.
//  Copyright (c) 2015 TWalenciak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CatOrDogController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *catDogImageView;

@property (weak, nonatomic) IBOutlet UIView *containerController;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *centerAlignConstr;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

