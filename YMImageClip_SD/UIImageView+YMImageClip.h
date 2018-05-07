//
//  UIImageView+YMRound.h
//  SDWebImage_Round
//
//  Created by JoeXu on 2018/5/3.
//  Copyright © 2018年 JoeXu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImage+YMImageClip.h"
#import <UIImageView+WebCache.h>

@interface UIImageView (YMImageClip)

- (void)ym_setImageWithURL:(NSURL *)url radius:(NSUInteger)radius;

- (void)ym_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder radius:(NSUInteger)radius;

- (void)ym_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder radius:(NSUInteger)radius completed:(SDExternalCompletionBlock)completedBlock;

@end
