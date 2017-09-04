//
//  FloatView+Touch.m
//  FloatView
//
//  Created by Tony on 2017/8/7.
//  Copyright © 2017年 cp9. All rights reserved.
//

#import "FloatView+Touch.h"
#import <objc/runtime.h>





typedef void(^TapActionWithBlock)(void);

CGFloat distanceBetweenPoints (CGPoint first, CGPoint second) {
    CGFloat deltaX = second.x - first.x;
    CGFloat deltaY = second.y - first.y;
    return sqrt(deltaX*deltaX + deltaY*deltaY );
};

@interface FloatView ()<UIGestureRecognizerDelegate>
{
    
}
@property (nonatomic,copy) TapActionWithBlock tapActionWithBlock;

@property (nonatomic,assign) BOOL isTouchBegin;
@property (nonatomic,assign) BOOL isTouchMoved;
@property (nonatomic,assign) CGPoint touchPoint;

- (void)moveStay;

@end

@implementation FloatView (Touch)

+ (void)initialize{
    [self aop_changeMethod:@selector(initStayLocation) newMethod:@selector(aop_initStayLocation)];
    [self aop_changeMethod:@selector(touchesEnded:withEvent:)
                 newMethod:@selector(aop_touchesEnded:withEvent:)];
    [self aop_changeMethod:@selector(touchesMoved:withEvent:)
                 newMethod:@selector(aop_touchesMoved:withEvent:)];

}

+(void)aop_changeMethod:(SEL)oldMethod newMethod:(SEL)newMethod
{
    Method oldM  = class_getInstanceMethod([self class], oldMethod);
    Method newM = class_getInstanceMethod([self class], newMethod);
    method_exchangeImplementations(oldM, newM);
}

+(void)aop_changeClassMethod:(SEL)oldMethod newMethod:(SEL)newMethod
{
    Method oldM  = class_getClassMethod([self class], oldMethod);
    Method newM = class_getClassMethod([self class], newMethod);
    method_exchangeImplementations(oldM, newM);
}

- (void)setTouchPoint:(CGPoint)touchPoint {
    
    objc_setAssociatedObject(self, @"FloatView_touchPoint", NSStringFromCGPoint(touchPoint), OBJC_ASSOCIATION_RETAIN_NONATOMIC);

}

- (CGPoint)touchPoint {
    NSString *pointStr = objc_getAssociatedObject(self, @"FloatView_touchPoint");
    return CGPointFromString(pointStr);
}

- (void)setTapActionWithBlock:(TapActionWithBlock)block{
    objc_setAssociatedObject(self, @"FloatView_tapActionWithBlock", block, OBJC_ASSOCIATION_COPY);
}

- (TapActionWithBlock)tapActionWithBlock{
    return objc_getAssociatedObject(self, @"FloatView_tapActionWithBlock");
}

- (BOOL)isTouchMoved{
    return [objc_getAssociatedObject(self, @"FloatView_isTouchMoved") boolValue];
}

- (void)setIsTouchMoved:(BOOL)isTouchMoved{
    objc_setAssociatedObject(self, @"FloatView_isTouchMoved", [NSNumber numberWithBool:isTouchMoved], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)isTouchBegin{
    return [objc_getAssociatedObject(self, @"FloatView_isTouchBegin") boolValue];
}

- (void)setIsTouchBegin:(BOOL)isTouchBegin{
    objc_setAssociatedObject(self, @"FloatView_isTouchBegin", [NSNumber numberWithBool:isTouchBegin], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)aop_initStayLocation{

    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] init];
    swipe.direction = UISwipeGestureRecognizerDirectionRight | UISwipeGestureRecognizerDirectionLeft;
    swipe.delegate = self;
    [self addGestureRecognizer:swipe];
    [self aop_initStayLocation];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.isTouchBegin = YES;
    self.isTouchMoved = NO;
    
    self.touchPoint = [[touches anyObject] locationInView:self];
}

- (void)aop_touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.isTouchBegin = NO;
    [self aop_touchesEnded:touches withEvent:event];
    if (!self.isTouchMoved) {
        if (self.tapActionWithBlock) {
            self.tapActionWithBlock();
        }
    }
}

- (void)aop_touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    if (distanceBetweenPoints([touch locationInView:self],self.touchPoint) > 10) {
        self.isTouchMoved = YES;
    }
    [self aop_touchesMoved:touches withEvent:event];
}



- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.isTouchBegin = NO;
   [self moveStay];
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    if (self.isTouchBegin) {
        return YES;
    }else{
        return [super pointInside:point withEvent:event];
    }
}



#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    self.isTouchBegin = YES;

    return NO;
}

@end
