//
//  TipoMasa.swift
//  AppPizzas
//
//  Created by Arturo Barreto Villafán on 11/10/15.
//  Copyright © 2015 Arturo Barreto Villafán. All rights reserved.
//

import UIKit

class TipoMasa: UIViewController {
    
    var tamanoPizza = " "
    
    var delgada : Bool = false
    var crujiente : Bool = false
    var gruesa : Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        print("tamaño de pizza es \(tamanoPizza)")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func delagada(sender: UIButton) {
        
         delgada = true
         crujiente = false
         gruesa = false
    }
    
    
    
    @IBAction func crujiente(sender: UIButton) {
        
        delgada = false
        crujiente = true
        gruesa = false
    }
    
    
    
    @IBAction func gruesa(sender: UIButton) {
        
        delgada = false
        crujiente = false
        gruesa = true
    }
    
    
    
    func tipoMasa()-> String{
         var masa = ""
        
        if delgada == true{
            masa = " Masa Delgada"
        }
        else if crujiente == true{
            masa = "Masa Crujiente"
        }
        else if gruesa == true{
            masa = "Masa Gruesa"
        }
        
        return masa
    }
    @IBAction func nextQuesos(sender: UIButton) {
        
        if delgada == false && crujiente == false && gruesa == false{
            let alercontroller = UIAlertController(title: nil, message: "Elija un Tipo de Masa de Pizza Porfavor", preferredStyle: UIAlertControllerStyle.Alert)
            alercontroller.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Destructive, handler: nil))
            
            self.presentViewController(alercontroller, animated: true, completion: nil)
        }
        else {
             tipoMasa()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let  resultadoMasa = tipoMasa()
        
        let vistaQueso = segue.destinationViewController as! TipoQueso
        vistaQueso.tipoMasaElegido = resultadoMasa
        vistaQueso.tamanoPizzaElegido = tamanoPizza
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
