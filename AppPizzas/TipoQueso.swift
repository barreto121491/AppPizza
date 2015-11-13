//
//  TipoQueso.swift
//  AppPizzas
//
//  Created by Arturo Barreto Villafán on 11/11/15.
//  Copyright © 2015 Arturo Barreto Villafán. All rights reserved.
//

import UIKit

class TipoQueso: UIViewController {
    
    var mozarela : Bool = false, cheddar : Bool = false, parmesano : Bool = false, sinqueso : Bool = false
    
    var tamanoPizzaElegido = ""
    var tipoMasaElegido = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()

        print("\(tamanoPizzaElegido)  \(tipoMasaElegido)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func mozarela(sender: UIButton) {
        mozarela = true
        cheddar = false
        parmesano = false
        sinqueso = false
    }
    
    
    
    
    @IBAction func cheddar(sender: UIButton) {
        mozarela = false
        cheddar = true
        parmesano = false
        sinqueso = false
    }
    
    
    
    @IBAction func parmesano(sender: UIButton) {
        mozarela = false
        cheddar = false
        parmesano =  true
        sinqueso = false
    }
    
    
    
    @IBAction func sinQueso(sender: UIButton) {
        mozarela = false
        cheddar = false
        parmesano = false
        sinqueso = true
    }

    func quesoElegido()->String{
        var queso = ""
        if mozarela == true{
            queso = "Queso Mozarela"
        }
        else if cheddar == true{
            queso = "Queso Cheddar"
        }
        else if parmesano == true{
            queso = "Queso Parmesano"
        }
        
        else if sinqueso == true{
            queso = "Sin Queso"
        }
        return queso
    }
    
    
    @IBAction func nextIngredientes(sender: UIButton) {
        
        if mozarela == false && cheddar == false && parmesano == false && sinqueso == false{
            
            let alercontroller = UIAlertController(title: nil, message: "Elija un Tipo de Queso Porfavor", preferredStyle: UIAlertControllerStyle.Alert)
            alercontroller.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Destructive, handler: nil))
            
            self.presentViewController(alercontroller, animated: true, completion: nil)
            
        }
        else{
            
            quesoElegido()
            
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let resultadoQueso = quesoElegido()
        let vistaIngerdientes = segue.destinationViewController as! Ingredientes
        
        vistaIngerdientes.tamano = tamanoPizzaElegido
        vistaIngerdientes.masa = tipoMasaElegido
        vistaIngerdientes.queso = resultadoQueso
    }
    
    
    
    
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
