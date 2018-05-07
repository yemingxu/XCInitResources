//
//  UIImage+YMClip.m
//  SDWebImage_Round
//
//  Created by JoeXu on 2018/5/3.
//  Copyright © 2018年 JoeXu. All rights reserved.
//

#import "UIImage+YMImageClip.h"
#import <SDWebImage/SDImageCache.h>

@implementation UIImage (YMImageClip)

static void __addRoundedRectToPath(CGContextRef context, CGRect rect, float ovalWidth,
                                 float ovalHeight)
{
    float fw, fh;
    
    if (ovalWidth == 0 || ovalHeight == 0)
        {
        CGContextAddRect(context, rect);
        return;
        }
    
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, CGRectGetMinX(rect), CGRectGetMinY(rect));
    CGContextScaleCTM(context, ovalWidth, ovalHeight);
    fw = CGRectGetWidth(rect) / ovalWidth;
    fh = CGRectGetHeight(rect) / ovalHeight;
    
    //根据圆角路径绘制
    CGContextMoveToPoint(context, fw, fh/2);
    CGContextAddArcToPoint(context, fw, fh, fw/2, fh, 1);
    CGContextAddArcToPoint(context, 0, fh, 0, fh/2, 1);
    CGContextAddArcToPoint(context, 0, 0, fw/2, 0, 1);
    CGContextAddArcToPoint(context, fw, 0, fw, fh/2, 1);
    
    CGContextClosePath(context);
    CGContextRestoreGState(context);
}

- (UIImage *)ym_roundedImageWithSize:(CGSize)size radius:(NSInteger)radius
{
    CGFloat scale = [UIScreen mainScreen].scale;
    NSInteger r = radius * scale;
    int w = size.width * scale;
    int h = size.height * scale;
    
    UIImage *img = self;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL, w, h, 8, 4 * w, colorSpace, (CGBitmapInfo)kCGImageAlphaPremultipliedFirst);
    //CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect rect = CGRectMake(0, 0, w, h);
    
    CGContextBeginPath(context);
    __addRoundedRectToPath(context, rect, r, r);
    CGContextClosePath(context);
    CGContextClip(context);
    CGContextDrawImage(context, CGRectMake(0, 0, w, h), img.CGImage);
    CGImageRef imageMasked = CGBitmapContextCreateImage(context);
    img = [UIImage imageWithCGImage:imageMasked scale:scale orientation:UIImageOrientationUp];
    
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    CGImageRelease(imageMasked);
    
    return img;
}

- (UIImage *)ym_roundedImageWithRadius:(NSInteger)radius{
    return [self ym_roundedImageWithSize:self.size radius:radius];
}

static NSString *roundSuffixString = @"ym_img_round_suffix";
+ (NSString *)ym_keyOfStoredImageForURL:(NSURL *)url radius:(NSUInteger)radius size:(CGSize)size
{
    NSString *cacheKey = [NSString stringWithFormat:@"%@_%@_%i_%i_%i",url.absoluteString,roundSuffixString,(int)radius,(int)size.width,(int)size.height];
    return cacheKey;
}


@end
