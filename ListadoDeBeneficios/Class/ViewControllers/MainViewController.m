//
//  MainViewController.m
//  ListadoDeBeneficios
//
//  Created by Raul Quispe on 4/10/14.
//  Copyright (c) 2014 Kodebinario. All rights reserved.
//

#import "MainViewController.h"
#import "MBProgressHUD.h"
#import "WSData.h"
@interface MainViewController ()
{
    MBProgressHUD*progressView;
}

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    progressView=[[MBProgressHUD alloc] initWithView:self.navigationController.view];
    [self.navigationController.view addSubview:progressView];
    progressView.mode=MBProgressHUDModeIndeterminate;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)getBenefits:(UIButton *)sender {
    [progressView show:YES];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(endListBenefit:) name:@"endListBenefit" object:nil];
    [WSData getListBenefitWithNotification:@"endListBenefit"];

}
-(void)endListBenefit:(NSNotification*)notification
{
    NSArray*listBenefit=(NSArray*)notification.object;
    NSLog(@"numero de elementos:%lu ",(unsigned long)[listBenefit count]);
}
@end
