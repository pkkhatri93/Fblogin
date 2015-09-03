//
//  ViewController.m
//  Fblogin
//
//  Created by Pankaj Khatri on 12/08/15.
//  Copyright (c) 2015 Pankaj Khatri. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.uImageView.layer.cornerRadius=self.uImageView.frame.size.width/2;
   [self.uImageView.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    self.uImageView.backgroundColor=[UIColor darkGrayColor];
    self.uImageView.layer.borderWidth=3.0;
    self.uImageView.clipsToBounds=YES;

    self.loginButton.readPermissions = @[@"public_profile", @"email", @"user_friends"];
    self.loginButton.delegate=self;
    
    // chekcing that user is already login or not
    if ([FBSDKAccessToken currentAccessToken]) {
       
        // if user is logged in then getting all the user info
        [self getAndUserInfo];
    }
    


}
- (void)loginButton:(FBSDKLoginButton *)loginButton didCompleteWithResult:(id )result error:(NSError *)error{
    if(!error){
        NSLog(@"You've Logged in");
        NSLog(@"%@", result);
        
        
        [self getAndUserInfo];
        
        
    }
}
-(void)getAndUserInfo
{
    [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me"
                                       parameters:@{@"fields": @"picture, email, name, gender"}]
     startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
         if (!error) {
             NSDictionary *userInfo=result;
             
             //  NSString *pictureURL = [NSString stringWithFormat:@"%@",[[[result objectForKey:@"picture"] objectForKey:@"data"] objectForKey:@"url"]];
             
             
             
             NSString *userImageURL = [NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large", [userInfo objectForKey:@"id"]];
             
             UIImage* myImage = [UIImage imageWithData:
                                 [NSData dataWithContentsOfURL:
                                  [NSURL URLWithString: userImageURL]]];
             
             self.uImageView.image=myImage;
             self.uUsername.text=[userInfo objectForKey:@"name"];
             self.uEmailId.text=[userInfo objectForKey:@"email"];
             self.uId.text=[userInfo objectForKey:@"id"];
             
             // NSLog(@"email is %@", [result objectForKey:@"email"]);
             
             // NSData  *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:pictureURL]];
             // _imageView.image = [UIImage imageWithData:data];
             
         }
         else{
             NSLog(@"%@", [error localizedDescription]);
         }
     }];
    

}
-(void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton{
    
}

@end
