//
//  Benefit.m
//  ListadoDeBeneficios
//
//  Created by Raul Quispe on 4/10/14.
//  Copyright (c) 2014 Kodebinario. All rights reserved.
//

#import "Benefit.h"

@implementation Benefit
@synthesize createdAt,updatedAt;
@synthesize name;
@synthesize objectId;
@synthesize descripcion;
-(void)loadWithDictionary:(NSDictionary*)data
{
    name=[NSString stringWithFormat:@"%@",[data objectForKey:@"name"]];
    descripcion=[NSString stringWithFormat:@"%@",[data objectForKey:@"description"]];
    objectId=[NSString stringWithFormat:@"%@",[data objectForKey:@"objectId"]];
#warning Raul Quispe: me falta inicializar las propiedades NSdate
}
@end
