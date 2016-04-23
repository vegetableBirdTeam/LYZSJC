//
//  SQAddTextViewController.m
//  LYZSJC
//
//  Created by 沈强 on 16/4/21.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQAddTextViewController.h"
#import "SQPlaceholderTextView.h"
#import "SQAddTagToolbar.h"
#import "SQEmotionKeyboard.h"

@interface SQAddTextViewController ()<SQAddTagToolbarDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextViewDelegate>

/** 文本输入控件 */
@property (nonatomic, weak) SQPlaceholderTextView *textView;
/** 工具条 */
@property (nonatomic, weak) SQAddTagToolbar *toolbar;
/** 表情键盘 */
@property (nonatomic, strong) SQEmotionKeyboard *emotionKeyboard;
/** 是否正在切换键盘 */
@property (nonatomic, assign) BOOL switchingKeybaord;

@end

@implementation SQAddTextViewController

/**
 *  表情键盘
 */
- (SQEmotionKeyboard *)emotionKeyboard {
    if (!_emotionKeyboard) {
        _emotionKeyboard = [[SQEmotionKeyboard alloc] init];
        _emotionKeyboard.width = SQScreenW;
        self.emotionKeyboard.height = 256;
    }
    return _emotionKeyboard;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = SQGlobalBkg;
    
    // 创建nav
    [self setupNav];
    
    // 设置输入框
    [self setupTextView];
    
    // 设置工具条
    [self setupToolbar];
}

/**
 *  设置工具条
 */
- (void)setupToolbar {
    SQAddTagToolbar *toolbar = [[SQAddTagToolbar alloc] init];
    toolbar.height = 44;
    toolbar.x = 0;
    toolbar.y = SQScreenH - toolbar.height;
    toolbar.width = SQScreenW;
    toolbar.delegate = self;
    [self.view addSubview:toolbar];
    self.toolbar = toolbar;
}

/**
 *  设置输入框
 */
- (void)setupTextView {
    SQPlaceholderTextView *textView = [[SQPlaceholderTextView alloc] init];
    textView.placeholder = @"吐槽一下吧...";
    textView.placeholderColor = [UIColor lightGrayColor];

    // 垂直方向上永远可以拖拽
    textView.alwaysBounceVertical = YES;
    textView.frame = [UIScreen mainScreen].bounds;
    textView.font = [UIFont systemFontOfSize:16];
    textView.delegate = self;
    [self.view addSubview:textView];
    self.textView = textView;

    // 监听通知
    [SQNotificationCenter addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:textView];
    //键盘通知
    [SQNotificationCenter addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
    // 表情选中的通知
    [SQNotificationCenter addObserver:self selector:@selector(emotionDidSelect:) name:@"EmotionDidSelectNotification" object:nil];
    //键盘删除的通知
    [SQNotificationCenter addObserver:self selector:@selector(deleteBtn) name:@"EmotionDidDeleteNotification" object:nil];
}

/**
 *  监听用户是否已经输入内容
 */
- (void)textDidChange {
    self.navigationItem.rightBarButtonItem.enabled = self.textView.hasText;
}

/**
 *  键盘的frame发生改变时调用(显示、隐藏等)
 */
- (void)keyboardWillChangeFrame:(NSNotification *)notification {
    // 如果正在切换键盘，就不要执行后面的代码
    if (self.switchingKeybaord) return;

    NSDictionary *userInfo = notification.userInfo;
    CGRect keyboardF = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    double duration = [userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    [UIView animateWithDuration:duration animations:^{
        // 工具条的Y值 =键盘的Y值 - 工具条的高度
        if (keyboardF.origin.y > self.view.height) { // 键盘的Y值已经远远超过控制器view的高度
            self.toolbar.y = self.view.height - self.toolbar.height;
        } else {
            self.toolbar.y = keyboardF.origin.y - self.toolbar.height;
        }
    }];
}

/**
 *  表情被点击
 */
- (void)emotionDidSelect:(NSNotification *)notification {
    SQEmotion *emotion = notification.userInfo[@"SelectEmotionKey"];
    [self.textView insertEmotion:emotion];
}

/**
 *  键盘删除按钮
 */
- (void)deleteBtn {
    [self.textView deleteBackward];
}

/**
 *  创建nav
 */
- (void)setupNav
{
    self.title = @"发表文字";
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 20)];
    button.titleEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"发表" style:UIBarButtonItemStyleDone target:self action:@selector(post)];
    [rightItem setTintColor:[UIColor orangeColor]];
    self.navigationItem.rightBarButtonItem = rightItem;
    self.navigationItem.rightBarButtonItem.enabled = NO; // 默认不能点击
}

/**
 *  返回按钮
 */
- (void)cancel {
    [self dismissViewControllerAnimated:YES completion:nil];
}

/**
 *  发表按钮
 */
- (void)post {
    // 发布没图片的吐槽
    
    // 发布有图片的吐槽
    
    // 发布有视频的吐槽
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    // 成为第一响应者，马上叫出相应的键盘
    [self.textView becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -SQAddTagToolbarDelegate
- (void)addTagToolbar:(SQAddTagToolbar *)toolbar didClickButton:(SQAddTagToolbarButtonType)type {
    switch (type) {
        case SQAddTagToolbarButtonTypePicture:
            [self openAlbum];
            break;
        case SQAddTagToolbarButtonTypeMention:
            SQLog(@"你@了一个人");
            break;
        case SQAddTagToolbarButtonTypeEmotion:
            [self changeKeyboard];
            break;
        default:
            break;
    }
}

/**
 *  打开相册
 */
- (void)openAlbum {
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) return;

    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    [self presentViewController:picker animated:YES completion:nil];
}

#pragma mark -<UIImagePickerControllerDelegate>
/**
 *  从UIImagePickerController选择完图片后就调用 (选择相册图片完毕)
 */
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    [picker dismissViewControllerAnimated:YES completion:nil];
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    SQLog(@"image = %@", image);
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
}

/**
 *  切换键盘
 */
- (void)changeKeyboard {
    if (self.textView.inputView == nil) {
        self.textView.inputView = self.emotionKeyboard;
        // 显示键盘按钮
        self.toolbar.showKeyboardButton = YES;
        self.toolbar.y = SQScreenH - 44 - 256;
    } else {
        self.textView.inputView = nil;
        // 显示表情按钮
        self.toolbar.showKeyboardButton = NO;
    }

    // 开始切换键盘
    self.switchingKeybaord = YES;

    // 退出键盘
    [self.textView endEditing:YES];

    // 结束切换键盘
    self.switchingKeybaord = NO;
        // 弹出键盘
    [self.textView becomeFirstResponder];
}

/**
 *  移除通知
 */
- (void)dealloc {
    [SQNotificationCenter removeObserver:self];
}

@end
