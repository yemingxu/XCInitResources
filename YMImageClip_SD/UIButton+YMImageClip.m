//
//  UIButton+YMImageClip.m
//  SDWebImage_Round
//
//  Created by JoeXu on 2018/5/3.
//  Copyright © 2018年 JoeXu. All rights reserved.
//

#import "UIButton+YMImageClip.h"

@implementation UIButton (YMImageClip)

- (void)ym_setImageWithURL:(NSURL *)url forState:(UIControlState)state radius:(NSUInteger)radius
{
    [self ym_setImageWithURL:url forState:state placeholderImage:nil options:0 radius:radius completed:nil];
}
- (void)ym_setImageWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder radius:(NSUInteger)radius
{
    [self ym_setImageWithURL:url forState:state placeholderImage:placeholder options:0 radius:radius completed:nil];
}
- (void)ym_setImageWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options radius:(NSUInteger)radius completed:(SDExternalCompletionBlock)completedBlock
{
    if (radius == CGFLOAT_MIN) {
        radius = self.frame.size.width/2.0;
    }
    
    if (radius == 0){
        [self sd_setImageWithURL:url forState:state placeholderImage:placeholder options:options completed:completedBlock];
        return;
    }
    NSString *cacheKey = [UIImage ym_keyOfStoredImageForURL:url radius:radius size:self.frame.size];
    UIImage *cachedImg = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:cacheKey];

    if (cachedImg){
        [self setImage:cachedImg forState:state];
    }else{
        [self sd_setImageWithURL:url forState:state placeholderImage:placeholder options:options completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            if (!error){
                UIImage *roundImage = [image ym_roundedImageWithSize:self.frame.size radius:radius];
                [self setImage:roundImage forState:state];
                [[SDImageCache sharedImageCache] storeImage:roundImage forKey:cacheKey completion:nil];
            }
            if (completedBlock){completedBlock(image,error,cacheType,imageURL);}
        }];
    }
}



@end
