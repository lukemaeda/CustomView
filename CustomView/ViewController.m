//
//  ViewController.m
//  CustomView
//
//  Created by MAEDA HAJIME on 2014/04/11.
//  Copyright (c) 2014年 HAJIME MAEDA. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // 準備処理
    [self doReady];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 画面タッチ時
- (void)touchesBegan:(NSSet *)touches
           withEvent:(UIEvent *)event {
    
    // 画面オブジェクトを消す
    for (id ctr in self.view.subviews) {
        
        // オブジェクトを消す
        [ctr removeFromSuperview];
    }
}

// 準備処理
- (void)doReady {
    
    // コントロール設定（UILabel）
    {
        CGRect rct = CGRectMake(20.0, 20.0, 280.0, 21.0);
        UILabel *vw = [[UILabel alloc] initWithFrame:rct];
        
        vw.backgroundColor = [UIColor blueColor];
        vw.text = @"あいうえお";
        
        [self.view addSubview:vw];
    }
    
    // コントロール設定（UITextField）
    {
        CGRect rct = CGRectMake(20.0, 50.0, 280.0, 21.0);
        UITextField *vw = [[UITextField alloc] initWithFrame:rct];
        
        vw.borderStyle = UITextBorderStyleRoundedRect;
        vw.backgroundColor = [UIColor greenColor];
        vw.text = @"かきくけこ";
        
        // キーボード画面を消す UIControlEventEditingDidEndOnExit
        // 編集終了後フォーカスが外れた時にhogeメソッドを呼び出す
        [vw      addTarget:self
                    action:@selector(doActionTextField:)
          forControlEvents:UIControlEventEditingDidEndOnExit];
        
        [self.view addSubview:vw];
        
    }
    
    // コントロール設定（UIButton）従来通りのボタン設定
    {
        UIButton *vw = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        vw.frame = CGRectMake(20.0, 90.0, 280.0, 30.0);
        [vw setTitle:@"さしすせそ" forState:UIControlStateNormal]; //有効時
        vw.backgroundColor = [UIColor yellowColor];
        
        [vw      addTarget:self
                    action:@selector(doActionButton:)
          forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:vw];
    }
    
    // コントロール設定（UIButton）
//    {
//        CGRect rct = CGRectMake(20.0, 90.0, 280.0, 30.0);
//        UIButton *vw = [[UIButton alloc] initWithFrame:rct];
//        
//        [vw setTitle:@"さしすせそ" forState:UIControlStateNormal]; //有効時
//        [vw setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//        vw.backgroundColor = [UIColor yellowColor];
//        
//        [self.view addSubview:vw];
//    }
    
    // コントロール設定（UIImage）
    {
        CGRect rct = CGRectMake(30.0, 140.0, 256.0, 130.0);
        
        UIImageView *vw = [[UIImageView alloc]initWithFrame:rct];
        
        // 画像
        vw.image = [UIImage imageNamed:@"img01.png"];
        vw.contentMode = UIViewContentModeScaleToFill;
        
        [self.view addSubview:vw];
    }
    
    // 画面タッチ
    {
        
    }
    
}

// ボタンを押した時　アクション用メソッド
- (void)doActionButton:(UIButton *)sender {
    
    NSLog(@"%@", sender.titleLabel.text);
    
}

// テキストフィールド確定時　アクション用メソッド キーボード画面が消える
- (void)doActionTextField:(UITextField *)sender {

}

@end
