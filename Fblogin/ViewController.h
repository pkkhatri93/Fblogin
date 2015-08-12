//
//  ViewController.h
//  Fblogin
//
//  Created by Pankaj Khatri on 12/08/15.
//  Copyright (c) 2015 Pankaj Khatri. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface ViewController : UIViewController<FBSDKLoginButtonDelegate>
@property (weak, nonatomic) IBOutlet FBSDKLoginButton *loginButton;
@property (weak, nonatomic) IBOutlet UILabel *uEmailId;
@property (weak, nonatomic) IBOutlet UILabel *uId;
@property (weak, nonatomic) IBOutlet UILabel *uUsername;
@property (weak, nonatomic) IBOutlet UIImageView *uImageView;

@end

