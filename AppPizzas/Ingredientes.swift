//
//  Ingredientes.swift
//  AppPizzas
//
//  Created by Arturo Barreto Villafán on 11/11/15.
//  Copyright © 2015 Arturo Barreto Villafán. All rights reserved.
//

import UIKit

class Ingredientes: UIViewController {
    
    var tamano = "", masa = "", queso = ""
    var ingrediente = ""
    var ingredientes : [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("\(tamano)  \(masa)  \(queso)")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }

    
 
    
    
    
    @IBAction func ingredientes(sender: UIButton) {
       ingrediente = sender.currentTitle!
   
         ingredientes.append(ingrediente)
        
        if ingredientes.count >= 6{
            
            let alercontroller = UIAlertController(title: nil, message: "Solo son 5 Ingredientes", preferredStyle: UIAlertControllerStyle.Alert)
            alercontroller.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Destructive, handler: nil))
            
            self.presentViewController(alercontroller, animated: true, completion: nil)
            
        }
        
   

    }
    
    
    func ingredientes2()->[String]{
        
        var ingre : [String] = []
        for (var i = 0; i < ingredientes.count; i++){
            ingre.append(ingredientes[i])
            
            
        }
        
        return ingre
        
    }
    @IBAction func nextConfirmacion(sender: UIButton) {
        if ingredientes.count == 0{
            let alercontroller = UIAlertController(title: nil, message: "Elija al Menos Un Ingrediente", preferredStyle: UIAlertControllerStyle.Alert)
            alercontroller.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Destructive, handler: nil))
            
            self.presentViewController(alercontroller, animated: true, completion: nil)
            
          
        }
            
        else if ingredientes.count >= 6 {
            let i = ingredientes.count
            ingredientes.removeRange(5..<i)
        }
     
        
        else {
            ingredientes2()

        }
    }
    
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let vistaPizzaCorrecta = segue.destinationViewController as! PizzaCorrecta
        vistaPizzaCorrecta.tamanoPizza = tamano
        vistaPizzaCorrecta.masaPizza = masa
        vistaPizzaCorrecta.quesoPizza = queso
        vistaPizzaCorrecta.ingredientes = ingredientes2()
        
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
