//
//  WSData.m
//  ListadoDeBeneficios
//
//  Created by Raul Quispe on 4/10/14.
//  Copyright (c) 2014 Kodebinario. All rights reserved.
//

#import "WSData.h"
#define urlBase @"https://api.parse.com/1/"
#define API_KEY @"wd3isSVXSDR82RbRUqbZtT6Sxc59DtJppCvkxxjS"
#define REST_API_KEY @"yBidBFinbutOiwy7ZflZ0QPuk04mthur6eq6d75h"
@implementation WSData

+(void)getListBenefitWithNotification:(NSString*)nameNotification{
    //nombre de la clase
    NSString*nameClass=@"Benefit";
    //concatenacion de metodo
    NSString*method=[NSString stringWithFormat:@"classes/%@",nameClass];
    //indicamos la url concatenacion de url con el metodo
    NSURL*url=[NSURL URLWithString:[urlBase stringByAppendingString:method]];
    //agregamos configuracion
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    //declaramos el tipo de operacion
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    //creamos nuestro request
    NSMutableURLRequest* request = [[NSMutableURLRequest alloc] initWithURL:url];
    //establecemos el tipo de metodo
    [request setHTTPMethod:@"GET"];
    //HEADERS VALUES
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    //agregamos los valores a la cabecera por que el servicio lo requiere
    [request addValue:API_KEY forHTTPHeaderField:@"X-Parse-Application-Id"];
    [request addValue:REST_API_KEY forHTTPHeaderField:@"X-Parse-REST-API-Key"];

    NSURLSessionDataTask * dataTask = [defaultSession dataTaskWithRequest:request
                                                        completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
                                                            //evaluamos si existe algun error
                                                            if(error == nil){
                                                                //declaramos un error que inicia con valor nil
                                                                NSError *jsonError = nil;
                                                                //formateando NSData
                                                                id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&jsonError];
                                                                if (jsonError==nil) {
                                                                    //evaluamos que sea del tipo de clase diccionario
                                                                    if ([jsonObject isKindOfClass:[NSDictionary class]]) {
                                                                        //sabemos que es un dicionario
                                                                        NSDictionary *jsonDictionary = (NSDictionary *)jsonObject;
                                                                        NSLog(@"%@",jsonDictionary);
                                                                    }
                                                                }else{
                                                                    //mostramos un mensaje de error
                                                                }


                                                            }else{
                                                                //mostramos un mensaje de error
                                                            }
                                                            
                                                        }];
    
    [dataTask resume];
    
    
}
@end

