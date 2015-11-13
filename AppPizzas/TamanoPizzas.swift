//
//  TamanoPizzas.swift
//  AppPizzas
//
//  Created by Arturo Barreto Villafán on 11/10/15.
//  Copyright © 2015 Arturo Barreto Villafán. All rights reserved.
//

import UIKit

class TamanoPizzas: UIViewController {

    var chica : Bool = false
    var mediana : Bool = false
    var grande : Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func chica(sender: UIButton) {
        chica = true
        mediana = false
        grande = false
    }
   
    @IBAction func mediana(sender: UIButton) {
        
        chica = false
        mediana = true
        grande = false
    }
    @IBAction func grande(sender: UIButton) {
        chica = false
        mediana = false
        grande = true
    }
    
    
    func pizzaElegida()->String{
          var elegida  = ""
        
        if chica == true{
            elegida = "Pizza Chica"
            
        }
        else if mediana == true{
            elegida = "Pizza Mediana"
        }
        
        else if grande == true{
            elegida = "Pizza Grande"
        }
        
      
        
        
        return elegida
    }
    
    @IBAction func nextMasa(sender: UIButton) {
        
        if chica == false && mediana == false && grande == false{
            
            
            let alercontroller = UIAlertController(title: nil, message: "Elija un Tamaño de Pizza Porfavor", preferredStyle: UIAlertControllerStyle.Alert)
            alercontroller.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Destructive, handler: nil))
            
            self.presentViewController(alercontroller, animated: true, completion: nil)
            
        }
        else{
            pizzaElegida()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let resultado = pizzaElegida()
        let vistaMasa = segue.destinationViewController as! TipoMasa
        vistaMasa.tamanoPizza = resultado
        
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
