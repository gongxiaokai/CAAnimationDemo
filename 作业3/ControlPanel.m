//
//  ControlPanel.m
//  作业3
//
//  Created by gongwenkai on 2016/12/13.
//  Copyright © 2016年 gongwenkai. All rights reserved.
//

#import "ControlPanel.h"


@interface ControlPanel()<CAAnimationDelegate>

#define kStartRadius 25
#define kMargin 40
#define kAnimationDuration 0.8

@property(nonatomic,strong)UIButton *startBtn;  //开始
@property(nonatomic,strong)UIButton *preBtn;    //上一首
@property(nonatomic,strong)UIButton *nextBtn;   //下一首
@property(nonatomic,strong)UIButton *pauseBtn;  //暂停
@property(nonatomic,strong)UISlider *progressSlider; //进度条
@property(nonatomic,strong)UILabel *songNameLab;    //歌曲名
@property(nonatomic,strong)UIView *startView;   //开始面板
@property(nonatomic,strong)UIView *panelView;   //控制面板
@property(nonatomic,strong)UIView *songInfoView;    //介绍面板
@property(nonatomic,strong)UILabel *songInfoTitleLab;  //介绍标题
@property(nonatomic,strong)UILabel *songInfoDetialLab;  //介绍详情

@end

@implementation ControlPanel

//初始化
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.panelView.hidden = YES;
        [self addSubview:self.panelView];
        [self addSubview:self.startView];
        [self addSubview:self.songInfoView];
        
    }
    return self;
}


//歌曲信息面板
- (UIView*)songInfoView {
    if (!_songInfoView) {
        _songInfoView = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height * 0.3, self.frame.size.width * 0.7, self.frame.size.height *0.7)];
        _songInfoView.backgroundColor = [UIColor clearColor];
        [_songInfoView addSubview:self.songInfoTitleLab];
        [_songInfoView addSubview:self.songInfoDetialLab];
    }
    return _songInfoView;
}
//歌曲信息标题
- (UILabel*)songInfoTitleLab {
    if (!_songInfoTitleLab) {
        _songInfoTitleLab = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, self.songInfoView.frame.size.width*0.8, self.songInfoView.frame.size.height * 0.3)];
        _songInfoTitleLab.backgroundColor = [UIColor clearColor];
        _songInfoTitleLab.text = @"...Like Clockwork";
        _songInfoTitleLab.textColor = [UIColor whiteColor];

    }
    return _songInfoTitleLab;
}
//歌曲信息详情
- (UILabel*)songInfoDetialLab {
    if (!_songInfoDetialLab) {
        _songInfoDetialLab = [[UILabel alloc] initWithFrame:CGRectMake(10, self.songInfoView.frame.size.height * 0.3, self.songInfoView.frame.size.width*0.8, self.songInfoView.frame.size.height * 0.7)];
        _songInfoDetialLab.text = @"Queens of the Stone Age";
        _songInfoDetialLab.font = [UIFont systemFontOfSize:14];
        _songInfoDetialLab.numberOfLines = 4;
        _songInfoDetialLab.textColor = [UIColor whiteColor];
        _songInfoDetialLab.backgroundColor = [UIColor clearColor];
    }
    return _songInfoDetialLab;
}

//控制面板
- (UIView*)panelView {
    if (!_panelView) {
        _panelView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _panelView.backgroundColor = [UIColor colorWithRed:58/255.f green:185/255.f blue:218/255.f alpha:1];
    }
    return _panelView;
}

//开始面板
- (UIView*)startView {
    if (!_startView) {
        _startView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kStartRadius*2, kStartRadius*2)];
        _startView.backgroundColor = [UIColor colorWithRed:58/255.f green:185/255.f blue:218/255.f alpha:1];
        _startView.layer.cornerRadius = kStartRadius;
        
        //起始位置 右上角
        _startView.layer.position = CGPointMake(self.frame.size.width - kStartRadius, 0);
        [_startView addSubview:self.startBtn];
        
    }
    return _startView;
}

//进度条
- (UISlider*)progressSlider {
    if (!_progressSlider) {
        _progressSlider = [[UISlider alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width * 0.9, 20)];
        _progressSlider.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2 + kMargin/4);
        _progressSlider.thumbTintColor = [UIColor blackColor];
        _progressSlider.minimumTrackTintColor = [UIColor blackColor];
        _progressSlider.maximumTrackTintColor = [UIColor blackColor];
    }
    return _progressSlider;
}

//歌曲名
- (UILabel*)songNameLab {
    if (!_songNameLab) {
        _songNameLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width*0.8, 20)];
        _songNameLab.center = CGPointMake(self.frame.size.width/2, self.frame.size.height - 20);
        _songNameLab.textAlignment = NSTextAlignmentCenter;
        _songNameLab.text = @"I Appear Missing";
    }
    return _songNameLab;
}

//前进
- (UIButton*)preBtn {
    if (!_preBtn) {
        _preBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        _preBtn.center = CGPointMake(self.frame.size.width/2 - kMargin*2, self.frame.size.height/2 - kMargin * 0.8);
        [_preBtn setImage:[UIImage imageNamed:@"ic_skip_previous.png"] forState:UIControlStateNormal];
        //        [self addSubview:_preBtn];
    }
    return _preBtn;
}


//下一首
- (UIButton*)nextBtn {
    if (!_nextBtn) {
        _nextBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        _nextBtn.center = CGPointMake(self.frame.size.width/2 + kMargin*2, self.frame.size.height/2 - kMargin * 0.8);
        [_nextBtn setImage:[UIImage imageNamed:@"ic_skip_next.png"] forState:UIControlStateNormal];
//        [self addSubview:_nextBtn];

    }
    return _nextBtn;
}

//暂停
- (UIButton*)pauseBtn {
    if (!_pauseBtn) {
        _pauseBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        _pauseBtn.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2 - kMargin * 0.8);
        [_pauseBtn setImage:[UIImage imageNamed:@"ic_stop.png"] forState:UIControlStateNormal];
        [_pauseBtn addTarget:self action:@selector(clickPauseBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _pauseBtn;
}

//点击暂停 view缩小成原始的startView大小
- (void)clickPauseBtn {
    NSLog(@"clickPause");
    self.panelView.hidden = YES;
    self.backgroundColor = [UIColor clearColor];
    self.startView.hidden = NO;
    
    [self startViewChangeSmaller];

    [self showSongInfoView];
    
    
}

//songinfoview出现
- (void)showSongInfoView {
    [UIView animateWithDuration:kAnimationDuration delay:0 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
        self.songInfoView.hidden = NO;
        self.songInfoView.alpha = 1;
    } completion:nil];
}

//startView变小
- (void)startViewChangeSmaller {

    //设置一组动画
    //变小
    CABasicAnimation *animation1 = [[CABasicAnimation alloc] init];
    animation1.keyPath = @"bounds";
    animation1.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, kStartRadius*2, kStartRadius*2)];
    //变圆
    CABasicAnimation *animation2 = [[CABasicAnimation alloc] init];
    animation2.keyPath = @"cornerRadius";
    animation2.toValue = [NSNumber numberWithFloat:kStartRadius];
    
    CAAnimationGroup *group = [[CAAnimationGroup alloc] init];
    group.animations = @[animation1,animation2];
    group.removedOnCompletion = NO;
    group.fillMode = kCAFillModeForwards;
    group.duration = kAnimationDuration;
    group.delegate = self;
    [self.startView.layer addAnimation:group forKey:nil];
    self.layer.masksToBounds = YES;
    
    [self performSelector:@selector(startViewBackAnimation) withObject:nil afterDelay:kAnimationDuration];
}

//设置startView返回动画
- (void)startViewBackAnimation {
    //设置贝塞尔曲线路径动画
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(self.frame.size.width/2, self.frame.size.height/2 )];
    [path addCurveToPoint:CGPointMake(self.frame.size.width - kStartRadius, 0 ) controlPoint1:CGPointMake(self.frame.size.width * 1.3, self.frame.size.height/2) controlPoint2:CGPointMake(self.frame.size.width - kStartRadius, 0)];
    CAKeyframeAnimation *anmiation0 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    anmiation0.path = path.CGPath;
    anmiation0.duration = kAnimationDuration;
    anmiation0.removedOnCompletion = NO;
    anmiation0.fillMode = kCAFillModeForwards;
    [self.startView.layer addAnimation:anmiation0 forKey:nil];
    self.layer.masksToBounds = NO;
    self.startBtn.hidden = NO;
}

//开始
- (UIButton*)startBtn {
    if (!_startBtn) {
        _startBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.startView.frame.size.height , self.startView.frame.size.width)];
        [_startBtn setImage:[UIImage imageNamed:@"ic_play_white.png"] forState:UIControlStateNormal];
        [_startBtn addTarget:self action:@selector(clickStartBtn) forControlEvents:UIControlEventTouchUpInside];
        //        [self addSubview:_preBtn];
    }
    return _startBtn;
}

//点击开始按钮
- (void)clickStartBtn {
    [self songInfoViewDismiss];

    [self startViewToCenter];
    
}

//通过曲线路径将startView移到中间
- (void)startViewToCenter {
    
    //设置贝塞尔曲线路径动画
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:self.startView.center];
    [path addCurveToPoint:CGPointMake(self.frame.size.width/2, self.frame.size.height/2 ) controlPoint1:CGPointMake(self.frame.size.width - kStartRadius, 0 ) controlPoint2:CGPointMake(self.frame.size.width * 1.3, self.frame.size.height/2)];
    CAKeyframeAnimation *anmiation0 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    anmiation0.path = path.CGPath;
    anmiation0.duration = kAnimationDuration;
    anmiation0.removedOnCompletion = NO;
    anmiation0.fillMode = kCAFillModeForwards;
    [self.startView.layer addAnimation:anmiation0 forKey:nil];
    [self performSelector:@selector(startViewChangeAnimation) withObject:nil afterDelay:1];
}

//songinfoview消失
- (void)songInfoViewDismiss {

    
    [UIView animateWithDuration:kAnimationDuration delay:0 options:UIViewAnimationOptionTransitionFlipFromTop animations:^{
        self.songInfoView.alpha = 0;
    } completion:^(BOOL finished) {
        self.songInfoView.hidden = YES;
    }];

   
    
    
}

//开始面板变大动画
- (void)startViewChangeAnimation {
    self.startBtn.hidden = YES;
    //设置一组动画
    //变大
    CABasicAnimation *animation = [[CABasicAnimation alloc] init];
    animation.keyPath = @"bounds";
    animation.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 500, 500)];
    //变圆
    CABasicAnimation *animation2 = [[CABasicAnimation alloc] init];
    animation2.keyPath = @"cornerRadius";
    animation2.toValue = [NSNumber numberWithFloat:250];

    CAAnimationGroup *group = [[CAAnimationGroup alloc] init];
    group.animations = @[animation,animation2];
    group.removedOnCompletion = NO;
    group.fillMode = kCAFillModeForwards;
    group.duration = kAnimationDuration;
    group.delegate = self;
    [self.startView.layer addAnimation:group forKey:nil];
    self.layer.masksToBounds = YES;
    
    [self performSelector:@selector(loadPanelAnimation) withObject:nil afterDelay:kAnimationDuration];
    
}

//加载控制板动画
- (void)loadPanelAnimation {
    self.panelView.hidden = NO;
    self.startView.hidden = YES;
    [self.panelView addSubview:self.preBtn];
    [self.panelView addSubview:self.pauseBtn];
    [self.panelView addSubview:self.nextBtn];
    [self.panelView addSubview:self.progressSlider];
    [self.panelView addSubview:self.songNameLab];
    self.backgroundColor = [UIColor colorWithRed:58/255.f green:185/255.f blue:218/255.f alpha:1];
   
    //控制板出现时的转场动画
    CATransition *tan = [[CATransition alloc] init];
    tan.type = kCATransitionReveal;
    tan.subtype = kCATransitionFromRight;
    tan.duration = kAnimationDuration;
    [self.panelView.layer addAnimation:tan forKey:nil];

}


//响应超出view的事件
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    return YES;
}

@end
