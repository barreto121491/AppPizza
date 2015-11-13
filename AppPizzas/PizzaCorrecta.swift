//
//  PizzaCorrecta.swift
//  AppPizzas
//
//  Created by Arturo Barreto Villafán on 11/11/15.
//  Copyright © 2015 Arturo Barreto Villafán. All rights reserved.
//

import UIKit


class PizzaCorrecta: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    var tamanoPizza = "", masaPizza = "", quesoPizza = ""
    var ingredientes : [String] = []
    let texCellIndetfier = "TextCell"
    @IBOutlet weak var tamano: UILabel!
    @IBOutlet weak var masa: UILabel!
    @IBOutlet weak var queso: UILabel!
    
    @IBOutlet weak var tablaIngredientes: UITableView!
  
    override func viewWillAppear(animated: Bool) {
        tamano.text = tamanoPizza
        masa.text = masaPizza
        queso.text = quesoPizza
        self.tablaIngredientes.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tablaIngredientes.dataSource = self
        

        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print(ingredientes)
        
        

        // Do any additional setup after loading the view.
    }
    
    
   
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredientes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : UITableViewCell = self.tablaIngredientes.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        cell.textLabel?.text = self.ingredientes[indexPath.row]
        
        
        return cell
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
