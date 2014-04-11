//
//  Benefit.h
//  ListadoDeBeneficios
//
//  Created by Raul Quispe on 4/10/14.
//  Copyright (c) 2014 Kodebinario. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Benefit : NSObject
@property(nonatomic,strong)NSDate*createdAt;
@property(nonatomic,strong)NSDate*updatedAt;
@property(nonatomic,strong)NSString*name;
@property(nonatomic,strong)NSString*descripcion;
@property(nonatomic,strong)NSString*objectId;
-(void)loadWithDictionary:(NSDictionary*)data;
@end
