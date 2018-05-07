//
//  UIButton+YMImageClip.h
//  SDWebImage_Round
//
//  Created by JoeXu on 2018/5/3.
//  Copyright © 2018年 JoeXu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImage+YMImageClip.h"
#import <UIButton+WebCache.h>

@interface UIButton (YMImageClip)

- (void)ym_setImageWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options radius:(NSUInteger)radius completed:(SDExternalCompletionBlock)completedBlock;

- (void)ym_setImageWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder radius:(NSUInteger)radius;

- (void)ym_setImageWithURL:(NSURL *)url forState:(UIControlState)state radius:(NSUInteger)radius;


@end
