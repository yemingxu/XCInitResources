//
//  UIImage+YMClip.h
//  SDWebImage_Round
//
//  Created by JoeXu on 2018/5/3.
//  Copyright © 2018年 JoeXu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (YMImageClip)
- (UIImage *)ym_roundedImageWithSize:(CGSize)size radius:(NSInteger)radius;

- (UIImage *)ym_roundedImageWithRadius:(NSInteger)radius;

/**
 SD缓存替换
 */
+ (NSString *)ym_keyOfStoredImageForURL:(NSURL *)url radius:(NSUInteger)radius size:(CGSize)size;

@end
