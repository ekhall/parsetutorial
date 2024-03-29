//
//  LoginViewController.m
//  TutorialBase
//
//  Created by Antonio MG on 6/23/12.
//  Copyright (c) 2012 AMG. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"

@implementation LoginViewController

@synthesize userTextField = _userTextField, passwordTextField = _passwordTextField;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    // Release any retained subviews of the main view.
    self.userTextField = nil;
    self.passwordTextField = nil;
}


#pragma mark IB Actions

//Login button pressed
-(IBAction)logInPressed:(id)sender
{
    [PFUser logInWithUsernameInBackground:self.userTextField.text
                                 password:self.passwordTextField.text
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                            [self performSegueWithIdentifier:@"LoginSuccessful"
                                                                      sender:self];
                                        } else {
                                            NSString *errorString = [[error userInfo] objectForKey:@"error"];
                                            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                                            message:errorString
                                                                                           delegate:nil
                                                                                  cancelButtonTitle:@"Ok"
                                                                                  otherButtonTitles:nil, nil];
                                            [alert show];
                                        }
                                    }];
    
    [self performSegueWithIdentifier:@"LoginSuccessful" sender:self];

}

@end
