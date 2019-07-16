//
//  ViewController.m
//  DicBlock
//
//  Created by humiao on 2018/12/29.
//  Copyright © 2018年 humiao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

typedef void (^RetriveBlock) (BOOL isConnect);

@property (nonatomic,  strong) NSMutableDictionary <NSString *,RetriveBlock> *mutDic;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _mutDic = [NSMutableDictionary dictionary];
}

- (IBAction)dicBlockTest:(id)sender {
    UIButton *myBtn = sender;
    myBtn.selected = !myBtn.selected;
    
    __weak  ViewController *weakSelf = self;
    [_mutDic setObject:^(BOOL isConnect) {
        [weakSelf.mutDic removeObjectForKey:@"myBlock"];
        NSLog(@"mutDic3: _mutDic");
    } forKey:@"myBlock"];
    
    NSLog(@"mutDic1 :%@",_mutDic);
    for (NSString *key in _mutDic) {
        BOOL isConnect = myBtn.selected ? YES : NO;
        NSLog(@"mutDic2 :%@",_mutDic);
        self.mutDic[key](isConnect);
        NSLog(@"mutDic4 :%@",_mutDic);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
