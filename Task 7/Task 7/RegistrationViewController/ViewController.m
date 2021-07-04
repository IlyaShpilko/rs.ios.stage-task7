//
//  ViewController.m
//  Task 7
//
//  Created by Ilya Shpilko on 7/4/21.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *logoLabel;
@property (weak, nonatomic) IBOutlet UITextField *loginTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property (weak, nonatomic) IBOutlet UIButton *buttonAuthorize;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttonPassword;
@property (weak, nonatomic) IBOutlet UILabel *labelPassword;
@property (weak, nonatomic) IBOutlet UIView *viewPassword;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // MARK: -UI elements
    
    // Background View Controller
    self.view.backgroundColor = UIColor.whiteColor;
    
    // Label: Logo
    self.logoLabel.font = [UIFont systemFontOfSize:36 weight:UIFontWeightBold];
    
    // TextField: Login
    self.loginTF.layer.borderWidth = 1.5;
    self.loginTF.layer.borderColor = [UIColor colorWithRed:0.3 green:0.36 blue:0.41 alpha:1.0].CGColor;
    self.loginTF.layer.cornerRadius = 5.0;
    
    // TextField: Password
    self.passwordTF.layer.borderWidth = 1.5;
    self.passwordTF.layer.borderColor = [UIColor colorWithRed:0.3 green:0.36 blue:0.41 alpha:1.0].CGColor;
    self.passwordTF.layer.cornerRadius = 5.0;
    
    // Button: Authorise
    self.buttonAuthorize.layer.borderWidth = 2;
    self.buttonAuthorize.layer.borderColor = [UIColor colorWithRed:0.5 green:0.64 blue:0.93 alpha:1.0].CGColor;
    self.buttonAuthorize.layer.cornerRadius = 5.0;
    [self.buttonAuthorize addTarget:self action:@selector(authoruseTarget:) forControlEvents:UIControlEventTouchUpInside];
    
    // Buttons: Array numbers for password
    for (UIButton *button in self.buttonPassword) {
        button.layer.borderWidth = 1.5;
        button.layer.borderColor = [UIColor colorWithRed:0.5 green:0.64 blue:0.93 alpha:1.0].CGColor;
        button.layer.cornerRadius = 25.0;
        [button addTarget:self action:@selector(numbersForPassword:) forControlEvents:UIControlEventTouchUpInside];
    }
}

// MARK: -Target action
-(void)authoruseTarget: (UIButton *)sender {
    
    if (![self.loginTF.text  isEqual: @"username"]) {
        self.loginTF.layer.borderColor = [UIColor colorWithRed:0.76 green:0.0 blue:0.08 alpha:1.0].CGColor;
    }
    
    if (![self.passwordTF.text isEqual:@"password"]) {
        self.passwordTF.layer.borderColor = [UIColor colorWithRed:0.76 green:0.0 blue:0.08 alpha:1.0].CGColor;
    }
    
    if ([self.loginTF.text  isEqual: @"username"] && [self.passwordTF.text isEqual:@"password"]) {
        
        // TextField: Login
        self.loginTF.layer.borderColor = [UIColor colorWithRed:0.57 green:0.78 blue:0.69 alpha:0.5].CGColor;
        self.loginTF.alpha = 0.5;
        [self.loginTF setEnabled:NO];
        
        // TextField: Password
        self.passwordTF.layer.borderColor = [UIColor colorWithRed:0.57 green:0.78 blue:0.69 alpha:0.5].CGColor;
        self.passwordTF.alpha = 0.5;
        [self.passwordTF setEnabled:NO];
        
        // Button: Authorise
        self.buttonAuthorize.layer.borderColor = [UIColor colorWithRed:0.5 green:0.64 blue:0.93 alpha:0.5].CGColor;
        self.buttonAuthorize.alpha = 0.5;
        [self.buttonAuthorize setEnabled:NO];

        // View: Numbers password
        [self.viewPassword setHidden:NO];
    }
}

-(void)numbersForPassword:(UIButton *)sender {
    if ([self.labelPassword.text isEqual:@"_"]) {
        self.labelPassword.text = sender.titleLabel.text;
    } else {
        self.labelPassword.text = [self.labelPassword.text stringByAppendingString:sender.titleLabel.text];
    }
    
    if ([self.labelPassword.text  isEqual: @"132"]) {
        
        // View for numbers password
        self.viewPassword.layer.borderColor = [UIColor colorWithRed:0.57 green:0.76 blue:0.69 alpha:1.0].CGColor;
        self.viewPassword.layer.borderWidth = 2.0;
        self.viewPassword.layer.cornerRadius = 10.0;
                
        // Alert Controller
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Welcome" message:@"You are successfuly authorized!" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"Refresh" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            
            // TextField: Login
            self.loginTF.layer.borderColor = [UIColor colorWithRed:0.3 green:0.36 blue:0.41 alpha:1.0].CGColor;
            self.loginTF.alpha = 1;
            self.loginTF.text = @"";
            [self.loginTF setEnabled:YES];
                
            // TextField: Password
            self.passwordTF.layer.borderColor = [UIColor colorWithRed:0.3 green:0.36 blue:0.41 alpha:1.0].CGColor;
            self.passwordTF.alpha = 1.0;
            self.passwordTF.text = @"";
            [self.passwordTF setEnabled:YES];
                
            // Button: Authorise
            self.buttonAuthorize.layer.borderColor = [UIColor colorWithRed:0.5 green:0.64 blue:0.93 alpha:1.0].CGColor;
            self.buttonAuthorize.alpha = 1.0;
            [self.buttonAuthorize setEnabled:YES];

            // View: Numbers password
            [self.viewPassword setHidden:YES];
            self.viewPassword.layer.borderWidth = 0;
            
            // Label for password
            self.labelPassword.text = @"_";
            }]];
            [self presentViewController:alert animated:YES completion:nil];
    }
    
    if (self.labelPassword.text.length == 3 && ![self.labelPassword.text  isEqual: @"132"]) {
        self.labelPassword.text = @"_";
        // View for numbers password
        self.viewPassword.layer.borderColor = [UIColor colorWithRed:0.76 green:0.0 blue:0.08 alpha:1.0].CGColor;
        self.viewPassword.layer.borderWidth = 2.0;
        self.viewPassword.layer.cornerRadius = 10.0;
    }
}

// MARK: -TextFieldDelegate
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.loginTF endEditing:true];
    [self.passwordTF endEditing:true];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField endEditing:true];
    return YES;
}

@end
